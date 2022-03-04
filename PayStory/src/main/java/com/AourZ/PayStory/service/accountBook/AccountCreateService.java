package com.AourZ.PayStory.service.accountBook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IShareAccountDAO;
import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareBudgetVO;

@Service
public class AccountCreateService implements IAccountCreateService {
	// MyBatis  사용하는 경우의 DI 설정
	@Autowired
	@Qualifier("IShareAccountDAO")
	IShareAccountDAO dao;	//공유가계부 등록을 위한 dao	
	
	
	/* ------------공유가계부 등록--------------*/
	@Override
	public void createShareAccountBook(ShareAccountBookVO shareAccountBook) {
		 dao.createShareAccountBook(shareAccountBook);
	}
	
	@Override
	public void createAccountBook(AccountBookVO accountBook) {
		dao.createAccountBook(accountBook);
	}

	@Override
	public void createShareBudget(ShareBudgetVO ShareBudget) {
		dao.createShareBudget(ShareBudget);
	}
	
	
}
