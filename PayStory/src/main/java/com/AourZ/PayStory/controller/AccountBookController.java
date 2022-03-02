package com.AourZ.PayStory.controller;

import java.io.IOException;
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
	AccountCreateService createService;

	/* 대시보드 메인 - 내 가계부 */
	@RequestMapping("/accountBook/myMain")
	public String myMain(HttpServletRequest request, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		String signInMemberNo = (String) session.getAttribute("memberNo"); // 회원 번호

		// 가계부 정보 가져오기
		AccountBookVO accountBookInfo = accountBookService.getMyAccountBook(signInMemberNo, false);

		String accountBookTitle = accountBookInfo.getAccountBookTitle(); // 가계부 타이틀
		boolean isShared = accountBookInfo.getIsShared(); // 가계부 구분 - 내 가계부

		model.addAttribute("accountBookTitle", accountBookTitle);
		model.addAttribute("isShared", isShared);

		// 가계부 번호 session에 저장
		int accountBookNo = accountBookInfo.getAccountBookNo(); // 가계부 번호

		session.setAttribute("accountBookNo", accountBookNo);

		// 현재 년-월 (시스템 시간 기준)
		String date = nowDate();

		// 예산
		AccountBookBudgetVO budget = accountBookService.getAccountBookBudget(accountBookNo, date);

		if (budget != null) {
			model.addAttribute("budget", budget.getBudgetAmount());
		}

		// 총 수입 (당월 총 건수, 총 금액)
		ArrayList<TagTotalVO> income = accountBookService.getIncomeList(accountBookNo, "date", "month", date);
		
		System.out.println(income.size() + "!!!!!");
		System.out.println(date + " // ");

		if (income != null && income.size() > 0) {
			model.addAttribute("incomeTotalAmount", income.get(0).getSum());
		}

		// 총 지출 (당월 총 건수, 총 금액)
		ArrayList<TagTotalVO> expenditure = accountBookService.getExpenditureList(accountBookNo, "date", "month", date);

		if (expenditure != null && expenditure.size() > 0) {
			model.addAttribute("expenditureTotalAmount", expenditure.get(0).getSum());
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
		AccountBookVO accountBookInfo = accountBookService.getShareAccountBook(accountBookNo);

		String accountBookTitle = accountBookInfo.getAccountBookTitle(); // 가계부 타이틀
		boolean isShared = accountBookInfo.getIsShared(); // 가계부 구분 - 공유 가계부

		model.addAttribute("accountBookTitle", accountBookTitle);
		model.addAttribute("isShared", isShared);

		// 현재 년-월 (시스템 시간 기준)
		String date = nowDate();

		// 예산
		AccountBookBudgetVO budget = accountBookService.getAccountBookBudget(accountBookNo, date);

		if (budget != null) {
			model.addAttribute("budget", budget.getBudgetAmount());
		}

		// 총 수입 (당월 총 건수, 총 금액)
		ArrayList<TagTotalVO> income = accountBookService.getIncomeList(accountBookNo, "date", "year", date);

		if (income != null && income.size() > 0) {
			model.addAttribute("incomeTotalAmount", income.get(0).getSum());
		}

		// 총 지출 (당월 총 건수, 총 금액)
		ArrayList<TagTotalVO> expenditure = accountBookService.getExpenditureList(accountBookNo, "date", "year", date);

		if (expenditure != null && expenditure.size() > 0) {
			model.addAttribute("expenditureTotalAmount", expenditure.get(0).getSum());
		}

		return "accountBook/main";
	}

	/* 대시보드 메인 - 차트 */
	@RequestMapping("/accountBook/chart")
	public String chart(@RequestParam Map<String, Object> param, HttpServletRequest request, Model model) {
		// map 정보 가져오기
		int year = Integer.parseInt((String) param.get("year")); // 년
		int month = Integer.parseInt((String) param.get("month")); // 월
		String chartType = (String) param.get("chartType"); // 월 : m, 일 : d
		String chartTab = (String) param.get("chartTab"); // 수입 : income, 지출 : expenditure

		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// DB SELECT 기준 설정
		String monthText = zeroFill(month + 1); // 월
		String date = Integer.toString(year) + "-" + monthText; // 년-월
		String select = "tag"; // 날짜 기준, 태그 기준 설정
		String group = ""; // 그룹 기준 - 년 / 월 / 일

		if (chartType.equals("y")) {
			date = Integer.toString(year);
			group = "year";
		} else if (chartType.equals("m")) {
			group = "month";
		} else if (chartType.equals("d")) {
			group = "day";
		}

		// 수입 / 지출 중 선택된 데이터 가져오기
		if (chartTab.equals("income")) {
			// incomeList (당월 / 당일 태그별 총 건수, 총 금액)
			ArrayList<TagTotalVO> incomeList = accountBookService.getIncomeList(accountBookNo, select, group, date);

			for (int i = 0; i < incomeList.size(); i++) {
				incomeList.get(i).setTag(replaceTag(incomeList.get(i).getTag())); // 태그 번호 to 태그 이름
			}

			model.addAttribute("incomeList", incomeList);
		} else if (chartTab.equals("expenditure")) {
			// expenditureList (당월 / 당일 태그별 총 건수, 총 금액)
			ArrayList<TagTotalVO> expenditureList = accountBookService.getExpenditureList(accountBookNo, select, group,
					date);

			for (int i = 0; i < expenditureList.size(); i++) {
				expenditureList.get(i).setTag(replaceTag(expenditureList.get(i).getTag())); // 태그 번호 to 태그 이름
			}

			model.addAttribute("expenditureList", expenditureList);
		}

		return "accountBook/chart";
	}

	/* 대시보드 메인 - 게시판 */
	@RequestMapping("/accountBook/board")
	public String board(@RequestParam("boardTabNumber") int boardTabNumber, HttpServletRequest request, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		String signInMemberNo = (String) session.getAttribute("memberNo"); // 회원 번호

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
		// map 정보 가져오기
		String calendarType = (String) param.get("calendarType"); // 가계부 타입
		int year = Integer.parseInt((String) param.get("year")); // 년
		int month = Integer.parseInt((String) param.get("month")); // 월
		int firstDay = Integer.parseInt((String) param.get("firstDay")); // 달의 시작 요일 번호
		int lastDate = Integer.parseInt((String) param.get("lastDate")); // 달의 마지막 날
		int lastDay = Integer.parseInt((String) param.get("lastDay")); // 달의 마지막 요일 번호

		model.addAttribute("firstDay", firstDay);
		model.addAttribute("lastDate", lastDate);
		model.addAttribute("lastDay", lastDay);

		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		String date = "";

		// A, B, C 공통
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

		// 그룹 조건 - 년-월
		date = Integer.toString(year) + "-" + monthText; // 년-월

		/* ---------------- income ---------------- */
		// incomeList (당월 일별 총 건수, 총 금액)
		ArrayList<TagTotalVO> dateIncomeList = accountBookService.getIncomeList(accountBookNo, "date", "day", date);
		ArrayList<TagTotalVO> incomeList = createList(dateIncomeList, lastDate);

		model.addAttribute("incomeList", incomeList);

		if (calendarType.equals("A") || calendarType.equals("B")) {
			// incomeItemList (당월 일별 태그별 총 건수, 총 금액)
			ArrayList<TagTotalVO> tagIncomeList = accountBookService.getIncomeList(accountBookNo, "tag", "day", date);
			ArrayList<ArrayList<TagTotalVO>> incomeItemList = createItemList(tagIncomeList, lastDate);

			model.addAttribute("incomeItemList", incomeItemList);
		}
		/* ---------------- income ---------------- */

		/* ---------------- expenditure ---------------- */
		// expenditureList (당월 일별 총 건수, 총 금액)
		ArrayList<TagTotalVO> dateExpenditureList = accountBookService.getExpenditureList(accountBookNo, "date", "day",
				date);
		ArrayList<TagTotalVO> expenditureList = createList(dateExpenditureList, lastDate);

		model.addAttribute("expenditureList", expenditureList);

		if (calendarType.equals("A") || calendarType.equals("B")) {
			// expenditureItemList (당월 일별 태그별 총 건수, 총 금액)
			ArrayList<TagTotalVO> tagExpenditureList = accountBookService.getExpenditureList(accountBookNo, "tag",
					"day", date);
			ArrayList<ArrayList<TagTotalVO>> expenditureItemList = createItemList(tagExpenditureList, lastDate);

			model.addAttribute("expenditureItemList", expenditureItemList);
		}
		/* ---------------- expenditure ---------------- */

		// 달력 타입별 반환
		if (calendarType.equals("A")) {
			return "accountBook/calendarTypeA";
		} else if (calendarType.equals("B")) {
			return "accountBook/calendarTypeB";
		} else { // C
			return "accountBook/detailViewCalendar";
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

	/* 현재 년-월 (시스템 시간 기준) */
	private String nowDate() {
		LocalDate localDate = LocalDate.now();
		String year = Integer.toString(localDate.getYear());
		String month = zeroFill(localDate.getMonthValue());

		String date = year + "-" + month;

		return date;
	}

	/* 대시보드 메인 / 조회 - 달력((A / B) / C) : 수입 / 지출 리스트 생성 */
	private ArrayList<TagTotalVO> createList(ArrayList<TagTotalVO> dataList, int lastDate) {
		ArrayList<TagTotalVO> resultList = new ArrayList<TagTotalVO>();

		for (int i = 0; i < lastDate; i++) {
			TagTotalVO vo = new TagTotalVO();

			resultList.add(vo);
		}

		for (int i = 0; i < dataList.size(); i++) {
			String[] tempDate = dataList.get(i).getDate().split("-");
			int day = Integer.parseInt(tempDate[tempDate.length - 1]) - 1;

			dataList.get(i).setTag(replaceTag(dataList.get(i).getTag())); // 태그 번호 to 태그 이름

			resultList.set(day, dataList.get(i));
		}

		return resultList;
	}

	/* 대시보드 메인 - 달력(A / B) : 수입 / 지출 아이템 리스트 생성 */
	private ArrayList<ArrayList<TagTotalVO>> createItemList(ArrayList<TagTotalVO> dataList, int lastDate) {
		ArrayList<ArrayList<TagTotalVO>> resultItemList = new ArrayList<ArrayList<TagTotalVO>>();

		for (int i = 0; i < lastDate; i++) {
			ArrayList<TagTotalVO> voArray = new ArrayList<TagTotalVO>();

			resultItemList.add(voArray);
		}

		for (int i = 0; i < dataList.size(); i++) {
			String[] tempDate = dataList.get(i).getDate().split("-");
			int day = Integer.parseInt(tempDate[tempDate.length - 1]) - 1;

			dataList.get(i).setTag(replaceTag(dataList.get(i).getTag())); // 태그 번호 to 태그 이름

			resultItemList.get(day).add(dataList.get(i));
		}

		return resultItemList;
	}

	/* tagNo to tagName */
	private String replaceTag(String tagNo) {
		String tagName = accountBookService.getTagName(tagNo);

		return tagName;
	}

	/* 대시보드 조회 */
	@RequestMapping("/accountBook/detailView")
	public String detailView(HttpServletRequest request, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// 가계부 정보 가져오기
		AccountBookVO accountBookInfo = accountBookService.getShareAccountBook(accountBookNo);

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
	public int addIncome(@RequestParam("incomeDate") String date,
						 @RequestParam("incomeSource") String source,
						 @RequestParam("incomeAmount") int amount,
						 @RequestParam("incomeMemo") String memo,
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
	@RequestMapping("/accountBook/expenditure")
	public int addExpenditure(
			@RequestParam("expenditureItemName") String[] itemArray,
			@RequestParam("expenditureItemPrice") int[] priceArray,
			@RequestParam("tagNo") String tagNo,
			@RequestParam("memo") String memo,
			ExpenditureVO expenditureVO,
			HttpSession session) throws IOException {
		
		// expenditureVO.setAccountBookNo((int) session.getAttribute("accountBookNo"));
		System.out.println("====== VO 확인 ======");
		System.out.println(expenditureVO.getExpenditureAddress());
		System.out.println(expenditureVO.getExpenditureDate());
		System.out.println(expenditureVO.getExpenditureImage());
		System.out.println(expenditureVO.getExpenditureSource());
		expenditureVO.setExpenditureMemo(memo);
		expenditureVO.setTagNo(tagNo);
		
		accountBookService.insertExpenditure(expenditureVO);
		int expenditureNo = expenditureVO.getExpenditureNo();
		
		if(expenditureNo != 0) {
			ArrayList<ExpenditureItemVO> expenditureItemList = new ArrayList<ExpenditureItemVO>();
			for(int i=0; i<itemArray.length; i++) {
				ExpenditureItemVO ItemVO = new ExpenditureItemVO();
				ItemVO.setExpenditureNo(expenditureNo);
				ItemVO.setExpenditureItemName(itemArray[i]);
				ItemVO.setExpenditureItemPrice(priceArray[i]);
				expenditureItemList.add(ItemVO);
			}
			expenditureVO.setItemList(expenditureItemList);
			accountBookService.insertExpenditureItem(expenditureItemList);
		}
		
		return expenditureNo;
	}

	/****** 공유 가계부  ******/
	
	//공유가계부 메인
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
			ShareBudgetVO ShareBudget,HttpSession httpSession) {
		
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