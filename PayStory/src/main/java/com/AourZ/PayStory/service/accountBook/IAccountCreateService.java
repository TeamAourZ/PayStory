package com.AourZ.PayStory.service;

import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.ShareAccountBookVO;
import com.AourZ.PayStory.model.ShareBudgetVO;


public interface IAccountCreateService {
	
	
	void createAccountBook(AccountBookVO data);	// 가계부 데이터 등록(공유가계부 전용)
	void createShareAccountBook(ShareAccountBookVO sharedata);	// 공유가계부 데이터 등록(공유가계부 전용)
	public void createShareBudget(ShareBudgetVO ShareBudget);	// 공유가계부 예산 등록(공유가계부 전용)
	
	
	
}
