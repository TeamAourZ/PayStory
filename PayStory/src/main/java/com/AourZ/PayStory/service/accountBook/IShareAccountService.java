package com.AourZ.PayStory.service.accountBook;

import java.util.ArrayList;

import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareBudgetVO;
import com.AourZ.PayStory.model.member.MemberVO;


public interface IShareAccountService {
	
	/* 공유가계부 등록 */
	void createAccountBook(AccountBookVO data);	// 가계부 데이터 등록(공유가계부 전용)
	void createShareAccountBook(ShareAccountBookVO sharedata);	// 공유가계부 데이터 등록(공유가계부 전용)
	public void createShareBudget(ShareBudgetVO ShareBudget);	// 공유가계부 예산 등록(공유가계부 전용)
	
	/* 공유가계부 조회 */
	ArrayList<AccountBookVO> selectShareAccountBookNo(String memberNo);				// 로그인한 유저가 참여하는 공유가계부 NO 값 조회
	MemberVO selectShareAccountOwner(int accountBookNo);			// 찾은 공유가계부No로 owner 이름, 이미지 조회
	ArrayList<MemberVO> selectShareAccountParticipant(int accountBookNo);		// 찾은 공유가계부No로 participant 이름, 이미지 조회
	String existParticipant(String participantNo);		//공유가계부 생성화면에서 참여자 이메일 입력시 회원가입된 사람인지.
	
	/* 공유가계부 참여자 삭제추가 */
	void deleteParticipant(String participantNO);
	void deleteAccountBookWhenParticipantNull(int accountBookNo);
	public void addShareAccountParticipant(ShareAccountBookVO shareAccountBook);
	
	/* 공유가계부 삭제 */
	void deleteShareAccountBook(int accountBookNo);
}
