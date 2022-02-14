package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountBookController {
	@RequestMapping("/home")
	public String home() {
		return "accountBook/home";
	}

	@RequestMapping("/detailView")
	public String detailView() {
		return "accountBook/detailView";
	}

	@RequestMapping("/accountBook/add")
	public String addForm() {
		return "accountBook/addForm";
	}
}
