package com.yetsul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan("com.yetsul")
@SpringBootApplication
public class YetsulApplication {

	public static void main(String[] args) {
		SpringApplication.run(YetsulApplication.class, args);
	}

}
