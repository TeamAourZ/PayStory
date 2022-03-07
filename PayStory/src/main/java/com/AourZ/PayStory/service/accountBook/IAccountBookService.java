package com.AourZ.PayStory.service.accountBook;

import java.util.ArrayList;

import com.AourZ.PayStory.model.accountBook.AccountBookBudgetVO;
import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureItemVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureVO;
import com.AourZ.PayStory.model.accountBook.IncomeVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.TagTotalVO;
import com.AourZ.PayStory.model.board.BoardVO;
import com.AourZ.PayStory.model.member.MemberVO;

public interface IAccountBookService {
	void createMyAccountBook(String memberNo);														// 일반 가계부 생성
	AccountBookVO selectMyAccountBook(String memberNo, boolean isShared);			// 일반 가계부 조회
	AccountBookVO selectShareAccountBook(int accountBookNo);								// 공유 가계부 조회
	AccountBookBudgetVO selectAccountBookBudget(int accountBookNo, String date);	// 가계부 예산 조회
	ArrayList<ShareAccountBookVO> selectShareMemberList(int accountBookNo);			// 공유 가계부 소유자, 참여자 조회
	MemberVO selectMemberInfo(String condition, Object value);								// 회원 정보 조회
	
	ArrayList<IncomeVO> selectIncomeList(int accountBookNo, String date);				// 수입 내역 조회
	ArrayList<ExpenditureVO> selectExpenditureList(int accountBookNo, String date);	// 지출 내역 조회
	void deleteItem(String condition, int dataNo);														// 내역 삭제
	ArrayList<ExpenditureItemVO> selectExpenditureItem(int expenditureNo);				// 지출 상세 항목 조회
	ArrayList<TagTotalVO> selectAccountBookTotalDataList(String condition, int accountBookNo, String group1, String group2,
			String date, String dateForm);	// 수입 / 지출 총 건수, 총 금액
	String selectTagName(String tagNo);	// 태그 이름 조회
	
	ArrayList<BoardVO> selectBoardList(int boardTab, String boardCategoryNo);	// 게시판 게시글 리스트
	String selectBoardCategoryName(String boardCategoryNo);							// 게시판 카테고리 이름 조회
  
	public void insertIncome(IncomeVO vo); // 수입 항목 추가
	public void insertExpenditure(ExpenditureVO vo); // 지출 항목 추가
	public void insertExpenditureItem(ArrayList<ExpenditureItemVO> list); // 지출 아이템 추가
}
