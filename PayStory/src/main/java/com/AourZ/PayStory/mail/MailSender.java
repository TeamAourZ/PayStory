package com.AourZ.PayStory.mail;

import java.util.Properties;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailSender extends JavaMailSenderImpl implements IMailSender{
		
		@Value("${spring.mail.properties.mail.smtp.starttls.enable}")
		private String enable;
		
		@Value("${spring.mail.properties.mail.smtp.auth}")
		private String propertiesMailSmtpAuth;
		
		@Value("${spring.mail.protocol}")
		private String propertiesTransportProtocol;
		
		@Value("${spring.mail.properties.mail.smtp.starttls.reqired}")
		private String propertiesMailSmtpStarttlsRequired;
		
		@Value("${spring.mail.host}")
		private String host;
		
		@Value("${spring.mail.port}")
		private int port;
		
		@Value("${spring.mail.username}")
		private String username;
		
		@Value("${spring.mail.password}")
		private String password;
		
		@Value("${spring.mail.default-encoding}")
		private String defaultEncoding;
		
		private Properties properties = new Properties();
		
		@PostConstruct
		protected void postCunstruct() {
			initJavaMailProperties();
			setHost(host);
			setPort(port);
			setUsername(username);
			setPassword(password);
			setDefaultEncoding("utf-8");
			setJavaMailProperties(properties);
		}
		
		private void initJavaMailProperties() {
			properties.put("mail.properties.mail.smtp.auth", propertiesMailSmtpAuth);
			properties.put("mail.protocol", propertiesTransportProtocol);
			properties.put("mail.smtp.starttls.enable", enable );
			properties.put("mail.properties.mail.smtp.starttls.reqired", propertiesMailSmtpStarttlsRequired);
		}
}
