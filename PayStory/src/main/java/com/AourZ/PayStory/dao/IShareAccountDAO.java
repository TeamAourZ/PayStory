package com.AourZ.PayStory.dao;

import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareBudgetVO;

public interface IShareAccountDAO {
	/* ArrayList<ProductVO> listAllProduct(); */  		// 가계부 조회
	

	
	/* 공유가계부 등록 */
	void createShareAccountBook(ShareAccountBookVO shareAccountBook);	
	void createAccountBook(AccountBookVO accountBook);
	void createShareBudget(ShareBudgetVO ShareBudget);
}
