package com.AourZ.PayStory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AourZ.PayStory.service.ChatbotService;
import com.AourZ.PayStory.service.STTService;
import com.AourZ.PayStory.service.TTSService;


@Controller
public class APIController {

	@Autowired
	private STTService sttService;
	
	@Autowired
	private TTSService ttsService;
	
	@Autowired
	private ChatbotService chatbotService;
	
	
	
	
	// 챗봇
	@RequestMapping("/chatbotForm")
	public String chatbotForm() {

		return "chatForm";
	}

}







