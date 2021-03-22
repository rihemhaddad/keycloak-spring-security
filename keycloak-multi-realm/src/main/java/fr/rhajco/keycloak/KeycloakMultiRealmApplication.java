package fr.rhajco.keycloak;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class KeycloakMultiRealmApplication {
	public static void main(String[] args) {
		SpringApplication.run(KeycloakMultiRealmApplication.class, args);
	}
}
