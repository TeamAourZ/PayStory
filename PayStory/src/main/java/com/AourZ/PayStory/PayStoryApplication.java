package com.AourZ.PayStory;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan(basePackageClasses = MemeberColler.class)
//@ComponentScan(basePackageClasses = AccountBookController.class)
//@MapperScan()
@ComponentScan(basePackages = { "com.AourZ.PayStory" })
@MapperScan(basePackages = { "com.AourZ.PayStory" })
public class PayStoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(PayStoryApplication.class, args);
	}

}
