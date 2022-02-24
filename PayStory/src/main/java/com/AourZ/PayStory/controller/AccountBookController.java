package com.AourZ.PayStory.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;
import com.AourZ.PayStory.service.AccountBookService;

import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.ShareAccountBookVO;
import com.AourZ.PayStory.model.ShareBudgetVO;
import com.AourZ.PayStory.service.AccountCreateService;

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
		
		return incomeNo;
	}

	/* 지출 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/expenditure")
	public int addExpenditure(@RequestParam("expenditureDate") String date,
							  @RequestParam(value="expenditureImage", required = false) MultipartFile file,
							  @RequestParam("expenditureSource") String source,
							  @RequestParam("expenditureMemo") String memo,
							  @RequestParam("expenditureAddress") String address,
							  @RequestParam("expenditureAmount") int totalAmount,
							  @RequestParam("tagNo") String tagNo,
							  @RequestParam("expenditureItemName") String[] nameArray,
							  @RequestParam("expenditureItemPrice") int[] priceArray,
							  HttpSession session) throws IOException {
		
		// 파일 업로드 및 파일 이름 지정
		String fileName = null;
		if(file != null) {
			String uploadPath = "C:/PayStory/PayStory/src/main/resources/static/file/receipt/";

			String originalFileName = file.getOriginalFilename();
			fileName = originalFileName;
			String filePathName = uploadPath + originalFileName;
			// String uploadFileName = session.getAttribute("memberNo") +"_"+ session.getAttribute("accountBookNo")+"_"+originalFileName;
			// String filePathName = uploadPath + uploadFileName;
			File file1 = new File(filePathName);

			file.transferTo(file1);
		}
		
		ExpenditureVO vo = new ExpenditureVO();
		vo.setExpenditureDate(date);
		vo.setExpenditureImage(fileName);
		vo.setExpenditureSource(source);
		vo.setExpenditureMemo(memo);
		vo.setExpenditureAddress(address);
		vo.setExpenditureAmount(totalAmount);
		vo.setTagNo(tagNo);
		
		service.insertExpenditure(vo);
		int expenditureNo = vo.getExpenditureNo();
		
		if(expenditureNo != 0) {
			ArrayList<ExpenditureItemVO> expenditureItemList = new ArrayList<ExpenditureItemVO>();
			for(int i=0; i<nameArray.length; i++) {
				ExpenditureItemVO vo2 = new ExpenditureItemVO();
				vo2.setExpenditureNo(expenditureNo);
				vo2.setExpenditureItemName(nameArray[i]);
				vo2.setExpenditureItemPrice(priceArray[i]);
				expenditureItemList.add(vo2);
			}
			service.insertExpenditureItem(expenditureItemList);
		}
		return expenditureNo;
	}

	/****** 공유 가계부  ******/
	
	//공유가계부 메인
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
