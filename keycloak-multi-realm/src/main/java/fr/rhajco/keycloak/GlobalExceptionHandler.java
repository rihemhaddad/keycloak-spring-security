package fr.rhajco.keycloak;

import java.time.LocalDateTime;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import feign.FeignException;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpServerErrorException;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
	@ExceptionHandler(FeignException.class)
	public ResponseEntity<CustomExceptionDto> handle(FeignException ex) {
		String message;
		final ObjectMapper objectMapper = new ObjectMapper();
		try {
			final HttpServerErrorException httpServerErrorException = objectMapper.readValue(ex.contentUTF8(), HttpServerErrorException.class);
			message = httpServerErrorException.getMessage();
		}
		catch (JsonProcessingException e) {
			log.error("Unable to parse FeignException", e);
			message = ex.getMessage();
		}
		return new ResponseEntity<>(new CustomExceptionDto(message, HttpStatus.valueOf(ex.status())), HttpStatus.valueOf(ex.status()));
	}


	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class CustomExceptionDto {
		private String message;

		private HttpStatus httpCode;

		private final LocalDateTime responseDate = LocalDateTime.now();
	}
}
