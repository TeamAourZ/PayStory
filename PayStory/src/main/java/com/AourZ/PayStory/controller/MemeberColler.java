package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemeberColler {
	
	@RequestMapping("/")
	public String Landing() {
		return "index";
	}

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/loginTest")
	public String loginTest() {
		return "member/loginTest";
	}

	@RequestMapping("/register")
	public String register() {
		return "member/register";
	}
	
	@RequestMapping("/chatbot")
	public String chatbot() {
		return "chatbot/chatbot";
	}
	
}
