const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지

var isType = ""; // 달력 타입

$(function() {
	/* 달력 로딩 */
	if (getWidth() >= 1374) {
		isType = "A";
	} else {
		isType = "B";
	}

	calendarAjax(isType, nowYear, nowMonth); // 달력
	mainBoardAjax(); // 게시판
	chartAjax(nowYear, nowMonth); // 차트

	/* 페이지 크기 변화 감지 */
	$(window).resize(function() {
		let width = getWidth();

		if (width >= 1374 && isType == "B") {
			isType = "A";
			calendarAjax(isType, nowYear, nowMonth); // 달력
		} else if (width < 1374 && isType == "A") {
			isType = "B";
			calendarAjax(isType, nowYear, nowMonth); // 달력
		} else if (width >= 620 && isType == "B") {
			$('table').eq(0).removeClass('table-responsive');
		} else if (width < 620 && isType == "B") {
			$('table').eq(0).addClass('table-responsive');
		}
	});

	/* 이전 버튼 클릭 */
	$('#prevMonthBtn').on('click', () => {
		nowMonth--;
		if (nowMonth === -1) { // 0월이 되면 이전 연도 12월로 변경
			nowYear--;
			nowMonth += 12;
		}
		calendarAjax(isType, nowYear, nowMonth); // 달력
	});

	/* 다음 버튼 클릭 */
	$('#nextMonthBtn').on('click', () => {
		nowMonth++;
		if (nowMonth === 12) { // 13월이 되면 다음 연도 1월로 변경
			nowYear++;
			nowMonth -= 12;
		}

		calendarAjax(isType, nowYear, nowMonth); // 달력
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();

		calendarAjax(isType, nowYear, nowMonth); // 달력
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
	});

	/* 달력 수입 / 지출 태그 */
	/* 수입 */
	$(document).on('click', '.incomeCount', function(e) {
		e.stopImmediatePropagation();

		$('.tagIncomeListBox').each(function() {
			if ($(this).hasClass('viewOn')) {
				$(this).toggleClass('viewOn');
				$(this).toggleClass('d-none');
			}
		});

		let selectCount;

		if (isType == "A") {
			selectCount = $(this).parent().parent().next().children('div:first-child');
		} else {
			selectCount = $(this).parent().next().children('div:first-child');
		}

		selectCount.toggleClass('viewOn');
		selectCount.toggleClass('d-none');
		selectCount.parent('div.detailBox').css('margin-top', '-4.2em');
	});
	/* 지출 */
	$(document).on('click', '.expenditureCount', function(e) {
		e.stopImmediatePropagation();

		$('.tagExpenditureListBox').each(function() {
			if ($(this).hasClass('viewOn')) {
				$(this).toggleClass('viewOn');
				$(this).toggleClass('d-none');
			}
		});

		let selectCount;

		if (isType == "A") {
			selectCount = $(this).parent().parent().next().children('div:last-child');
		} else {
			selectCount = $(this).parent().next().children('div:last-child');
		}

		selectCount.toggleClass('viewOn');
		selectCount.toggleClass('d-none');
		selectCount.parent('div.detailBox').css('margin-top', '-2.2em');
	});

	/* detailBox - 수입 상세 태그 / 지출 상세 태그 닫기 */
	$(document).on('click', '.detailBoxClose', function(e) {
		e.stopImmediatePropagation();

		$(this).parent().parent().parent().parent().parent().addClass('d-none');
	});

	/* budgetStatusBox - 당월 예산, 남은 예산, 총 수입금, 총 지출금 */
	$('.budgetStatusBoxToggle').on('click', function() {
		$('#budgetStatusBox').toggleClass('d-none');
	});

	/* 차트 태그 선택 */
	$('.chartTab').on('click', function(selectIndex) {
		$('.chartTab').each(function(index) {
			if (selectIndex != index) {
				$(this).removeClass('selected');
			}
		});
		$(this).addClass('selected');

		chartAjax(nowYear, nowMonth); // 차트
	});

	/* 카테고리 선택 */
	$('.boardCategory').on('click', function(selectIndex) {
		$('.boardCategory').each(function(index) {
			if (selectIndex != index) {
				$(this).removeClass('selected');
			}
		});
		$(this).addClass('selected');

		mainBoardAjax(); // 게시판
	});
});