package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemeberColler {
	@RequestMapping("/")
	public String index() {
		return "accountBook/addForm";
	}

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	@RequestMapping("/register")
	public String register() {
		return "member/register";
	}
	
	@RequestMapping("/chatbotP")
	public String chatbotP() {
		return "chatbot/chatbot";
	}
	
}
