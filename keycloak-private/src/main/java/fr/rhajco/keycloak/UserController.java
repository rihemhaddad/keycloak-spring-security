package fr.rhajco.keycloak;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.keycloak.OAuth2Constants;
import org.keycloak.adapters.springboot.KeycloakSpringBootProperties;
import org.keycloak.adapters.springsecurity.account.SimpleKeycloakAccount;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.AccessTokenResponse;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.RoleRepresentation;
import org.keycloak.representations.idm.UserRepresentation;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/user")
@Slf4j
@RequiredArgsConstructor
public class UserController {

	private final KeycloakSpringBootProperties properties;

	private final KeycloakClient keycloakClient;

	@GetMapping
	@PreAuthorize("isAnonymous()")
	public AccessTokenResponse login(@RequestParam String username, @RequestParam String password) {
		Map<String, String> credentialsMap = new HashMap<>();
		credentialsMap.put(OAuth2Constants.USERNAME, username);
		credentialsMap.put(OAuth2Constants.PASSWORD, password);
		credentialsMap.put(OAuth2Constants.CLIENT_ID, this.properties.getResource());
		credentialsMap.put(OAuth2Constants.CLIENT_SECRET, String.valueOf(this.properties.getCredentials().get("secret")));
		credentialsMap.put(OAuth2Constants.GRANT_TYPE, OAuth2Constants.PASSWORD);
		return this.keycloakClient.getToken(this.properties.getRealm(), credentialsMap);
	}

	@PostMapping
	public ResponseEntity<Object> create(@RequestParam String username, @RequestParam String password, @RequestParam String email) {
		try (Keycloak kc = this.keycloakAsAdmin()) {
			final UsersResource resource = kc.realm(this.properties.getRealm()).users();
			final UserRepresentation user = this.createUser(username, password, email);
			final Response response = resource.create(user);

			// Handle error
			if (201 != response.getStatus()) {
				return ResponseEntity.status(response.getStatus()).body(response.readEntity(String.class));
			}

			// Search user created, because response dont show the userId
			final UserRepresentation userCreated = getUserRepresentation(username, resource);

			// Assign new role
			final RoleRepresentation privateRole = kc.realm(this.properties.getRealm()).roles().list()
					.stream()
					.filter(roleRepresentation -> "PRIVATE_USER".equals(roleRepresentation.getName()))
					.findFirst()
					.orElseThrow(() -> new RuntimeException("No role PRIVATE_USER"));
			resource.get(userCreated.getId()).roles().realmLevel()
					.add(Collections.singletonList((privateRole)));

			return ResponseEntity.ok(getUserRepresentation(username, resource));
		}
	}


	@PutMapping
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<UserRepresentation> updatePassword(@RequestParam String password) {
		final String username = ((SimpleKeycloakAccount) SecurityContextHolder.getContext().getAuthentication().getDetails()).getKeycloakSecurityContext().getToken().getPreferredUsername();
		try (Keycloak kc = this.keycloakAsAdmin()) {
			final UsersResource resource = kc.realm(this.properties.getRealm()).users();
			final UserRepresentation user = getUserRepresentation(username, resource);
			final CredentialRepresentation credential = new CredentialRepresentation();
			credential.setValue(password);
			credential.setTemporary(false);
			credential.setType(CredentialRepresentation.PASSWORD);
			resource.get(user.getId()).resetPassword(credential);

			return ResponseEntity.ok(getUserRepresentation(username, resource));
		}
	}

	@PostMapping("/refresh")
	@PreAuthorize("isAuthenticated()")
	public AccessTokenResponse refreshToken(@RequestParam String refreshToken) {
		Map<String, String> credentialsMap = new HashMap<>();
		credentialsMap.put(OAuth2Constants.REFRESH_TOKEN, refreshToken);
		credentialsMap.put(OAuth2Constants.CLIENT_ID, this.properties.getResource());
		credentialsMap.put(OAuth2Constants.CLIENT_SECRET, String.valueOf(this.properties.getCredentials().get("secret")));
		credentialsMap.put(OAuth2Constants.GRANT_TYPE, OAuth2Constants.REFRESH_TOKEN);
		return this.keycloakClient.getToken(this.properties.getRealm(), credentialsMap);

	}

	private Keycloak keycloakAsAdmin() {
		return KeycloakBuilder.builder()
				.serverUrl(this.properties.getAuthServerUrl())
				.realm(this.properties.getRealm())
				.clientId(this.properties.getResource())
				.clientSecret(String.valueOf(this.properties.getCredentials().get("secret")))
				.grantType(OAuth2Constants.CLIENT_CREDENTIALS)
				.build();
	}

	private UserRepresentation createUser(String username, String password, String email) {
		final UserRepresentation user = new UserRepresentation();
		user.setUsername(username);
		user.setEmail(email);
		user.setEnabled(true);
		user.setEmailVerified(true);

		// Credentials
		CredentialRepresentation credentials = new CredentialRepresentation();
		credentials.setTemporary(false);
		credentials.setType(CredentialRepresentation.PASSWORD);
		credentials.setValue(password);
		user.setCredentials(Collections.singletonList(credentials));

		return user;
	}

	private UserRepresentation getUserRepresentation(String username, UsersResource resource) {
		final List<UserRepresentation> search = resource.search(username, true);
		if (search == null || search.size() != 1) {
			throw new RuntimeException("Error during Keycloak Search");
		}
		return search.get(0);
	}
}
