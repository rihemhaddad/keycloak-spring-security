package fr.rhajco.keycloak.docker;

import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.Collections;
import java.util.Set;

import lombok.NonNull;
import org.testcontainers.containers.GenericContainer;
import org.testcontainers.containers.wait.strategy.LogMessageWaitStrategy;

public class KeycloakContainer extends GenericContainer<KeycloakContainer> {

	public static final String IMAGE_VERSION = "jboss/keycloak:12.0.4";

	public KeycloakContainer(@NonNull String dockerImageName) {
		super(dockerImageName);
		this.waitStrategy = new LogMessageWaitStrategy()
				.withRegEx(".*Admin console listening.*")
				.withStartupTimeout(Duration.of(180, ChronoUnit.SECONDS));
	}

	@Override
	public Set<Integer> getLivenessCheckPortNumbers() {
		return Collections.singleton(getMappedPort(8080));
	}

	@Override
	protected void configure() {
		this.addExposedPort(8080);
		this.addEnv("DB_ADDR", "postgres");
		this.addEnv("DB_PORT", "5432");
		this.addEnv("DB_DATABASE", "keycloak");
		this.addEnv("DB_SCHEMA", "public");
		this.addEnv("DB_USER", "keycloak");
		this.addEnv("DB_PASSWORD", "keycloak");
	}

	@Override
	public void start() {
		super.start();
		System.setProperty("KEYCLOAK_URL", String.format("http://%s:%d/auth", this.getContainerIpAddress(), getMappedPort(8080)));
	}
}
