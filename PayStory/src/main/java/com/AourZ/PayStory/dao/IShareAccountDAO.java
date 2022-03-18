package com.AourZ.PayStory.dao;

import java.util.ArrayList;

import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareBudgetVO;
import com.AourZ.PayStory.model.member.MemberVO;

public interface IShareAccountDAO {
	/* ArrayList<ProductVO> listAllProduct(); */  		// 가계부 조회
	

	
	/* 공유가계부 등록 */
	void createShareAccountBook(ShareAccountBookVO shareAccountBook);	
	void createAccountBook(AccountBookVO accountBook);
	void createShareBudget(ShareBudgetVO ShareBudget);
	
	/* 공유가계부 조회 */
	ArrayList<AccountBookVO> selectShareAccountBookNo(String memberNo);
	MemberVO selectShareAccountOwner(int accountBookNo);
	ArrayList<MemberVO> selectShareAccountParticipant(int accountBookNo);
	String existParticipant(String participantNo);
}
