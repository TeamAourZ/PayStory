package com.AourZ.PayStory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;
import com.AourZ.PayStory.service.AccountBookService;

@Controller
public class AccountBookController {
	@Autowired
	AccountBookService service;
	
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
	public String addItemForm() {
		return "accountBook/addItemForm";
	}
	
	/* 수입 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/income")
	public int addIncome(@RequestParam("incomeDate") String date,
						 @RequestParam("incomeSource") String source,
						 @RequestParam("incomeAmount") int amount,
						 @RequestParam("incomeMemo") String memo,
						 @RequestParam("tagNo") String tagNo) {
		
		IncomeVO vo = new IncomeVO();
		vo.setIncomeDate(date);
		vo.setIncomeSource(source);
		vo.setIncomeAmount(amount);
		vo.setIncomeMemo(memo);
		vo.setTagNo(tagNo);
		
		service.insertIncome(vo);
		
		int incomeNo = vo.getIncomeNo();
		// System.out.println(incomeNo);
		
		return incomeNo;
	}
	
	/* 지출 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/expenditure")
	public int addExpenditure() {
				
		ExpenditureVO evo = new ExpenditureVO();
		
		service.insertExpenditure(evo);
		
		int expenditureNo = evo.getExpenditureNo();
		
		ExpenditureItemVO eivo = new ExpenditureItemVO();
		
		return expenditureNo;
	}
	
	/****** 공유 가계부  ******/
	
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
