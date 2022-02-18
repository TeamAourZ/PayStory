package com.AourZ.PayStory.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.AourZ.PayStory.mail.IMailSender;
import com.AourZ.PayStory.mail.MailSender;

@Configuration
public class ServerConfigure implements WebMvcConfigurer{	
	
	//인터셉터 주소 세팅
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/member/login")
		        .excludePathPatterns("/member/register");
	}
	
	public IMailSender mailSender() {
		return new MailSender();
	}

}