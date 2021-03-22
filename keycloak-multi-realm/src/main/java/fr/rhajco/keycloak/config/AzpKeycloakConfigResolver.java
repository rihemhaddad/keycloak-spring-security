package fr.rhajco.keycloak.config;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.keycloak.TokenVerifier;
import org.keycloak.adapters.KeycloakDeployment;
import org.keycloak.adapters.KeycloakDeploymentBuilder;
import org.keycloak.adapters.spi.HttpFacade.Request;
import org.keycloak.adapters.springboot.KeycloakSpringBootConfigResolver;
import org.keycloak.adapters.springboot.KeycloakSpringBootProperties;
import org.keycloak.common.VerificationException;
import org.keycloak.representations.AccessToken;
import org.keycloak.representations.adapters.config.AdapterConfig;

import static org.springframework.http.HttpHeaders.AUTHORIZATION;

/**
 * Build the keycloak
 */
@RequiredArgsConstructor
@Slf4j
public class AzpKeycloakConfigResolver extends KeycloakSpringBootConfigResolver {
	private final KeycloakSpringBootProperties keycloakSpringBootProperties;

	@Override
	public KeycloakDeployment resolve(Request request) {
		final String realm = this.extractRealmFromJWT(request);
		return KeycloakDeploymentBuilder.build(this.getConfig(realm));
	}

	private String extractRealmFromJWT(Request request) {
		final String header = request.getHeader(AUTHORIZATION);
		if (header != null && !header.isBlank() && header.startsWith("Bearer ")) {
			try {
				final String jwt = header.replaceFirst("Bearer ", "");
				final AccessToken  token = TokenVerifier.create(jwt, AccessToken.class).getToken();
				// Ex: multiple-1-client
				final String azp = token.getIssuedFor();

				// Transform in REALM name : multiple-1-client => MULTIPLE-1
				return CustomRealmProperties.convertClientToRealm(azp);
			}
			catch (VerificationException e) {
				log.error("Failed to parse token", e);
			}
		}
		return keycloakSpringBootProperties.getRealm();
	}

	private AdapterConfig getConfig(String realm) {
		final AdapterConfig config = new AdapterConfig();
		config.setAuthServerUrl(keycloakSpringBootProperties.getAuthServerUrl());
		config.setResource(keycloakSpringBootProperties.getResource());
		config.setSslRequired(keycloakSpringBootProperties.getSslRequired());
		config.setPublicClient(keycloakSpringBootProperties.isPublicClient());
		config.setBearerOnly(keycloakSpringBootProperties.isBearerOnly());
		config.setRealm(realm);
		return config;
	}
}
