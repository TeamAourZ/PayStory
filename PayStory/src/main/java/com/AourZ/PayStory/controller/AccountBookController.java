package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountBookController {
	@RequestMapping("/accountBook/add")
	public String addForm() {
		return "accountBook/addForm";
	}
}
