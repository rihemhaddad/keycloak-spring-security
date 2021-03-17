package fr.rhajco.keycloak;

import com.fasterxml.jackson.databind.ObjectMapper;
import fr.rhajco.keycloak.docker.KeycloakContainer;
import lombok.SneakyThrows;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.keycloak.representations.AccessTokenResponse;
import org.testcontainers.containers.GenericContainer;
import org.testcontainers.containers.Network;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.DockerImageName;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static fr.rhajco.keycloak.docker.KeycloakContainer.IMAGE_VERSION;
import static org.springframework.http.HttpHeaders.AUTHORIZATION;
import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Testcontainers
@AutoConfigureMockMvc
@SpringBootTest
class KeycloakN1ApplicationTests {

	@Container
	public static final GenericContainer postgresContainer = new PostgreSQLContainer<>(DockerImageName.parse("jordancouret/postgres-keycloak-conf:latest")
			.asCompatibleSubstituteFor("postgres"))
			.withUsername("keycloak")
			.withDatabaseName("keycloak")
			.withPassword("keycloak")
			.withNetworkAliases("postgres")
			.withNetwork(Network.SHARED);

	@Container
	public static final KeycloakContainer keycloakContainer = new KeycloakContainer(IMAGE_VERSION)
			.withNetwork(Network.SHARED);


	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private ObjectMapper mapper;

	@SneakyThrows
	@DisplayName("Should authenticate user")
	@Test
	void shouldLogin() {
		mockMvc.perform(MockMvcRequestBuilders.get("/user")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.queryParam("username", "jco")
				.queryParam("password", "password"))
				.andExpect(status().is2xxSuccessful())
				.andExpect(jsonPath("$.access_token").exists())
				.andExpect(jsonPath("$.refresh_token").exists());

	}

	@SneakyThrows
	@DisplayName("Should authenticate user and then refresh token")
	@Test
	void shouldLoginAndRefresh() {
		final String json = mockMvc.perform(MockMvcRequestBuilders.get("/user")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.queryParam("username", "jco")
				.queryParam("password", "password"))
				.andExpect(status().is2xxSuccessful())
				.andExpect(jsonPath("$.access_token").exists())
				.andExpect(jsonPath("$.refresh_token").exists())
				.andReturn()
				.getResponse()
				.getContentAsString();

		final AccessTokenResponse response = mapper.readValue(json, AccessTokenResponse.class);

		mockMvc.perform(MockMvcRequestBuilders.post("/user/refresh")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.header(AUTHORIZATION, String.format("Bearer %s", response.getToken()))
				.queryParam("refreshToken", response.getRefreshToken()))
				.andExpect(status().is2xxSuccessful())
				.andExpect(jsonPath("$.refresh_token").exists())
				.andExpect(jsonPath("$.access_token").exists());
	}

	@SneakyThrows
	@DisplayName("Should create user and then log in")
	@Test
	void shouldCreate() {
		mockMvc.perform(MockMvcRequestBuilders.post("/user")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.queryParam("email", "other@yopmail")
				.queryParam("username", "other")
				.queryParam("password", "password"))
				.andExpect(status().isOk());

		mockMvc.perform(MockMvcRequestBuilders.get("/user")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.queryParam("username", "other")
				.queryParam("password", "password"))
				.andExpect(status().is2xxSuccessful())
				.andExpect(jsonPath("$.access_token").exists())
				.andExpect(jsonPath("$.refresh_token").exists());
	}

	@SneakyThrows
	@DisplayName("Should update password with acces_token")
	@Test
	void shouldUpdatePassword() {
		final String newPassword = "newPassword";

		// Get ACCESS_TOKEN
		final String json = mockMvc.perform(MockMvcRequestBuilders.get("/user")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.queryParam("username", "jcorha")
				.queryParam("password", "password"))
				.andExpect(status().isOk())
				.andReturn()
				.getResponse()
				.getContentAsString();

		final AccessTokenResponse response = mapper.readValue(json, AccessTokenResponse.class);

		// UPDATE PASSWORD
		mockMvc.perform(MockMvcRequestBuilders.put("/user")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.header(AUTHORIZATION, String.format("Bearer %s", response.getToken()))
				.queryParam("password", newPassword))
				.andExpect(status().is2xxSuccessful());

		// TRY LOGIN WITH NEW ONE
		mockMvc.perform(MockMvcRequestBuilders.get("/user")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.queryParam("username", "jcorha")
				.queryParam("password", newPassword))
				.andExpect(status().isOk());
	}

	@SneakyThrows
	@DisplayName("Should deny updatePassword's API without authentication")
	@Test
	void shouldDenyApi() {
		mockMvc.perform(MockMvcRequestBuilders.put("/user")
				.contentType(APPLICATION_JSON)
				.accept(APPLICATION_JSON)
				.queryParam("password", "NEW_PASSWORD"))
				.andExpect(status().is4xxClientError());
	}
}
