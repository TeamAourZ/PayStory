package com.AourZ.PayStory.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.AourZ.PayStory.model.accountBook.AccountBookBudgetVO;
import com.AourZ.PayStory.model.accountBook.AccountBookVO;
import com.AourZ.PayStory.model.accountBook.DateVO;
import com.AourZ.PayStory.model.accountBook.DetailViewItemComparator;
import com.AourZ.PayStory.model.accountBook.DetailViewItemVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureItemVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureVO;
import com.AourZ.PayStory.model.accountBook.IncomeVO;
import com.AourZ.PayStory.model.accountBook.MainBoardVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.ShareBudgetVO;
import com.AourZ.PayStory.model.accountBook.ShareMainVO;
import com.AourZ.PayStory.model.accountBook.TagTotalVO;
import com.AourZ.PayStory.model.board.BoardVO;
import com.AourZ.PayStory.model.member.MemberVO;
import com.AourZ.PayStory.model.member.ShareMemberVO;
import com.AourZ.PayStory.service.accountBook.AccountBookService;
import com.AourZ.PayStory.service.accountBook.ShareAccountService;

@Controller
public class AccountBookController {
	@Autowired
	private AccountBookService accountBookService;

	@Autowired
	private ShareAccountService shareAccountService;

	@Autowired
	private AccountBookMethod methodList;

