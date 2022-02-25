package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/index")
	public String Landing() {
		return "index";
	}

	// 챗봇 Form
	@RequestMapping("/chatbotForm")
	public String chatbotForm() {
		return "chatbot/chatForm";
	}

}
