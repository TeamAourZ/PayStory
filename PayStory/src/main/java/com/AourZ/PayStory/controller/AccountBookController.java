package com.AourZ.PayStory.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.AourZ.PayStory.model.AccountBookBudgetVO;
import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.model.DateVO;
import com.AourZ.PayStory.model.MainBoardVO;
import com.AourZ.PayStory.model.MemberVO;
import com.AourZ.PayStory.model.TagTotalVO;
import com.AourZ.PayStory.service.AccountBookService;

@Controller
public class AccountBookController {
	@Autowired
	private AccountBookService accountBookService;

	/*
	 * isShared 값 받아 가계부 구분
	 */
	/* 대시보드 메인 */
	@RequestMapping("/accountBook/main")
	public String main(HttpServletRequest request, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		String signInMemberNo = (String) session.getAttribute("sid");

		// 가계부 정보 가져오기
		AccountBookVO accountBookInfo = accountBookService.getMyAccountBook(signInMemberNo, false);
		int accountBookNo = accountBookInfo.getAccountBookNo(); // 가계부 번호
		String accountBookTitle = accountBookInfo.getAccountBookTitle(); // 가계부 타이틀
		
		model.addAttribute("accountBookTitle", accountBookTitle);

		// 가계부 번호 session에 저장
		session.setAttribute("accountBookNo", accountBookNo);

		// 현재 년-월 (시스템 시간 기준)
		LocalDate localDate = LocalDate.now();
		String year = Integer.toString(localDate.getYear());
		String month = zeroFill(localDate.getMonthValue());
		String date = year + "-" + month;

		// 예산
		AccountBookBudgetVO budget = accountBookService.getAccountBookBudget(accountBookNo, date);

		model.addAttribute("budget", budget.getBudgetAmount());

		// 총 수입
		ArrayList<TagTotalVO> income = accountBookService.getIncomeList(accountBookNo, "date", "month", date);
		System.out.println(accountBookNo + " // " + date + " // " + income.size() + "!!!!!!!!!!");
		int incomeTotalAmount = income.get(0).getSum();

		model.addAttribute("incomeTotalAmount", incomeTotalAmount);

		// 총 지출
		ArrayList<TagTotalVO> expenditure = accountBookService.getExpenditureList(accountBookNo, "date", "year", date);
		int expenditureTotalAmount = expenditure.get(0).getSum();

		model.addAttribute("expenditureTotalAmount", expenditureTotalAmount);

		return "accountBook/main";
	}

	/* 대시보드 메인 - 차트 */
	@RequestMapping("/accountBook/chart")
	public String chart(HttpServletRequest request) {
		
		
		
		
		
		return "accountBook/chart";
	}

	/* 대시보드 메인 - 게시판 */
	@RequestMapping("/accountBook/board")
	public String board(@RequestParam("boardTabNumber") int boardTabNumber, HttpServletRequest request, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		String signInMemberNo = (String) session.getAttribute("memberNo");
		
		boolean allCheck = true;
		String boardCategoryNo = "";

		if (boardTabNumber == 2) {
			allCheck = false;
			boardCategoryNo = "c1234"; // 임시
		}

		/* ---------------- boardList ---------------- */
		ArrayList<BoardVO> originalBoardList = accountBookService.getBoardList(allCheck, boardCategoryNo);
		MemberVO member = accountBookService.getMemberInfo(signInMemberNo);
		
		ArrayList<MainBoardVO> boardList = new ArrayList<MainBoardVO>();
		
		for (BoardVO board : originalBoardList) {
			MainBoardVO vo = new MainBoardVO();
			
			String boardCategoryName = accountBookService.getBoardCategoryName(board.getBoardCategoryNo());
			String boardTitle = board.getBoardTitle();
			String memberName = member.getMemberName();
			
			vo.setBoardCategoryName(boardCategoryName);
			vo.setBoardTitle(boardTitle);
			vo.setMemberName(memberName);
			
			boardList.add(vo);
		}
		

		model.addAttribute("boardList", boardList);
		/* ---------------- boardList ---------------- */

		return "accountBook/mainBoard";
	}

