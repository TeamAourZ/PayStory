/**
 * calendar.js
 */

$(function() {
	const date = new Date();

	let nowYear = date.getFullYear();
	let nowMonth = date.getMonth();	// 0~11까지

	/* 달력 채우기 */
	function makeCalendar(year, month) {
		/*연도, 월 표시*/
		$('#yearMonth').text(`${year}년 ${month + 1}월`);
		//$('#yearMonth').text(`${year}년 ${(month + 1) < 10 ? `${month + 1}` : `${month + 1}`}월`);

		const firstDay = new Date(year, month, 1).getDay();		// 이번달 첫째 날의 요일
		const lastDate = new Date(year, month + 1, 0).getDate();	// 이번달 마지막 날 (다음달의 0번째 일은 이번달의 마지막날과 같다.)
		const lastDay = new Date(year, month + 1, 0).getDay();	// 이번달 마지막 날의 요일

		/* 첫째 날 전까지 공란 */
		for (let i = 0; i < firstDay; i++) {
			$('.dateSel').append('<div class="infoBox border"></div>');
		}

		/* 날짜 채우기 */
		for (let i = 1; i <= lastDate; i++) {
			let dateClass = `${year}-${(month + 1) < 10 ? `0${month + 1}` : `${month + 1}`}-${i < 10 ? `0${i}` : `${i}`}`;
			let text = "@@@@@@"; // 공휴일 명칭
			$('.dateSel').append(`
											<div class="infoBox d-flex flex-column">
												<div class="dateBox d-flex h-40">
													<div class="date ${dateClass} rounded-circle m-1">${i}</div>
													<div class="text-xs mt-2">${text}</div>
												</div>
												<div class="countBox d-flex w-50 h-60 align-items-start align-self-center text-center mt-1">
													<div class="incomeCount rounded-circle w-50">
														1
													</div>
													<div class="expenditureCount rounded-circle w-50">
														2
													</div>
												</div>
											</div>
			`);
		}
		
		/* 요일별 색상 지정 - 토, 일 */
		

		/* 남은 날 공란 */
		for (let i = 6; i > lastDay; i--) {
			$('.dateSel').append('<div class="infoBox border"></div>');
		}

		/* 달력 크기 맞추기 */
		if ($('.dateSel').children('div').length == 35) {
			for (let i = 0; i < 7; i++) {
				$('.dateSel').append('<div class="infoBox border"></div>');
			}
		}
	};
	makeCalendar(nowYear, nowMonth);

	/* 오늘 날짜 표시 */
	function checkToday() {
		$('.date').each(function() {
			if ($(this).text() == date.getDate() &&
				nowYear == date.getFullYear() && nowMonth == date.getMonth()) {
				$(this).addClass('today');
			}
		})
	};
	checkToday();

	/* 이전 버튼 클릭 */
	$('#prevMonthBtn').on('click', () => {
		$('.dateSel').children().remove();

		nowMonth--;
		if (nowMonth === -1) {		// 0월이 되면 이전 연도 12월로 변경
			nowYear--;
			nowMonth += 12;
		}

		makeCalendar(nowYear, nowMonth);
		checkToday();
	});

	/* 다음 버튼 클릭 */
	$('#nextMonthBtn').on('click', () => {
		$('.dateSel').children().remove();

		nowMonth++;
		if (nowMonth === 12) {		// 13월이 되면 다음 연도 1월로 변경
			nowYear++;
			nowMonth -= 12;
		}

		makeCalendar(nowYear, nowMonth);
		checkToday();
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		$('.dateSel').children().remove();

		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();

		makeCalendar(nowYear, nowMonth);
		checkToday();
	});

	/* 달력 클릭시 이벤트 */
	// 해당 날짜에 작성된 일기가 있으면 일기 조회 폼으로 이동(showDetailDiary)
	// 없으면 일기 작성 폼으로 이동(diaryForm)
	$(document).on('click', '.date', function(e) {
		e.stopImmediatePropagation();
		let date = $(this)[0].classList[1];
		//location.href = "/havediary/" + date;
		location.href = "#";
	})

});