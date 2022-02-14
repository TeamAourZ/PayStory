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
	
	/* 달력 B */
	@RequestMapping("/calendarBig")
	public String calendarBig() {
		return "accountBook/calendarBig";
	}

	/* 달력 S */
	@RequestMapping("/calendarSmall")
	public String calendarSmall() {
		return "accountBook/calendarSmall";
	}

	@RequestMapping("/accountBook/add")
	public String addForm() {
		return "accountBook/addForm";
	}
}
