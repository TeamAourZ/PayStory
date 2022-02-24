package com.AourZ.PayStory;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.AourZ.PayStory.dao.IShareAccountDAO;

@SpringBootApplication
@ComponentScan(basePackages = { "com.AourZ.PayStory" })
@MapperScan(basePackages = { "com.AourZ.PayStory" }) 
/* @MapperScan(basePackageClasses = IShareAccountDAO.class) */
public class PayStoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(PayStoryApplication.class, args);
	}

}