	/* 대시보드 메인 / 조회 - 달력 */
	@RequestMapping("/accountBook/calendar")
	public String mainCalendar(@RequestParam Map<String, Object> param, HttpServletRequest request, Model model) {
		String calendarType = (String) param.get("calendarType"); // 가계부 타입
		int year = (int) param.get("year"); // 년
		int month = (int) param.get("month"); // 월
		int firstDay = (int) param.get("firstDay"); // 달의 시작 요일 번호
		int lastDate = (int) param.get("lastDate"); // 달의 마지막 날
		int lastDay = (int) param.get("lastDay"); // 달의 마지막 요일 번호

		model.addAttribute("firstDay", firstDay);
		model.addAttribute("lastDate", lastDate);
		model.addAttribute("lastDay", lastDay);

		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo");

		String date = "";

		/* ---------------- dateList ---------------- */
		ArrayList<DateVO> dateList = new ArrayList<DateVO>();

		String monthText = zeroFill(month + 1);
		for (int i = 1; i <= lastDate; i++) {
			String dayText = zeroFill(i);

			date = Integer.toString(year) + "-" + monthText + "-" + dayText; // 날짜별 class data

			DateVO vo = new DateVO();

			vo.setDate(date);
			vo.setDay(i);
			vo.setHolidayName(""); // 휴무일은 임시

			dateList.add(vo);
		}

		model.addAttribute("dateList", dateList);
		/* ---------------- dateList ---------------- */

		date = Integer.toString(year) + "-" + monthText; // 수입 / 지출 기준

		/* ---------------- income ---------------- */
		// incomeList
		ArrayList<TagTotalVO> dateIncomeList = accountBookService.getIncomeList(accountBookNo, "date", "day", date);
		ArrayList<TagTotalVO> incomeList = createList(dateIncomeList, lastDate);

		model.addAttribute("incomeList", incomeList);

		// incomeItemList
		ArrayList<TagTotalVO> tagIncomeList = accountBookService.getIncomeList(accountBookNo, "tag", "day", date);
		ArrayList<ArrayList<TagTotalVO>> incomeItemList = createItemList(tagIncomeList, lastDate);

		model.addAttribute("incomeItemList", incomeItemList);
		/* ---------------- income ---------------- */

		/* ---------------- expenditure ---------------- */
		// expenditureList
		ArrayList<TagTotalVO> dateExpenditureList = accountBookService.getExpenditureList(accountBookNo, "date", "day",
				date);
		ArrayList<TagTotalVO> expenditureList = createList(dateExpenditureList, lastDate);

		model.addAttribute("expenditureList", expenditureList);

		// expenditureItemList
		ArrayList<TagTotalVO> tagExpenditureList = accountBookService.getExpenditureList(accountBookNo, "tag", "day",
				date);
		ArrayList<ArrayList<TagTotalVO>> expenditureItemList = createItemList(tagExpenditureList, lastDate);

		model.addAttribute("expenditureItemList", expenditureItemList);
		/* ---------------- expenditure ---------------- */

		// 달력 타입별 반환
		if (calendarType.equals("A")) {
			return "accountBook/calendarTypeA";
		} else {
			return "accountBook/calendarTypeB";
		}
	}

	/* 숫자 0 채우기 */
	private String zeroFill(int num) {
		String text = "";

		if (num < 10) {
			text = "0" + Integer.toString(num);
		} else {
			text = Integer.toString(num);
		}

		return text;
	}

	/* 수입 / 지출 리스트 생성 */
	private ArrayList<TagTotalVO> createList(ArrayList<TagTotalVO> dataList, int lastDate) {
		ArrayList<TagTotalVO> resultList = new ArrayList<TagTotalVO>();

		for (int i = 0; i < lastDate; i++) {
			TagTotalVO vo = new TagTotalVO();

			resultList.add(vo);
		}

		for (int i = 0; i < dataList.size(); i++) {
			String[] tempDate = dataList.get(i).getDate().split("-");
			int day = Integer.parseInt(tempDate[tempDate.length - 1]);

			resultList.set(day, createTagTotalVO(dataList.get(i)));
		}

		return resultList;
	}

	/* 수입 / 지출 아이템 리스트 생성 */
	private ArrayList<ArrayList<TagTotalVO>> createItemList(ArrayList<TagTotalVO> dataList, int lastDate) {
		ArrayList<ArrayList<TagTotalVO>> resultItemList = new ArrayList<ArrayList<TagTotalVO>>();

		for (int i = 0; i < lastDate; i++) {
			ArrayList<TagTotalVO> voArray = new ArrayList<TagTotalVO>();

			resultItemList.add(voArray);
		}

		for (int i = 0; i < dataList.size(); i++) {
			String[] tempDate = dataList.get(i).getDate().split("-");
			int day = Integer.parseInt(tempDate[tempDate.length - 1]);

			resultItemList.get(day).add(createTagTotalVO(dataList.get(i)));
		}

		return resultItemList;
	}

	/* TagTotalVO 생성 */
	private TagTotalVO createTagTotalVO(TagTotalVO data) {
		TagTotalVO vo = new TagTotalVO();

		vo.setDate(data.getDate());
		String name = accountBookService.getTagName(data.getTag());
		vo.setTag(name);
		vo.setCount(data.getCount());
		vo.setSum(data.getSum());

		return vo;
	}

	/* 대시보드 조회 */
	@RequestMapping("/accountBook/detailView")
	public String detailView() {

		return "accountBook/detailView";
	}
	
	/* 대시보드 조회 - 상세 내역 */
	@RequestMapping("/accountBook/detailViewList")
	public String detailViewList() {
		
		return "accountBook/detailViewList";
	}

	/* 지출,수입 내역 추가 form */
	@RequestMapping("/accountBook/add")
	public String addForm() {
		return "accountBook/addForm";
	}

	/* 지출 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/expenditure")
	public String addExpenditure() {
		return "";
	}

	// 공유가계부 메인
	@RequestMapping("/accountBook/public/main")
	public String movePublicMain() {
		return "boardPublic/publicMain";
	}

	// 공유가계부 생성
	@RequestMapping("/accountBook/public/create")
	public String movePublicCreate() {
		return "boardPublic/publicCreate";
	}

	// 공유가계부 참여자 등록,삭제
	@RequestMapping("/accountBook/public/registerParticipant")
	public String moveRegisterParticipant() {
		return "boardPublic/publicRegisterParticipant";
	}
}
