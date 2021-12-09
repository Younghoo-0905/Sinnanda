package com.b2.Sinnanda;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class SinnandaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SinnandaApplication.class, args);
	}

}
