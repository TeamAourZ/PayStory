package com.AourZ.PayStory;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///usr/local/tomcat9/webapps/ROOT/WEB-INF/classes/static/paystory/images/");
		
		registry.addResourceHandler("/voice/**")
		.addResourceLocations("file:///PayStory/upload/");
	}
	
}
