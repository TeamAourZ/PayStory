const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지
var nowDay = date.getDate(); // 오늘 날짜

var isType = ""; // 달력 타입

$(function() {
	/* 달력 로딩 */
	if (getWidth() >= 1374) {
		isType = "A";
	} else {
		isType = "B";
	}

	calendarAjax(isType, nowYear, nowMonth, -1); // 달력
	chartAjax(nowYear, nowMonth, nowDay); // 차트
	budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	mainBoardAjax(); // 게시판

	/* 페이지 크기 변화 감지 */
	$(window).resize(function() {
		let width = getWidth();

		if (width >= 1374 && isType == "B") {
			isType = "A";
			calendarAjax(isType, nowYear, nowMonth, -1); // 달력
		} else if (width < 1374 && isType == "A") {
			isType = "B";
			calendarAjax(isType, nowYear, nowMonth, -1); // 달력
		} else if (width >= 620 && isType == "B") {
			$('.isScroll').removeClass('table-responsive');
		} else if (width < 620 && isType == "B") {
			$('.isScroll').addClass('table-responsive');
		}
	});

	/* 이전 버튼 클릭 */
	$('#prevMonthBtn').on('click', () => {
		nowMonth--;
		if (nowMonth === -1) { // 0월이 되면 이전 연도 12월로 변경
			nowYear--;
			nowMonth += 12;
		}

		nowDay = -1;

		calendarAjax(isType, nowYear, nowMonth, -1); // 달력
		chartAjax(nowYear, nowMonth, nowDay); // 차트
		budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	});

	/* 다음 버튼 클릭 */
	$('#nextMonthBtn').on('click', () => {
		nowMonth++;
		if (nowMonth === 12) { // 13월이 되면 다음 연도 1월로 변경
			nowYear++;
			nowMonth -= 12;
		}

		nowDay = -1;

		calendarAjax(isType, nowYear, nowMonth, -1); // 달력
		chartAjax(nowYear, nowMonth, nowDay); // 차트
		budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();
		nowDay = date.getDate();

		calendarAjax(isType, nowYear, nowMonth, -1); // 달력
		chartAjax(nowYear, nowMonth, nowDay); // 차트
		budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	});

	/* 달력 클릭 이벤트 */
	$(document).on('click', '.infoBox', function(e) {
		e.stopImmediatePropagation();

		$('.infoBox').each(function() {
			if ($(this).hasClass('border-color-black')) {
				$(this).removeClass('border-color-black');
				$(this).children('div.dateBox').children('div.date').removeClass('selected');
			}
		});

		$(this).addClass('border-color-black');
		$(this).children('div.dateBox').children('div.date').addClass('selected');

		$('.viewOn').addClass('d-none');
		$('.viewOn').removeClass('viewOn');

		nowDay = $('.date.selected').text();
	});

	/* 달력 + 버튼 클릭 이벤트 */
	$('#selectDayAddDataBtn').on('click', function() {
		if (0 < nowDay && nowDay <= 31) {
			let year = nowYear;
			let month = nowMonth + 1;
			let day = nowDay;
			let hours = date.getHours();
			let minutes = date.getMinutes();

			month = month < 10 ? "0" + month : month;
			day = day < 10 ? "0" + day : day;
			hours = hours < 10 ? "0" + hours : hours;
			minutes = minutes < 10 ? "0" + minutes : minutes;

			let dateTime = year + "-" + month + "-" + day + "T" + hours + ":" + minutes;

			location.href = "/accountBook/add/" + dateTime; // 내역 입력 페이지 이동
		} else {
			alert("날짜를 선택해주세요.");
		}
	});

	/* 달력 수입 / 지출 태그 */
	/* 수입 */
	$(document).on('click', '.incomeCount', function(e) {
		e.stopImmediatePropagation();

		/* 수입 / 지출 상세 박스 숨기기*/
		detailBoxHide();

		/* 상세 박스 선택 */
		let detailBox = detailBoxSelect($(this), isType, "income");

		detailBox.addClass('viewOn');
		detailBox.removeClass('d-none');
		detailBox.parent('div.detailBox').css('margin-top', '-4.2em');
	});
	/* 지출 */
	$(document).on('click', '.expenditureCount', function(e) {
		e.stopImmediatePropagation();

		/* 수입 / 지출 상세 박스 숨기기*/
		detailBoxHide();

		/* 상세 박스 선택 */
		let detailBox = detailBoxSelect($(this), isType, "expenditure");

		detailBox.addClass('viewOn');
		detailBox.removeClass('d-none');
		detailBox.parent('div.detailBox').css('margin-top', '-4.2em');
	});

	/* detailBox 닫기 - 수입 상세 태그 / 지출 상세 태그 / 월별 예산 현황 / 공유 회원 목록 */
	$(document).on('click', '.detailBoxClose', function(e) {
		e.stopImmediatePropagation();

		$(this).parent().parent().parent().parent().parent().addClass('d-none');
	});

	/* 당월 예산, 남은 예산, 총 수입금, 총 지출금 */
	$(document).on('click', '.budgetStatusBoxToggle', function(e) {
		e.stopImmediatePropagation();

		$('#budgetStatusBox').toggleClass('d-none');
	});

	/* 차트 태그 선택 */
	$(document).on('click', '.chartTab', function(e) {
		e.stopImmediatePropagation();

		$('.chartTab').each(function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('font-weight-bold text-primary selected');
			}
		});
		$(this).addClass('font-weight-bold text-primary selected');

		chartAjax(nowYear, nowMonth, nowDay); // 차트
	});

	/* 게시판 카테고리 선택 (전체, 공지사항) */
	$('.boardCategory').on('click', function() {
		$('.boardCategory').each(function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('font-weight-bold text-primary selected');
			}
		});
		$(this).addClass('font-weight-bold text-primary selected');

		mainBoardAjax(); // 게시판
	});

	/* 게시글 클릭 */
	$(document).on('click', '.postItem', function(e) {
		e.stopImmediatePropagation();

		let boardNo = $(this).children('input').val();

		location.href = '/board/view/' + boardNo;
	});

	/* 공유 회원 목록 */
	$(document).on('click', '.shareMemberBoxToggle', function(e) {
		e.stopImmediatePropagation();

		$('#shareMemberBox').toggleClass('d-none');
	});
});