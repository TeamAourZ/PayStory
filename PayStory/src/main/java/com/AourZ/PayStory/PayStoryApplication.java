package com.AourZ.PayStory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.AourZ.PayStory.controller.AccountBookController;
import com.AourZ.PayStory.controller.MemeberColler;

@SpringBootApplication
//@ComponentScan(basePackageClasses = MemeberColler.class)
//@ComponentScan(basePackageClasses = AccountBookController.class)
@ComponentScan(basePackages = { "com.AourZ.PayStory" })
public class PayStoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(PayStoryApplication.class, args);
	}

}
