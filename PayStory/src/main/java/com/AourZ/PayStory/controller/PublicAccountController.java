package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PublicAccountController {
	
	//공유가계부 메인
	@RequestMapping("/publicmain")
	public String movePublicMain() {
		return "boardPublic/publicMain";
	}
	
	//공유가계부 생성
	@RequestMapping("/test")
	public String movePublicCreate() {
		return "boardPublic/publicCreate";
	}
	
	
	
	//공유가계부 참여자 등록,삭제
	@RequestMapping("/publicRegisterParticipant")
	public String moveRegisterParticipant() {
		return "boardPublic/publicRegisterParticipant";
	}
	
	
	
	
}
