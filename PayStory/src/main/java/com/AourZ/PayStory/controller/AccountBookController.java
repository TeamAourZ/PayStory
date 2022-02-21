package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AccountBookController {
	/* 대시보드 홈 */
	@RequestMapping("/accountBook/main")
	public String home() {
		return "accountBook/home";
	}
	
	/* 대시보드 조회 */
	@RequestMapping("/accountBook/detailView")
	public String detailView() {
		return "accountBook/detailView";
	}
	
	/* 달력 A */
	@RequestMapping("/accountBook/calendarTypeA")
	public String calendarTypeA() {
		return "accountBook/calendarTypeA";
	}

	/* 달력 B */
	@RequestMapping("/accountBook/calendarTypeB")
	public String calendarTypeB() {
		return "accountBook/calendarTypeB";
	}
	
	/* 지출,수입 내역 추가 form */
	@RequestMapping("/accountBook/add")
	public String addForm() {
		return "accountBook/addForm";
	}
	
	/* 지출 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/expenditure")
	public String addExpenditure() {
		return "";
	}
	
	//공유가계부 메인
	@RequestMapping("/accountBook/public/main")
	public String movePublicMain() {
		return "boardPublic/publicMain";
	}
	
	//공유가계부 생성
	@RequestMapping("/accountBook/public/create")
	public String movePublicCreate() {
		return "boardPublic/publicCreate";
	}
	
	
	//공유가계부 참여자 등록,삭제
	@RequestMapping("/accountBook/public/registerParticipant")
	public String moveRegisterParticipant() {
		return "boardPublic/publicRegisterParticipant";
	}
}
