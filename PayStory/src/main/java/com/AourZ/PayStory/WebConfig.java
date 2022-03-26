package com.AourZ.PayStory;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///C:/PayStory/images/") //local
		.addResourceLocations("file:///upload/"); //server
		
		registry.addResourceHandler("/voice/**")
		.addResourceLocations("file:///C:/PayStory/upload/") //local
		.addResourceLocations("file:///upload/"); //server
		
	}
}
