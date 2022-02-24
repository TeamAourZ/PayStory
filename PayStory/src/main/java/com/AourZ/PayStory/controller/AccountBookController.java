package com.AourZ.PayStory.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.ShareAccountBookVO;
import com.AourZ.PayStory.model.ShareBudgetVO;
import com.AourZ.PayStory.service.AccountCreateService;

@Controller
public class AccountBookController {

	@Autowired
	AccountCreateService service;

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

	
	
	// 공유가계부 메인화면
	@RequestMapping("/accountBook/public/main")
	public String movePublicMain() {
		
		
		
		
		
		
		
		
		
		return "accountBook/public/main";
	}

	// 공유가계부 생성화면
	@RequestMapping("/accountBook/public/create")
	public String movePublicCreate() {
		return "accountBook/public/create";
	}

	// 공유가계부 생성
	@RequestMapping("/accountBook/public/create/do")
	public String createShareAccountBook(AccountBookVO accountBook, ShareAccountBookVO shareAccountBook, 
			ShareBudgetVO ShareBudget,HttpSession httpSession) {

		
			// 가계부 데이터 등록(공유가계부 전용)
			accountBook.setShared(true);
			accountBook.setMemberNo((String) httpSession.getAttribute("owner"));
			service.createAccountBook(accountBook);
			
			
			// 예산 등록(공유가계부 전용)
			ShareBudget.setOwner((String) httpSession.getAttribute("owner"));
			service.createShareBudget(ShareBudget);
			
			
			// 공유가계부 데이터 등록(공유가계부 전용)
			shareAccountBook.setOwner((String) httpSession.getAttribute("owner"));
			String participant = "";
			
			for (int i = 0; i < shareAccountBook.getParticipant_list().length; i++) {
				participant = shareAccountBook.getParticipant_list()[i];
				if (participant == null) {
					continue;
				}
				shareAccountBook.setParticipant(participant);
				service.createShareAccountBook(shareAccountBook);
			}
		 
		

		return "redirect:../main";
		// return "redirect:/product/listAllProduct"; // 이렇게 해도 됨
	}

	// 공유가계부 참여자 등록,삭제
	@RequestMapping("/accountBook/public/registerParticipant")
	public String moveRegisterParticipant() {
		return "accountBook/public/registerParticipant";
	}
}
