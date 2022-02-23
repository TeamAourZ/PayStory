package com.AourZ.PayStory.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.AourZ.PayStory.model.IncomeVO;
import com.AourZ.PayStory.service.IncomeService;

@Controller
public class IncomeController {
	
	@Autowired
	IncomeService service;
	
	// 전체 상품 조회
	@RequestMapping("/listAllIncome")
	public String listAllIncome(Model model) {
		ArrayList<IncomeVO> incomeList = service.listAllIncome();
		model.addAttribute("incomeList", incomeList);		
		return "chatbot/chatIncome";
	}
	
	// 상품 검색 폼으로 이동
	@RequestMapping("/income/incomeSearchForm")
	public String incomeSearchForm() {
		return "chatbot/chatSearch";
	}
	
	// 상품 검색
	@ResponseBody
	@RequestMapping("/income/incomeSearch")
	public ArrayList<IncomeVO> incomeSearch(@RequestParam HashMap<String, Object> param, 
																				Model model){
		
		ArrayList<IncomeVO> incomeList = service.incomeSearch(param);
		model.addAttribute("incomeList", incomeList);
		
//		// prdList로 제대로 반화되었는지 확인하기 위한 코드
//		for(int i =0; i < incomeList.size(); i++) {
//			IncomeVO income = (IncomeVO) incomeList.get(i);
//			System.out.println(income.getIncomeNo());
//		}
		
		return incomeList;
	}
}
