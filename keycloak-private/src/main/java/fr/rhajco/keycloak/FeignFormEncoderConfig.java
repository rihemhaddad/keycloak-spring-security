package fr.rhajco.keycloak;

import feign.Logger;
import feign.Logger.Level;
import feign.codec.Encoder;
import feign.form.spring.SpringFormEncoder;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.cloud.openfeign.support.SpringEncoder;
import org.springframework.context.annotation.Bean;

public class FeignFormEncoderConfig {

	// Necessary to send Map<String, ?> in feign client
	@Bean
	Encoder feignFormEncoder(ObjectFactory<HttpMessageConverters> converters) {
		return new SpringFormEncoder(new SpringEncoder(converters));
	}

	// Log all request using this config if package is set to trace
	@Bean
	Logger.Level feignLoggerLevel() {
		return Level.FULL;
	}

}
