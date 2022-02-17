package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountBookController {
	/* 대시보드 홈 */
	@RequestMapping("/home")
	public String home() {
		return "accountBook/home";
	}
	
	/* 대시보드 조회 */
	@RequestMapping("/detailView")
	public String detailView() {
		return "accountBook/detailView";
	}
	
	/* 달력 A */
	@RequestMapping("/calendarTypeA")
	public String calendarTypeA() {
		return "accountBook/calendarTypeA";
	}

	/* 달력 B */
	@RequestMapping("/calendarTypeB")
	public String calendarTypeB() {
		return "accountBook/calendarTypeB";
	}

	@RequestMapping("/accountBook/add")
	public String addForm() {
		return "accountBook/addForm";
	}
}
