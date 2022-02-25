package com.AourZ.PayStory.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IAccountBookDAO;
import com.AourZ.PayStory.model.AccountBookBudgetVO;
import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.model.MemberVO;
import com.AourZ.PayStory.model.ShareAccountBookVO;
import com.AourZ.PayStory.model.TagTotalVO;
import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;

@Service
public class AccountBookService implements IAccountBookService {
	@Autowired
  @Qualifier("IAccountBookDAO")
	private IAccountBookDAO dao;

	@Override
	public AccountBookVO getMyAccountBook(String memberNo, boolean isShared) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("memberNo", memberNo);
		map.put("isShared", isShared);

		return dao.getMyAccountBook(map);
	}

	@Override
	public AccountBookVO getShareAccountBook(int accountBookNo) {
		return dao.getShareAccountBook(accountBookNo);
	}

	@Override
	public AccountBookBudgetVO getAccountBookBudget(int accountBookNo, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("date", date);

		return dao.getAccountBookBudget(map);
	}

	@Override
	public ArrayList<ShareAccountBookVO> getShareMemberList(int accountBookNo) {
		return dao.getShareMemberList(accountBookNo);
	}

	@Override
	public MemberVO getMemberInfo(String memberNo) {
		return dao.getMemberInfo(memberNo);
	}

	@Override
	public ArrayList<TagTotalVO> getIncomeList(int accountBookNo, String select, String group, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("select", select);
		map.put("group", group);
		map.put("date", date);

		return dao.getIncomeList(map);
	}

	@Override
	public ArrayList<TagTotalVO> getExpenditureList(int accountBookNo, String select, String group, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("select", select);
		map.put("group", group);
		map.put("date", date);

		return dao.getExpenditureList(map);
	}

	@Override
	public String getTagName(String tagNo) {
		return dao.getTagName(tagNo);
	}

	@Override
	public ArrayList<BoardVO> getBoardList(boolean allCheck, String boardCategoryNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("allCheck", allCheck);
		map.put("boardCategoryNo", boardCategoryNo);

		return dao.getBoardList(map);
	}

	@Override
	public String getBoardCategoryName(String boardCategoryNo) {
		return dao.getBoardCategoryName(boardCategoryNo);
	}
  
	@Override
	public void insertIncome(IncomeVO vo) {
		dao.insertIncome(vo);
	}

	@Override
	public void insertExpenditure(ExpenditureVO vo) {
		dao.insertExpenditure(vo);
	}

	@Override
	public void insertExpenditureItem(ArrayList<ExpenditureItemVO> list) {
		dao.insertExpenditureItem(list);
	}

}
