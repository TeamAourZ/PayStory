package com.AourZ.PayStory.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.AourZ.PayStory.model.AccountBookBudgetVO;
import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.model.MemberVO;
import com.AourZ.PayStory.model.ShareAccountBookVO;
import com.AourZ.PayStory.model.TagTotalVO;

public interface IAccountBookDAO {
	AccountBookVO getMyAccountBook(HashMap<String, Object> map);					// 내 가계부 조회
	AccountBookVO getShareAccountBook(int accountBookNo);								// 공유 가계부 조회
	AccountBookBudgetVO getAccountBookBudget(HashMap<String, Object> map);	// 가계부 예산 조회
	ArrayList<ShareAccountBookVO> getShareMemberList(int accountBookNo);			// 공유 가계부 소유자, 참여자 조회
	MemberVO getMemberInfo(String memberNo);													// 회원 정보 조회
	
	ArrayList<TagTotalVO> getIncomeList(HashMap<String, Object> map);			// 수입 - 태그별 건수, 태그별 총합
	ArrayList<TagTotalVO> getExpenditureList(HashMap<String, Object> map);	// 지출 - 태그별 건수, 태그별 총합
	String getTagName(String tagNo);																// 태그명 조회
	
	ArrayList<BoardVO> getBoardList(HashMap<String, Object> map);	// 게시판 게시글 리스트
	String getBoardCategoryName(String boardCategoryNo);					// 게시판 카테고리 이름
}
