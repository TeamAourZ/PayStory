package com.AourZ.PayStory.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.AourZ.PayStory.model.AccountBookBudgetVO;
import com.AourZ.PayStory.model.AccountBookVO;
import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.model.DateVO;
import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;
import com.AourZ.PayStory.model.MainBoardVO;
import com.AourZ.PayStory.model.MemberVO;
import com.AourZ.PayStory.model.ShareAccountBookVO;
import com.AourZ.PayStory.model.ShareBudgetVO;
import com.AourZ.PayStory.model.TagTotalVO;
import com.AourZ.PayStory.service.AccountBookService;
import com.AourZ.PayStory.service.AccountCreateService;

@Controller
public class AccountBookController {
	@Autowired
	private AccountBookService accountBookService;

	@Autowired
	private AccountCreateService createService;

	@Autowired
	private AccountBookMethod methodList;

	/* 대시보드 메인 - 일반 가계부 */
	@RequestMapping("/accountBook/myMain")
	public String myMain(HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			// session 정보 가져오기
			HttpSession session = request.getSession();
			String signInMemberNo = (String) session.getAttribute("memberNo"); // 회원 번호

			// 로그인 정보 확인
			if (signInMemberNo == null) {

				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();

				out.println("<script>alert('로그인 정보가 정확하지 않습니다.'); location.href='/index';</script>");

				out.flush();
			}

			// 가계부 정보 가져오기
			AccountBookVO accountBookInfo = accountBookService.selectMyAccountBook(signInMemberNo, false);

			int accountBookNo = accountBookInfo.getAccountBookNo(); // 가계부 번호
			String accountBookTitle = accountBookInfo.getAccountBookTitle(); // 가계부 타이틀
			boolean isShared = accountBookInfo.getIsShared(); // 가계부 구분 - 내 가계부

			model.addAttribute("accountBookTitle", accountBookTitle);
			model.addAttribute("isShared", isShared);

			// session 업데이트 (가계부 번호 추가)
			session.setAttribute("accountBookNo", accountBookNo);

			// 현재 년-월 (시스템 시간 기준)
			String date = methodList.nowDate();

			// 예산
			AccountBookBudgetVO budget = accountBookService.selectAccountBookBudget(accountBookNo, date);
			if (budget != null) {
				model.addAttribute("budget", budget.getBudgetAmount());
			}

			// 총 수입 (당월 총 건수, 총 금액)
			ArrayList<TagTotalVO> income = methodList.selectTagTotalList("income", accountBookNo, "date", "month", date);
			if (income != null && income.size() > 0) {
				model.addAttribute("incomeTotalAmount", income.get(0).getSum());
			}

			// 총 지출 (당월 총 건수, 총 금액)
			ArrayList<TagTotalVO> expenditure = methodList.selectTagTotalList("expenditure", accountBookNo, "date", "month",
					date);
			if (expenditure != null && expenditure.size() > 0) {
				model.addAttribute("expenditureTotalAmount", expenditure.get(0).getSum());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "accountBook/main";
	}

	/* 대시보드 메인 - 공유 가계부 */
	@RequestMapping("/accountBook/shareMain")
	public String shareMain(HttpServletRequest request, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// 가계부 정보 가져오기
		AccountBookVO accountBookInfo = accountBookService.selectShareAccountBook(accountBookNo);

		String accountBookTitle = accountBookInfo.getAccountBookTitle(); // 가계부 타이틀
		boolean isShared = accountBookInfo.getIsShared(); // 가계부 구분 - 공유 가계부

		model.addAttribute("accountBookTitle", accountBookTitle);
		model.addAttribute("isShared", isShared);

		// 현재 년-월 (시스템 시간 기준)
		String date = methodList.nowDate();

		// 예산
		AccountBookBudgetVO budget = accountBookService.selectAccountBookBudget(accountBookNo, date);
		if (budget != null) {
			model.addAttribute("budget", budget.getBudgetAmount());
		}

		// 총 수입 (당월 총 건수, 총 금액)
		ArrayList<TagTotalVO> income = methodList.selectTagTotalList("income", accountBookNo, "date", "month", date);
		if (income != null && income.size() > 0) {
			model.addAttribute("incomeTotalAmount", income.get(0).getSum());
		}

		// 총 지출 (당월 총 건수, 총 금액)
		ArrayList<TagTotalVO> expenditure = methodList.selectTagTotalList("expenditure", accountBookNo, "date", "month",
				date);
		if (expenditure != null && expenditure.size() > 0) {
			model.addAttribute("expenditureTotalAmount", expenditure.get(0).getSum());
		}

		return "accountBook/main";
	}

	/* 대시보드 메인 - 차트 */
	@RequestMapping("/accountBook/chart")
	public String chart(@RequestParam HashMap<String, Object> param, HttpServletRequest request, Model model) {
		// map 정보 가져오기
		int year = Integer.parseInt((String) param.get("year")); // 년
		int month = Integer.parseInt((String) param.get("month")); // 월
		String chartType = (String) param.get("chartType"); // 월 : m, 일 : d
		String chartTab = (String) param.get("chartTab"); // 수입 : income, 지출 : expenditure

		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// DB SELECT 기준 설정
		String monthText = methodList.zeroFill(month); // 월
		String date = Integer.toString(year) + "-" + monthText; // 년-월
		String group1 = "tag"; // 날짜 기준, 태그 기준 설정
		String group2 = ""; // 그룹 기준 - 년 / 월 / 일

		if (chartType.equals("y")) {
			date = Integer.toString(year);
			group2 = "year";
		} else if (chartType.equals("m")) {
			group2 = "month";
		} else if (chartType.equals("d")) {
			group2 = "day";
		}

		ArrayList<TagTotalVO> dataList = methodList.selectTagTotalList(chartTab, accountBookNo, group1, group2, date);

		for (int i = 0; i < dataList.size(); i++) {
			dataList.get(i).setTag(methodList.replaceTag(dataList.get(i).getTag())); // 태그 번호 to 태그 이름
		}

		model.addAttribute("dataList", dataList);

		return "accountBook/chart";
	}

	/* 대시보드 메인 - 게시판 */
	@RequestMapping("/accountBook/board")
	public String board(@RequestParam("boardTab") int boardTab, HttpServletRequest request, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		String signInMemberNo = (String) session.getAttribute("memberNo"); // 회원 번호

		String boardCategoryNo = "c1000";

		// 게시글 조회
		ArrayList<BoardVO> originalBoardList = accountBookService.selectBoardList(boardTab, boardCategoryNo);

		// 회원 정보 조회
		MemberVO member = accountBookService.selectMemberInfo(signInMemberNo);

		// 게시글 정보 제한
		ArrayList<MainBoardVO> boardList = new ArrayList<MainBoardVO>();

		for (BoardVO board : originalBoardList) {
			MainBoardVO vo = new MainBoardVO();

			String boardCategoryName = methodList.replaceCategory(board.getBoardCategoryNo()); // 카테고리 번호 to 카테고리 이름
			String boardTitle = board.getBoardTitle();
			String memberName = member.getMemberName();

			vo.setBoardCategoryName(boardCategoryName);
			vo.setBoardTitle(boardTitle);
			vo.setMemberName(memberName);

			boardList.add(vo);
		}

		model.addAttribute("boardList", boardList);

		return "accountBook/mainBoard";
	}

	/* 대시보드 메인 / 조회 - 달력 */
	@RequestMapping("/accountBook/calendar")
	public String mainCalendar(@RequestParam HashMap<String, Object> param, HttpServletRequest request, Model model) {
		// map 정보 가져오기
		String calendarType = (String) param.get("calendarType"); // 가계부 타입
		int year = Integer.parseInt((String) param.get("year")); // 년
		int month = Integer.parseInt((String) param.get("month")); // 월
		int firstDay = Integer.parseInt((String) param.get("firstDay")); // 달의 시작 요일 번호
		int lastDate = Integer.parseInt((String) param.get("lastDate")); // 달의 마지막 날
		int lastDay = Integer.parseInt((String) param.get("lastDay")); // 달의 마지막 요일 번호
		int week = Integer.parseInt((String) param.get("week")); // 달의 주차 개수

		model.addAttribute("firstDay", firstDay);
		model.addAttribute("lastDate", lastDate);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("week", week);

		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// A, B, C 공통
		/* ---------------- dateList ---------------- */
		ArrayList<DateVO> dateList = new ArrayList<DateVO>();

		String monthText = methodList.zeroFill(month);
		for (int i = 1; i <= lastDate; i++) {
			String dayText = methodList.zeroFill(i);

			String date = Integer.toString(year) + "-" + monthText + "-" + dayText; // 날짜별 class data

			DateVO vo = new DateVO();

			vo.setDate(date);
			vo.setDay(i);
			vo.setHolidayName(""); // 휴무일은 임시

			dateList.add(vo);
		}

		model.addAttribute("dateList", dateList);
		/* ---------------- dateList ---------------- */

		// 그룹 조건 - 년-월
		String date = Integer.toString(year) + "-" + monthText; // 년-월

		ArrayList<TagTotalVO> tempList = null;

		/* ---------------- income ---------------- */
		// incomeList (당월 일별 총 건수, 총 금액)
		tempList = methodList.selectTagTotalList("income", accountBookNo, "date", "day", date);
		ArrayList<TagTotalVO> dateIncomeList = methodList.createDataList(tempList, lastDate);

		model.addAttribute("dateIncomeList", dateIncomeList);

		if (calendarType.equals("A") || calendarType.equals("B")) {
			// incomeItemList (당월 일별 태그별 총 건수, 총 금액)
			tempList = methodList.selectTagTotalList("income", accountBookNo, "tag", "day", date);
			ArrayList<ArrayList<TagTotalVO>> tagIncomeList = methodList.createDetailDataList(tempList, lastDate);

			model.addAttribute("tagIncomeList", tagIncomeList);
		}
		/* ---------------- income ---------------- */

		/* ---------------- expenditure ---------------- */
		// expenditureList (당월 일별 총 건수, 총 금액)
		tempList = methodList.selectTagTotalList("expenditure", accountBookNo, "date", "day", date);
		ArrayList<TagTotalVO> dateExpenditureList = methodList.createDataList(tempList, lastDate);

		model.addAttribute("dateExpenditureList", dateExpenditureList);

		if (calendarType.equals("A") || calendarType.equals("B")) {
			// expenditureItemList (당월 일별 태그별 총 건수, 총 금액)
			tempList = methodList.selectTagTotalList("expenditure", accountBookNo, "tag", "day", date);
			ArrayList<ArrayList<TagTotalVO>> tagExpenditureList = methodList.createDetailDataList(tempList, lastDate);

			model.addAttribute("tagExpenditureList", tagExpenditureList);
		}
		/* ---------------- expenditure ---------------- */

		// 달력 타입별 반환
		if (calendarType.equals("A")) {
			return "accountBook/mainCalendarTypeA";
		} else if (calendarType.equals("B")) {
			return "accountBook/mainCalendarTypeB";
		} else { // C
			return "accountBook/detailViewCalendar";
		}
	}

	/* 대시보드 조회 */
	@RequestMapping("/accountBook/detailView")
	public String detailView(HttpServletRequest request, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// 가계부 정보 가져오기
		AccountBookVO accountBookInfo = accountBookService.selectShareAccountBook(accountBookNo);

		boolean isShared = accountBookInfo.getIsShared(); // 가계부 구분

		model.addAttribute("isShared", isShared);

		return "accountBook/detailView";
	}

	/* 대시보드 조회 - 상세 내역 */
	@RequestMapping("/accountBook/detailViewList")
	public String detailViewList() {

		return "accountBook/detailViewList";
	}

	/* 지출,수입 내역 추가 form */
	@RequestMapping("/accountBook/add")
	public String addItemForm() {
		return "accountBook/addItemForm";
	}

	/* 수입 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/income")
	public int addIncome(@RequestParam("incomeDate") String date, @RequestParam("incomeSource") String source,
			@RequestParam("incomeAmount") int amount, @RequestParam("incomeMemo") String memo,
			@RequestParam("tagNo") String tagNo) {

		IncomeVO vo = new IncomeVO();
		vo.setIncomeDate(date);
		vo.setIncomeSource(source);
		vo.setIncomeAmount(amount);
		vo.setIncomeMemo(memo);
		vo.setTagNo(tagNo);

		accountBookService.insertIncome(vo);

		int incomeNo = vo.getIncomeNo();

		return incomeNo;
	}

	/* 지출 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/expenditure/")
	public int addExpenditure(@RequestParam("expenditureDate") String date,
			@RequestParam(value = "expenditureImage", required = false) MultipartFile file,
			@RequestParam("expenditureSource") String source, @RequestParam("expenditureMemo") String memo,
			@RequestParam("expenditureAddress") String address, @RequestParam("expenditureAmount") int totalAmount,
			@RequestParam("tagNo") String tagNo, @RequestParam("expenditureItemName") String[] nameArray,
			@RequestParam("expenditureItemPrice") int[] priceArray, HttpSession session) throws IOException {

		// 파일 업로드 및 파일 이름 지정
		String fileName = null;
		if (file != null) {
			String uploadPath = "C:/PayStory/PayStory/src/main/resources/static/file/receipt/";

			String originalFileName = file.getOriginalFilename();
			fileName = originalFileName;
			String filePathName = uploadPath + originalFileName;
			// String uploadFileName = session.getAttribute("memberNo") +"_"+
			// session.getAttribute("accountBookNo")+"_"+originalFileName;
			// String filePathName = uploadPath + uploadFileName;
			File file1 = new File(filePathName);

			file.transferTo(file1);
		}

		ExpenditureVO vo = new ExpenditureVO();
		vo.setExpenditureDate(date);
		vo.setExpenditureImage(fileName);
		vo.setExpenditureSource(source);
		vo.setExpenditureMemo(memo);
		vo.setExpenditureAddress(address);
		vo.setExpenditureAmount(totalAmount);
		vo.setTagNo(tagNo);

		accountBookService.insertExpenditure(vo);
		int expenditureNo = vo.getExpenditureNo();

		if (expenditureNo != 0) {
			ArrayList<ExpenditureItemVO> expenditureItemList = new ArrayList<ExpenditureItemVO>();
			for (int i = 0; i < nameArray.length; i++) {
				ExpenditureItemVO vo2 = new ExpenditureItemVO();
				vo2.setExpenditureNo(expenditureNo);
				vo2.setExpenditureItemName(nameArray[i]);
				vo2.setExpenditureItemPrice(priceArray[i]);
				expenditureItemList.add(vo2);
			}
			accountBookService.insertExpenditureItem(expenditureItemList);
		}
		return expenditureNo;
	}

	/****** 공유 가계부 ******/

	// 공유가계부 메인
	@RequestMapping("/accountBook/public/main")
	public String movePublicMain() {
		return "accountBook/public/main";
	}

	// 공유가계부 생성화면
	@RequestMapping("/accountBook/public/create")
	public String movePublicCreate() {
		return "accountBook/public/create";
	}

	// 공유가계부 생성
	@RequestMapping("/accountBook/public/create/do")
	public String createShareAccountBook(AccountBookVO accountBook, ShareAccountBookVO shareAccountBook,
			ShareBudgetVO ShareBudget, HttpSession httpSession) {

		// 가계부 데이터 등록(공유가계부 전용)
		accountBook.setIsShared(true);
		accountBook.setMemberNo((String) httpSession.getAttribute("memberNo"));
		createService.createAccountBook(accountBook);

		// 예산 등록(공유가계부 전용)
		ShareBudget.setOwner((String) httpSession.getAttribute("memberNo"));
		createService.createShareBudget(ShareBudget);

		// 공유가계부 데이터 등록(공유가계부 전용)
		shareAccountBook.setOwner((String) httpSession.getAttribute("memberNo"));
		String participant = "";

		for (int i = 0; i < shareAccountBook.getParticipant_list().length; i++) {
			participant = shareAccountBook.getParticipant_list()[i];
			if (participant == null) {
				continue;
			}
			shareAccountBook.setParticipant(participant);
			createService.createShareAccountBook(shareAccountBook);
		}

		return "redirect:../main";
		// return "redirect:/product/listAllProduct"; // 이렇게 해도 됨
	}

	// 공유가계부 참여자 등록,삭제
	@RequestMapping("/accountBook/public/registerParticipant")
	public String moveRegisterParticipant() {
		return "accountBook/public/registerParticipant";
	}
}