package com.AourZ.PayStory.service.accountBook;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IShareAccountDAO;
import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareBudgetVO;
import com.AourZ.PayStory.model.member.MemberVO;

@Service
public class ShareAccountService implements IShareAccountService {
	// MyBatis  사용하는 경우의 DI 설정
	@Autowired
	@Qualifier("IShareAccountDAO")
	IShareAccountDAO dao;	//공유가계부 등록을 위한 dao	
	
	
	/* --------------공유가계부 등록----------------*/
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

	
	
	/*------------- 공유가계계부 조회 -------------*/
	@Override
	public ArrayList<AccountBookVO> selectShareAccountBookNo(String memberNo) {
		return dao.selectShareAccountBookNo(memberNo);
		
	}

	@Override
	public MemberVO selectShareAccountOwner(int accountBookNo) {
		return dao.selectShareAccountOwner(accountBookNo);
		
	}

	@Override
	public ArrayList<MemberVO> selectShareAccountParticipant(int accountBookNo) {
		return dao.selectShareAccountParticipant(accountBookNo);
	}
	
	@Override
	public String existParticipant(String participantNo) {
		return dao.existParticipant(participantNo);
		
	}
	
	
	/* ------------공유가계부 참여자 삭제 ------------*/
	@Override
	public void deleteParticipant(String participantNO) {
		dao.deleteParticipant(participantNO);
		
	}
	
	/* 참여자 없을때 가계부 삭제 */
	@Override
	public void deleteAccountBookWhenParticipantNull(int accountBookNo) {
		dao.deleteAccountBookWhenParticipantNull(accountBookNo);
		
	}
	
	/* 공유가계부 참여자 추가 */
	@Override
	public void addShareAccountParticipant(ShareAccountBookVO shareAccountBook) {
		dao.addShareAccountParticipant(shareAccountBook);
	}

	/* ---------- 공유 가계부 삭제 ----------- */
	@Override
	public void deleteShareAccountBook(int accountBookNo) {
		dao.deleteShareAccountBook(accountBookNo);
	}
	
	
}
