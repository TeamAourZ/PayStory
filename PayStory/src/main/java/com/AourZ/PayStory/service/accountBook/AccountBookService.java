package com.AourZ.PayStory.service.accountBook;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IAccountBookDAO;
import com.AourZ.PayStory.model.accountBook.AccountBookBudgetVO;
import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.EditorVO;
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

	/* 일반 가계부 생성 */
	@Override
	public void createMyAccountBook(String memberNo) {
		dao.createMyAccountBook(memberNo);
	}

	/* 일반 가계부 조회 */
	@Override
	public AccountBookVO selectMyAccountBook(String memberNo, boolean isShared) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("memberNo", memberNo);
		map.put("isShared", isShared);

		return dao.selectMyAccountBook(map);
	}

	/* 공유 가계부 조회 */
	@Override
	public AccountBookVO selectShareAccountBook(int accountBookNo) {
		return dao.selectShareAccountBook(accountBookNo);
	}

	/* 가계부 예산 조회 */
	@Override
	public AccountBookBudgetVO selectAccountBookBudget(int accountBookNo, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("date", date);

		return dao.selectAccountBookBudget(map);
	}

	/* 공유 가계부 소유자, 참여자 조회 */
	@Override
	public ArrayList<ShareAccountBookVO> selectShareMemberList(int accountBookNo) {
		return dao.selectShareMemberList(accountBookNo);
	}

	/* 회원 정보 조회 */
	@Override
	public MemberVO selectMemberInfo(String condition, Object value) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("condition", condition);
		map.put("value", value);

		return dao.selectMemberInfo(map);
	}

	/* 수입 내역 조회 (단일) */
	@Override
	public IncomeVO selectIncome(int accountBookNo, String dataNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("dataNo", dataNo);

		return dao.selectIncome(map);
	}

	/* 지출 내역 조회 (단일) */
	@Override
	public ExpenditureVO selectExpenditure(int accountBookNo, String dataNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("dataNo", dataNo);

		return dao.selectExpenditure(map);
	}

	/* 수입 내역 조회 */
	@Override
	public ArrayList<IncomeVO> selectIncomeList(int accountBookNo, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("date", date);

		return dao.selectIncomeList(map);
	}

	/* 지출 내역 조회 */
	@Override
	public ArrayList<ExpenditureVO> selectExpenditureList(int accountBookNo, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accountBookNo", accountBookNo);
		map.put("date", date);

		return dao.selectExpenditureList(map);
	}

	/* 지출 상세 항목 조회 */
	@Override
	public ArrayList<ExpenditureItemVO> selectExpenditureItem(int expenditureNo) {
		return dao.selectExpenditureItem(expenditureNo);
	}

	/* 수입 / 지출 총 건수, 총 금액 */
	@Override
	public ArrayList<TagTotalVO> selectAccountBookTotalDataList(String condition, int accountBookNo, String group1,
			String group2, String date, String dateForm) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("condition", condition);
		map.put("accountBookNo", accountBookNo);
		map.put("group1", group1);
		map.put("group2", group2);
		map.put("date", date);
		map.put("dateForm", dateForm);

		return dao.selectAccountBookTotalDataList(map);
	}

	/* 태그 번호 / 이름 조회 */
	@Override
	public String selectTagInfo(String condition, String tag) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("condition", condition);
		map.put("tag", tag);

		return dao.selectTagInfo(map);
	}

	/* 내역 삭제 */
	@Override
	public void deleteItem(String condition, int dataNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("condition", condition);
		map.put("dataNo", dataNo);

		dao.deleteItem(map);
	}

	/* 내역 수정 */
	@Override
	public void updateItem(HashMap<String, Object> map) {
		dao.updateItem(map);
	}

	/* 지출 내역 상세 항목 삭제 */
	public void deleteDetailItem(int expenditureNo) {
		dao.deleteDetailItem(expenditureNo);
	}

	/* 내역 수정자 추가 */
	public void insertEditor(String memberNo, int accountBookNo, String condition, int dataNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("memberNo", memberNo);
		map.put("accountBookNo", accountBookNo);
		map.put("condition", condition);
		map.put("dataNo", dataNo);

		dao.insertEditor(map);
	}

	/* 내역 수정 데이터 번호 조회 */
	public ArrayList<Integer> selectEditorDataNoList(String condition, int accountBookNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("condition", condition);
		map.put("accountBookNo", accountBookNo);

		return dao.selectEditorDataNoList(map);
	}

	/* 내역 수정자 조회 */
	public ArrayList<EditorVO> selectEditorList(String condition, int accountBookNo, int dataNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("condition", condition);
		map.put("accountBookNo", accountBookNo);
		map.put("dataNo", dataNo);

		return dao.selectEditorList(map);
	}

	/* 게시판 게시글 리스트 */
	@Override
	public ArrayList<BoardVO> selectBoardList(int boardTab, String boardCategoryNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("boardTab", boardTab);
		map.put("boardCategoryNo", boardCategoryNo);

		return dao.selectBoardList(map);
	}

	/* 게시판 카테고리 이름 조회 */
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
