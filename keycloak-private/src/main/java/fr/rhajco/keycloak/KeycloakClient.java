package fr.rhajco.keycloak;

import java.util.Map;

import org.keycloak.representations.AccessTokenResponse;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(contextId = "keycloakClient", name = "keycloak", url = "${keycloak.auth-server-url}", configuration = FeignFormEncoderConfig.class)
public interface KeycloakClient {
	@PostMapping(
			value = "/realms/{realm}/protocol/openid-connect/token",
			consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE,
			produces = MediaType.APPLICATION_JSON_VALUE
	)
	AccessTokenResponse getToken(@PathVariable String realm, @RequestBody Map<String, ?> credentialsMap);
}
