package com.AourZ.PayStory.service.accountBook;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IAccountBookDAO;
import com.AourZ.PayStory.model.accountBook.AccountBookBudgetVO;
import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureItemVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureVO;
import com.AourZ.PayStory.model.accountBook.IncomeVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.TagTotalVO;
import com.AourZ.PayStory.model.board.BoardVO;
import com.AourZ.PayStory.model.member.MemberVO;

@Service
public class AccountBookService implements IAccountBookService {
	@Autowired
	@Qualifier("IAccountBookDAO")
	private IAccountBookDAO dao;

	@Override
	public void createMyAccountBook(String memberNo) {
		dao.createMyAccountBook(memberNo);
	}

	@Override
	public AccountBookVO selectMyAccountBook(String memberNo, boolean isShared) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("memberNo", memberNo);
		map.put("isShared", isShared);

		return dao.selectMyAccountBook(map);
	}

	@Override
	public AccountBookVO selectShareAccountBook(int accountBookNo) {
		return dao.selectShareAccountBook(accountBookNo);
	}

	@Override
	public AccountBookBudgetVO selectAccountBookBudget(int accountBookNo, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("date", date);

		return dao.selectAccountBookBudget(map);
	}

	@Override
	public ArrayList<ShareAccountBookVO> selectShareMemberList(int accountBookNo) {
		return dao.selectShareMemberList(accountBookNo);
	}

	@Override
	public MemberVO selectMemberInfo(String condition, Object value) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("condition", condition);
		map.put("value", value);

		return dao.selectMemberInfo(map);
	}

	@Override
	public ArrayList<TagTotalVO> selectAccountBookDataList(String condition, int accountBookNo, String group1,
			String group2, String date, String dateForm) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("condition", condition);
		map.put("accountBookNo", accountBookNo);
		map.put("group1", group1);
		map.put("group2", group2);
		map.put("date", date);
		map.put("dateForm", dateForm);

		return dao.selectAccountBookDataList(map);
	}

	@Override
	public String selectTagName(String tagNo) {
		return dao.selectTagName(tagNo);
	}

	@Override
	public ArrayList<BoardVO> selectBoardList(int boardTab, String boardCategoryNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("boardTab", boardTab);
		map.put("boardCategoryNo", boardCategoryNo);

		return dao.selectBoardList(map);
	}

	@Override
	public String selectBoardCategoryName(String boardCategoryNo) {
		return dao.selectBoardCategoryName(boardCategoryNo);
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
