package fr.rhajco.keycloak.config;

import java.util.Map;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@Setter
@NoArgsConstructor
@ConfigurationProperties(prefix = "custom")
public class CustomRealmProperties {

	private Map<String, String> mapRealmSecret;

	public static String convertRealmToClient(String realm) {
		return realm.toLowerCase().concat("-client");
	}

	public static String convertClientToRealm(String client) {
		return client.replace("-client", "").toUpperCase();
	}
}
