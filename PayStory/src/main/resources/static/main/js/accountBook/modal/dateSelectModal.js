$(function() {
	let yearBox = $('#modalYearBox');
	let monthBox = $('#modalMonthBox');
	let dayBox = $('#modalDayBox');

	let selectedYear = -1;
	let selectedMonth = -1;
	let selectedDay = -1;

	/* 초기화 */
	tabReset($('.modalYear'), $('.modalMonth'), $('.modalDay'));

	/* 선택된 날짜 text 클릭 */
	$('#selectDate').on('click', function() {
		if ($(this).hasClass('day')) {
			tabChange(dayBox, monthBox);

			$(this).removeClass('day');
		} else if ($(this).hasClass('month')) {
			tabChange(monthBox, yearBox);
			tabChange(dayBox, yearBox);

			$(this).removeClass('month');
		} else if ($(this).hasClass('year')) {
			tabChange(monthBox, yearBox);

			$(this).removeClass('year');
		}
	});

	/* 년 선택 */
	$(document).on('click', '.modalYear', function() {
		resetSelected($('.modalYear'));

		$(this).addClass('selected');
		selectedYear = $(this).text();

		$('#selectDate').addClass('year');
		changeText(selectedYear, selectedMonth, selectedDay);

		tabChange(yearBox, monthBox);
	});

	/* 월 선택 */
	$(document).on('click', '.modalMonth', function() {
		resetSelected($('.modalMonth'));

		$(this).addClass('selected');
		selectedMonth = $(this).text();

		$('#selectDate').addClass('month');
		changeText(selectedYear, selectedMonth, selectedDay);

		tabChange(monthBox, dayBox);
	});

	/* 일 선택 */
	$(document).on('click', '.modalDay', function() {
		resetSelected($('.modalDay'));

		$(this).addClass('selected');
		selectedDay = $(this).text();

		$('#selectDate').addClass('day');
		changeText(selectedYear, selectedMonth, selectedDay);

		$('#dateMoveBtn').attr('disabled', false);
		$('#dateMoveBtn').removeClass('btn-danger disabled');
		$('#dateMoveBtn').addClass('btn-primary');
	});

	/* 이동 버튼 클릭 */
	$('#dateMoveBtn').on('click', function() {
		$('#dateSelectModal').modal('hide');

		nowYear = selectedYear;
		nowMonth = selectedMonth - 1;
		nowDay = selectedDay;

		calendarAjax(isType, nowYear, nowMonth, nowDay); // 달력
		chartAjax(nowYear, nowMonth, nowDay); // 차트
		budgetStatusAjax(nowYear, nowMonth); // 예산 현황

		if (isType == "C") {
			detailViewListAjax(nowYear, nowMonth, nowDay); // 상세 내역
		}

		selectedYear = -1;
		selectedMonth = -1;
		selectedDay = -1;

		tabReset($('.modalYear'), $('.modalMonth'), $('.modalDay'));

		changeText(selectedYear, selectedMonth, selectedDay);
	});
});