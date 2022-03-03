package com.AourZ.PayStory.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.AourZ.PayStory.model.AccountBookBudgetVO;
import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.model.MemberVO;
import com.AourZ.PayStory.model.ShareAccountBookVO;
import com.AourZ.PayStory.model.TagTotalVO;
import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;

public interface IAccountBookDAO {
	void createMyAccountBook(String memberNo);														// 일반 가계부 생성
	AccountBookVO selectMyAccountBook(HashMap<String, Object> map);					// 일반 가계부 조회
	AccountBookVO selectShareAccountBook(int accountBookNo);								// 공유 가계부 조회
	AccountBookBudgetVO selectAccountBookBudget(HashMap<String, Object> map);	// 가계부 예산 조회
	ArrayList<ShareAccountBookVO> selectShareMemberList(int accountBookNo);			// 공유 가계부 소유자, 참여자 조회
	MemberVO selectMemberInfo(HashMap<String, Object> map);								// 회원 정보 조회
	
	ArrayList<TagTotalVO> selectIncomeList(HashMap<String, Object> map);		// 수입 - 태그별 건수, 태그별 총합
	ArrayList<TagTotalVO> selectExpenditureList(HashMap<String, Object> map);// 지출 - 태그별 건수, 태그별 총합
	String selectTagName(String tagNo);															// 태그 이름 조회
	
	ArrayList<BoardVO> selectBoardList(HashMap<String, Object> map);// 게시판 게시글 리스트
	String selectBoardCategoryName(String boardCategoryNo);				// 게시판 카테고리 이름 조회
  
	public void insertIncome(IncomeVO vo); // 수입 항목 추가
	public void insertExpenditure(ExpenditureVO vo); // 지출 항목 추가
	public void insertExpenditureItem(ArrayList<ExpenditureItemVO> list);// 지출 아이템 추가
}
