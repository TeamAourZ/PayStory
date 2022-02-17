package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PublicAccountController {
	@RequestMapping("/publicmain")
	public String movePublicMain() {
		return "boardPublic/publicMain";
	}
	
	@RequestMapping("/test")
	public String movePublicCreate() {
		return "boardPublic/publicCreate";
	}
	
	@RequestMapping("/publicRegisterParticipant")
	public String moveRegisterParticipant() {
		return "boardPublic/publicRegisterParticipant";
	}
}
