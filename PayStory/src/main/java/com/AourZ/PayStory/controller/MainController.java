package com.AourZ.PayStory.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.AourZ.PayStory.model.member.MemberVO;
import com.AourZ.PayStory.service.accountBook.AccountBookService;


@Controller
public class MainController {
	
	@Autowired
    private AccountBookService memberService;
	
	private String nowDate() {
        LocalDate localDate = LocalDate.now();
        String year = Integer.toString(localDate.getYear());
        String month = zeroFill(localDate.getMonthValue());
        String day = zeroFill(localDate.getDayOfMonth());
        String date = year + "-" + month + "-" + day;

        return date;
    }
	
	@RequestMapping("/index")
	public String Landing() {
		return "index";
	}
	
	/* 숫자 0 채우기 */
	private String zeroFill(int num) {
		String text = "";

		if (num < 10) {
			text = "0" + Integer.toString(num);
		} else {
			text = Integer.toString(num);
		}

		return text;
	}
	
	// 챗봇 Form
	@RequestMapping("/chatbotForm")
	public String chatbotForm(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String memberNo = (String)session.getAttribute("memberNo");
		String date = nowDate();
				
		MemberVO member = memberService.selectMemberInfo("memberNo", memberNo);
		String memberName = member.getMemberName();
		String memberImage = member.getMemberImage();
		
		model.addAttribute("memberName", memberName);
		model.addAttribute("memberImage", memberImage);
		model.addAttribute("date", date);
		
		return "chatbot/chatForm";
	}

}
