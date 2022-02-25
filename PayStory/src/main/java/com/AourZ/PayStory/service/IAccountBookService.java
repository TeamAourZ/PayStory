package com.AourZ.PayStory.service;

import java.util.ArrayList;

import com.AourZ.PayStory.model.AccountBookBudgetVO;
import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.model.MemberVO;
import com.AourZ.PayStory.model.ShareAccountBookVO;
import com.AourZ.PayStory.model.TagTotalVO;
import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;

public interface IAccountBookService {
	AccountBookVO getMyAccountBook(String memberNo, boolean isShared);			// 내 가계부 조회
	AccountBookVO getShareAccountBook(int accountBookNo);								// 공유 가계부 조회
	AccountBookBudgetVO getAccountBookBudget(int accountBookNo, String date);	// 가계부 예산 조회
	ArrayList<ShareAccountBookVO> getShareMemberList(int accountBookNo);			// 공유 가계부 소유자, 참여자 조회
	MemberVO getMemberInfo(String memberNo);													// 회원 정보 조회
	
	ArrayList<TagTotalVO> getIncomeList(int accountBookNo, String select, String group, String date);		// 수입 총 건수, 총 금액
	ArrayList<TagTotalVO> getExpenditureList(int accountBookNo, String select, String group, String date);	// 지출 총 건수, 총 금액
	String getTagName(String tagNo);																									// 태그명 조회
	
	ArrayList<BoardVO> getBoardList(boolean allCheck, String boardCategoryNo);	// 게시판 게시글 리스트
	String getBoardCategoryName(String boardCategoryNo);								// 게시판 카테고리 이름
  
	public void insertIncome(IncomeVO vo); // 수입 항목 추가
	public void insertExpenditure(ExpenditureVO vo); // 지출 항목 추가
	public void insertExpenditureItem(ArrayList<ExpenditureItemVO> list); // 지출 아이템 추가
}
