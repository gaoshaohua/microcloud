package com.micro.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@EnableCaching
public class MicroplatformApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroplatformApplication.class, args);
	}

	@PostMapping("/test")
	public String test() {
		return "123";
	}
}
