package com.example.diary;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class Diary1Application {

	public static void main(String[] args) {
		SpringApplication.run(Diary1Application.class, args);
	}

}