	/* 대시보드 메인 - 일반 가계부 */
	@RequestMapping("/accountBook/myMain")
	public String myMain(HttpServletRequest request, HttpServletResponse response, Model model) {
		// session 정보 가져오기
		HttpSession session = request.getSession();
		String signInMemberNo = (String) session.getAttribute("memberNo"); // 회원 번호

		try {
			// 로그인 정보 확인
			if (signInMemberNo == null) {
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();

				out.println("<script>alert('로그인 정보가 정확하지 않습니다.'); location.href='/index';</script>");

				out.flush();

				return "index";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 가계부 정보 가져오기
		AccountBookVO accountBookInfo = accountBookService.selectMyAccountBook(signInMemberNo, false);

		// session 업데이트 (가계부 번호 추가)
		int accountBookNo = accountBookInfo.getAccountBookNo(); // 가계부 번호

		session.setAttribute("accountBookNo", accountBookNo);

		String accountBookTitle = accountBookInfo.getAccountBookTitle(); // 가계부 타이틀
		boolean isShared = accountBookInfo.getIsShared(); // 가계부 구분 - 일반 가계부

		model.addAttribute("accountBookTitle", accountBookTitle);
		model.addAttribute("isShared", isShared);

		// session 정보 등록
		session.setAttribute("isShared", isShared);

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

		// session 정보 갱신
		session.setAttribute("isShared", isShared);

		// 소유자, 참여자 조회
		ArrayList<ShareAccountBookVO> tempList = accountBookService.selectShareMemberList(accountBookNo);

		// 소유자, 참여자 리스트
		ArrayList<ShareMemberVO> shareMemberInfoList = new ArrayList<ShareMemberVO>();

		boolean isOwner = false; // 소유자 리스트 추가 유무
		String memberNo = ""; // 회원 번호

		for (int i = 0; i < tempList.size(); i++) {
			if (isOwner == false) {
				memberNo = tempList.get(i).getOwner();

				isOwner = true;
				i -= 1;
			} else {
				memberNo = tempList.get(i).getParticipant();
			}

			MemberVO member = accountBookService.selectMemberInfo("memberNo", memberNo);

			ShareMemberVO vo = new ShareMemberVO();

			vo.setMemberName(member.getMemberName());
			vo.setMemberEmail(member.getMemberEmail());
			vo.setMemberImage(member.getMemberImage());

			shareMemberInfoList.add(vo);
		}

		model.addAttribute("shareMemberInfoList", shareMemberInfoList);

		return "accountBook/main";
	}

	/* 대시보드 메인 - 차트 */
	@RequestMapping("/accountBook/chart")
	public String chart(@RequestParam HashMap<String, Object> param, HttpServletRequest request, Model model) {
		// map 정보 가져오기
		String year = (String) param.get("year"); // 년
		int month = Integer.parseInt((String) param.get("month")); // 월
		int day = -1;
		int lastDate = Integer.parseInt((String) param.get("lastDate")); // 달의 마지막 날

		if (param.get("day") != null && param.get("day") != "") {
			day = Integer.parseInt((String) param.get("day")); // 일
		}

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);

		String chartType = (String) param.get("chartType"); // 월 : m, 일 : d
		String chartTab = (String) param.get("chartTab"); // 수입 : income, 지출 : expenditure

		model.addAttribute("chartType", chartType);

		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// DB SELECT 기준 설정
		String monthText = methodList.zeroFill(month); // 월
		String date = year + "-" + monthText; // 년-월

		if (chartType.equals("y")) {
			date = year;
		} else if (chartType.equals("m")) {
			// 당월 월별 태그별 총 건수, 총 금액
			ArrayList<TagTotalVO> dataList = accountBookService.selectAccountBookTotalDataList(chartTab, accountBookNo,
					"tag", "month", date, "%Y-%m");

			for (int i = 0; i < dataList.size(); i++) {
				dataList.get(i).setTag(methodList.replaceTag(dataList.get(i).getTag())); // 태그 번호 to 태그 이름
			}

			model.addAttribute("dataList", dataList);
		} else if (chartType.equals("d")) {
			// 당월 일별 태그별 총 건수, 총 금액)
			ArrayList<TagTotalVO> tempList = accountBookService.selectAccountBookTotalDataList(chartTab, accountBookNo,
					"tag", "day", date, "%Y-%m-%d");
			ArrayList<ArrayList<TagTotalVO>> dataList = methodList.createDetailDataList(tempList, lastDate);

			model.addAttribute("dataList", dataList);
		}

		return "accountBook/chart";
	}

	/* 대시보드 메인 - 예산 현황 */
	@RequestMapping("/accountBook/budgetStatus")
	public String budget(@RequestParam HashMap<String, Object> param, HttpServletRequest request, Model model) {
		// map 정보 가져오기
		String year = (String) param.get("year"); // 년
		int month = Integer.parseInt((String) param.get("month")); // 월

		model.addAttribute("year", year);
		model.addAttribute("month", month);

		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// DB SELECT 기준 설정
		String monthText = methodList.zeroFill(month); // 월
		String date = year + "-" + monthText; // 년-월

		// 예산
		AccountBookBudgetVO budget = accountBookService.selectAccountBookBudget(accountBookNo, date);
		if (budget != null) {
			model.addAttribute("budget", budget.getBudgetAmount());
		}

		// 총 수입 (당월 총 건수, 총 금액)
		ArrayList<TagTotalVO> income = accountBookService.selectAccountBookTotalDataList("income", accountBookNo,
				"date", "month", date, "%Y-%m");
		if (income != null && income.size() > 0) {
			model.addAttribute("incomeTotalAmount", income.get(0).getSum());
		}

		// 총 지출 (당월 총 건수, 총 금액)
		ArrayList<TagTotalVO> expenditure = accountBookService.selectAccountBookTotalDataList("expenditure",
				accountBookNo, "date", "month", date, "%Y-%m");
		if (expenditure != null && expenditure.size() > 0) {
			model.addAttribute("expenditureTotalAmount", expenditure.get(0).getSum());
		}

		return "accountBook/budgetStatus";
	}

	/* 대시보드 메인 - 게시판 */
	@RequestMapping("/accountBook/board")
	public String board(@RequestParam("boardTab") int boardTab, Model model) {
		String boardCategoryNo = "bc001";

		// 게시글 조회
		ArrayList<BoardVO> originalBoardList = accountBookService.selectBoardList(boardTab, boardCategoryNo);

		// 게시글 리스트
		ArrayList<MainBoardVO> boardList = new ArrayList<MainBoardVO>();

		for (BoardVO board : originalBoardList) {
			MainBoardVO vo = new MainBoardVO();

			int boardNo = board.getBoardNo();
			String boardCategoryName = methodList.replaceCategory(board.getBoardCategoryNo()); // 카테고리 번호 to 카테고리 이름
			String boardTitle = board.getBoardTitle();

			// 회원 정보 조회
			MemberVO member = accountBookService.selectMemberInfo("memberNo", board.getMemberNo());

			String memberName = member.getMemberName();

			vo.setBoardNo(boardNo);
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
		String year = (String) param.get("year"); // 년
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

			String date = year + "-" + monthText + "-" + dayText; // 날짜별 class data

			DateVO vo = new DateVO();

			vo.setDate(date);
			vo.setDay(i);
			vo.setHolidayName(""); // 휴무일은 임시

			dateList.add(vo);
		}

		model.addAttribute("dateList", dateList);
		/* ---------------- dateList ---------------- */

		// 그룹 조건 - 년-월
		String date = year + "-" + monthText; // 년-월

		ArrayList<TagTotalVO> tempList = null;

		/* ---------------- income ---------------- */
		// incomeList (당월 일별 총 건수, 총 금액)
		tempList = accountBookService.selectAccountBookTotalDataList("income", accountBookNo, "date", "day", date,
				"%Y-%m-%d");
		ArrayList<TagTotalVO> dateIncomeList = methodList.createDataList(tempList, lastDate);

		model.addAttribute("dateIncomeList", dateIncomeList);

		if (calendarType.equals("A") || calendarType.equals("B")) {
			// incomeTagList (당월 일별 태그별 총 건수, 총 금액)
			tempList = accountBookService.selectAccountBookTotalDataList("income", accountBookNo, "tag", "day", date,
					"%Y-%m-%d");
			ArrayList<ArrayList<TagTotalVO>> tagIncomeList = methodList.createDetailDataList(tempList, lastDate);

			model.addAttribute("tagIncomeList", tagIncomeList);
		}
		/* ---------------- income ---------------- */

		/* ---------------- expenditure ---------------- */
		// expenditureList (당월 일별 총 건수, 총 금액)
		tempList = accountBookService.selectAccountBookTotalDataList("expenditure", accountBookNo, "date", "day", date,
				"%Y-%m-%d");
		ArrayList<TagTotalVO> dateExpenditureList = methodList.createDataList(tempList, lastDate);

		model.addAttribute("dateExpenditureList", dateExpenditureList);

		if (calendarType.equals("A") || calendarType.equals("B")) {
			// expenditureTagList (당월 일별 태그별 총 건수, 총 금액)
			tempList = accountBookService.selectAccountBookTotalDataList("expenditure", accountBookNo, "tag", "day",
					date, "%Y-%m-%d");
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

	/* 수입 / 지출 입력 페이지 이동 - 지출 탭으로만 */
	@RequestMapping("/accountBook/add/{dateTime}")
	public String dateToAdd(@PathVariable("dateTime") String dateTime, Model model) {
		model.addAttribute("dateTime", dateTime);

		return "accountBook/addItemForm";
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
	public String detailViewList(@RequestParam HashMap<String, Object> param, HttpServletRequest request, Model model) {
		// map 정보 가져오기
		String year = (String) param.get("year"); // 년
		int month = Integer.parseInt((String) param.get("month")); // 월
		int day = Integer.parseInt((String) param.get("day")); // 일

		// DB SELECT 기준 설정
		String monthText = methodList.zeroFill(month);
		String dayText = methodList.zeroFill(day);
		String date = year + "-" + monthText + "-" + dayText;

		// session 정보 가져오기
		HttpSession session = request.getSession();
		int accountBookNo = (int) session.getAttribute("accountBookNo"); // 가계부 번호

		// 등록 내역 리스트
		ArrayList<DetailViewItemVO> detailViewItemList = new ArrayList<DetailViewItemVO>();

		// 수입 내역 조회
		ArrayList<IncomeVO> incomeList = accountBookService.selectIncomeList(accountBookNo, date);

		// 수입 내역 리스트에 추가
		for (IncomeVO income : incomeList) {
			DetailViewItemVO vo = new DetailViewItemVO();

			vo.setCondition("income");
			vo.setDataNo(income.getIncomeNo());
			vo.setDate(income.getIncomeDate());
			vo.setSource(income.getIncomeSource());
			vo.setMemo(income.getIncomeMemo());
			vo.setAmount(income.getIncomeAmount());
			vo.setTagName(methodList.replaceTag(income.getTagNo()));
			vo.setAccountBookNo(income.getAccountBookNo());

			detailViewItemList.add(vo);
		}

		// 지출 내역 조회
		ArrayList<ExpenditureVO> expenditureList = accountBookService.selectExpenditureList(accountBookNo, date);

		// 지출 내역 리스트에 추가
		for (ExpenditureVO expenditure : expenditureList) {
			DetailViewItemVO vo = new DetailViewItemVO();

			vo.setCondition("expenditure");
			vo.setDataNo(expenditure.getExpenditureNo());
			vo.setDate(expenditure.getExpenditureDate());
			vo.setReceiptImage(expenditure.getExpenditureImage());
			vo.setSource(expenditure.getExpenditureSource());
			vo.setMemo(expenditure.getExpenditureMemo());
			vo.setAmount(expenditure.getExpenditureAmount());
			vo.setTagName(methodList.replaceTag(expenditure.getTagNo()));
			vo.setAccountBookNo(expenditure.getAccountBookNo());

			detailViewItemList.add(vo);
		}

		if (detailViewItemList != null && detailViewItemList.size() > 0) {
			Collections.sort(detailViewItemList, new DetailViewItemComparator()); // 날짜를 기준으로 오름차순 정렬

			model.addAttribute("detailViewItemList", detailViewItemList);
		}

		// 지출 상세 항목 리스트
		Map<Integer, ArrayList<ExpenditureItemVO>> expenditureItemList = new HashMap<Integer, ArrayList<ExpenditureItemVO>>();

		for (int i = 0; i < expenditureList.size(); i++) {
			ArrayList<ExpenditureItemVO> voList = accountBookService
					.selectExpenditureItem(expenditureList.get(i).getExpenditureNo());

			if (voList != null && voList.size() > 0) {
				expenditureItemList.put(voList.get(0).getExpenditureNo(), voList);
			}
		}

		if (expenditureItemList != null && expenditureItemList.size() > 0) {
			Object[] keyList = expenditureItemList.keySet().toArray();
			Arrays.sort(keyList); // key 값(지출 번호)을 기준으로 오름차순 정렬

			model.addAttribute("expenditureItemList", expenditureItemList);
		}

		return "accountBook/detailViewList";
	}

	/* 대시보드 조회 - 내역 수정 */
	@RequestMapping("/accountBook/detailViewList/edit")
	public String accountBookDataEdit() {
		return "";
	}

	/* 대시보드 조회 - 내역 삭제 */
	@RequestMapping("/accountBook/detailViewList/delete")
	public void accountBookDataDelete(@RequestParam HashMap<String, Object> param) {
		// map 정보 가져오기
		String condition = (String) param.get("condition"); // 수입 / 지출 구분
		int dataNo = Integer.parseInt((String) param.get("dataNo")); // 내역 번호

		accountBookService.deleteItem(condition, dataNo);
	}

	/* 지출,수입 내역 추가 form */
	@RequestMapping("/accountBook/add")
	public String addItemForm() {
		return "accountBook/addItemForm";
	}

	/* 수입 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/income")
	public int addIncome(IncomeVO incomeVO, HttpSession session) {
		incomeVO.setAccountBookNo((int) session.getAttribute("accountBookNo"));

		accountBookService.insertIncome(incomeVO);

		int incomeNo = incomeVO.getIncomeNo();

		return incomeNo;
	}

	/* 지출 항목 추가 */
	@ResponseBody
	@RequestMapping("/accountBook/expenditure")
	public int addExpenditure(ExpenditureVO expenditureVO, @RequestParam("expenditureItemPrice") int[] priceArray,
			@RequestParam("expenditureItemName") String[] nameArray, HttpSession session) {

		// session에서 accountBookNo, memberNo 가져오기
		expenditureVO.setAccountBookNo((int) session.getAttribute("accountBookNo"));

		// 파일 없을 때 예외 처리하기
		System.out.println();
		if (!expenditureVO.getExpenditureImage().equals("")) {
			String fileName = session.getAttribute("memberNo") + "_" + session.getAttribute("accountBookNo") + "_"
					+ expenditureVO.getExpenditureImage();
			expenditureVO.setExpenditureImage(fileName);
		}

		accountBookService.insertExpenditure(expenditureVO);

		int expenitureNo = expenditureVO.getExpenditureNo();
		if (expenitureNo != 0) {
			if (priceArray.length != 0 && nameArray.length != 0) {
				ArrayList<ExpenditureItemVO> expenditureItemList = new ArrayList<ExpenditureItemVO>();
				for (int i = 0; i < priceArray.length; i++) {
					ExpenditureItemVO ItemVO = new ExpenditureItemVO();
					ItemVO.setExpenditureNo(expenitureNo);
					ItemVO.setExpenditureItemName(nameArray[i]);
					ItemVO.setExpenditureItemPrice(priceArray[i]);
					expenditureItemList.add(ItemVO);
				}
				expenditureVO.setItemList(expenditureItemList);
				accountBookService.insertExpenditureItem(expenditureItemList);
			}
		}
		return expenitureNo;
	}

	
	/****** 공유 가계부 ******/

	// 공유가계부 메인
	@RequestMapping("/accountBook/public/main")
	public String movePublicMain(Model model, HttpSession httpSession) {

		
				// main view 페이지에 전달할 모델
				ArrayList<ShareMainVO> shareMainVOList = new ArrayList<ShareMainVO>();
				
				// 로그인한 회원 No
				String memberNo = (String) httpSession.getAttribute("memberNo"); 
				
				// 참여중인 공유가계부 데이터 가져오기
				ArrayList<AccountBookVO> accountBookVO = shareAccountService.selectShareAccountBookNo(memberNo);
				
				for(int i = 0; i < accountBookVO.size(); i++) {
					// 공유가계부 owner 데이터 가져오기
					MemberVO ownerVO = shareAccountService.selectShareAccountOwner(accountBookVO.get(i).getAccountBookNo()); 
					// 공유가계부 participant 데이터 가져오기
					ArrayList<MemberVO> participantVO = shareAccountService.selectShareAccountParticipant(accountBookVO.get(i).getAccountBookNo());
					
					// participant image담을 배열 생성
					String participant[] = new String[3];
					String participantNo[] = new String[3];
					
					// participant image, memberNo담기
					for(int z = 0; z < participantVO.size(); z++) {	//participantVO.size() 질문
						participant[z]=participantVO.get(z).getMemberImage();
						participantNo[z]=participantVO.get(z).getMemberNo();
					}
					
					ShareMainVO shareMainVO = new ShareMainVO();
					
					//원하는 정보만 빼내서 shareMainVO에 넣기
					shareMainVO.setAccountBookTitle(accountBookVO.get(i).getAccountBookTitle());
					shareMainVO.setOwnerNo(ownerVO.getMemberNo());
					shareMainVO.setOwnerImage(ownerVO.getMemberImage());
					shareMainVO.setOwnerName(ownerVO.getMemberName());
					shareMainVO.setParticipantImage(participant);
					shareMainVO.setParticipantNo(participantNo);
					shareMainVO.setAccountBookNo(accountBookVO.get(i).getAccountBookNo());
					
					
					//shareMainVOList에 shareMainVO넣기
					shareMainVOList.add(shareMainVO);
				}
					model.addAttribute("shareMainVOList", shareMainVOList);
		

		return "accountBook/public/main";

	}


	
	//공유가계부 메인화면에서 공유가계부 클릭시 accountBookNo 세션에 저장후 대시보드-공유가계부 페이지로

	@RequestMapping("/accountBook/public/setAccountNo")
	public String movePublicDetail(HttpSession httpSession, @RequestParam Integer num) {

		httpSession.setAttribute("accountBookNo", num);

		return "redirect:../shareMain";
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
		shareAccountService.createAccountBook(accountBook);

		// 예산 등록(공유가계부 전용)
		ShareBudget.setOwner((String) httpSession.getAttribute("memberNo"));
		shareAccountService.createShareBudget(ShareBudget);

		// 공유가계부 데이터 등록(공유가계부 전용)
		shareAccountBook.setOwner((String) httpSession.getAttribute("memberNo"));
		String participant = "";

		for (int i = 0; i < shareAccountBook.getParticipant_list().length; i++) {
			participant = shareAccountBook.getParticipant_list()[i];
			if (participant == null) {
				continue;
			}
			shareAccountBook.setParticipant(participant);
			shareAccountService.createShareAccountBook(shareAccountBook);
		}

		return "redirect:../main";
	}

	
	
	// 공유가계부 참여자 편집
	@RequestMapping("/accountBook/public/editParticipant")
	public String moveRegisterParticipant(Model model, @RequestParam Integer num, HttpSession httpSession) {
		
		//수정할 accountBookNo 세션에 저장
		httpSession.setAttribute("accountBookNo", num);
		
		// 공유가계부 owner 데이터 가져오기
		MemberVO ownerVO = shareAccountService.selectShareAccountOwner(num); 
		// 공유가계부 participant 데이터 가져오기
		ArrayList<MemberVO> participantVO = shareAccountService.selectShareAccountParticipant(num);
		
		// participant image담을 배열 생성
		String participant[] = new String[3];
		String participantNo[] = new String[3];
		
		// participant image, memberNo담기
		for(int z = 0; z < participantVO.size(); z++) {	//participantVO.size() 질문
			participant[z]=participantVO.get(z).getMemberImage();
			participantNo[z]=participantVO.get(z).getMemberNo();
		}
		
		ShareMainVO shareMainVO = new ShareMainVO();
		
		//원하는 정보만 빼내서 shareMainVO에 넣기
		shareMainVO.setOwnerNo(ownerVO.getMemberNo());
		shareMainVO.setOwnerImage(ownerVO.getMemberImage());
		shareMainVO.setOwnerName(ownerVO.getMemberName());
		shareMainVO.setParticipantImage(participant);
		shareMainVO.setParticipantNo(participantNo);
		
		//보내기
		model.addAttribute("shareMainVO", shareMainVO);
		
		return "accountBook/public/editParticipant";
	}
}