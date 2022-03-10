package com.AourZ.PayStory.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.AourZ.PayStory.model.accountBook.AccountBookBudgetVO;
import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureItemVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureVO;
import com.AourZ.PayStory.model.accountBook.IncomeVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.TagTotalVO;
import com.AourZ.PayStory.model.board.BoardVO;
import com.AourZ.PayStory.model.member.MemberVO;

public interface IAccountBookDAO {
	void createMyAccountBook(String memberNo);														// 일반 가계부 생성
	AccountBookVO selectMyAccountBook(HashMap<String, Object> map);					// 일반 가계부 조회
	AccountBookVO selectShareAccountBook(int accountBookNo);								// 공유 가계부 조회
	AccountBookBudgetVO selectAccountBookBudget(HashMap<String, Object> map);	// 가계부 예산 조회
	ArrayList<ShareAccountBookVO> selectShareMemberList(int accountBookNo);			// 공유 가계부 소유자, 참여자 조회
	MemberVO selectMemberInfo(HashMap<String, Object> map);								// 회원 정보 조회
	
	IncomeVO selectIncome(HashMap<String, Object> map);				// 수입 내역 조회 (단일)
	ExpenditureVO selectExpenditure(HashMap<String, Object> map);	// 지출 내역 조회 (단일)
	
	ArrayList<IncomeVO> selectIncomeList(HashMap<String, Object> map);						// 수입 내역 조회
	ArrayList<ExpenditureVO> selectExpenditureList(HashMap<String, Object> map);			// 지출 내역 조회
	ArrayList<ExpenditureItemVO> selectExpenditureItem(int expenditureNo);						// 지출 상세 항목 조회
	ArrayList<TagTotalVO> selectAccountBookTotalDataList(HashMap<String, Object> map);	// 수입 / 지출 총 건수, 총 금액
	String selectTagInfo(HashMap<String, Object> map);													// 태그 번호 / 이름 조회
	
	void deleteItem(HashMap<String, Object> map);		// 내역 삭제
	void updateItem(HashMap<String, Object> map);	// 내역 수정
	void deleteDetailItem(int expenditureNo);				// 지출 상세 내역 삭제
	
	ArrayList<BoardVO> selectBoardList(HashMap<String, Object> map);// 게시판 게시글 리스트
	String selectBoardCategoryName(String boardCategoryNo);				// 게시판 카테고리 이름 조회
	
	public void insertIncome(IncomeVO vo); // 수입 항목 추가
	public void insertExpenditure(ExpenditureVO vo); // 지출 항목 추가
	public void insertExpenditureItem(ArrayList<ExpenditureItemVO> list);// 지출 아이템 추가
}
