/**
 * detailViewCalendar.js
 */

const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지

$(function() {
	/* 달력 B 스크롤바 생성 */
	if ((1183 < getWidth() && getWidth() < 1643) || (getWidth() < 620)) {
		$('table').eq(0).addClass('table-responsive');
	}
	
	makeCalendarTypeB(nowYear, nowMonth);
	checkToday();

	/* 페이지 크기 변화 감지 */
	$(window).resize(function() {
		let width = getWidth();

		if (1183 < width && width < 1643) {
			$('table').eq(0).addClass('table-responsive');
		} else if (width >= 620) {
			$('table').eq(0).removeClass('table-responsive');
		} else if (width < 620) {
			$('table').eq(0).addClass('table-responsive');
		}
	});

	/* 이전 버튼 클릭 */
	$('#prevMonthBtn').on('click', () => {
		$('.dateSel').children().remove();

		nowMonth--;
		if (nowMonth === -1) { // 0월이 되면 이전 연도 12월로 변경
			nowYear--;
			nowMonth += 12;
		}

		makeCalendarTypeB(nowYear, nowMonth);
		checkToday();
	});

	/* 다음 버튼 클릭 */
	$('#nextMonthBtn').on('click', () => {
		$('.dateSel').children().remove();

		nowMonth++;
		if (nowMonth === 12) { // 13월이 되면 다음 연도 1월로 변경
			nowYear++;
			nowMonth -= 12;
		}

		makeCalendarTypeB(nowYear, nowMonth);
		checkToday();
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		$('.dateSel').children().remove();

		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();

		makeCalendarTypeB(nowYear, nowMonth);
		checkToday();
	});

	/* 달력 클릭 이벤트 */
	$(document).on('click', '.infoBox', function(e) {
		e.stopImmediatePropagation();

		for (let i = 0; i < $('.infoBox').length; i++) {
			//console.log($('.infoBox').eq(i)[0].classList[1]);
			if ($('.infoBox').eq(i)[0].classList[1] !== "border") {
				$('.infoBox').eq(i).css('border', '1px solid white');
				$('.infoBox').eq(i).children('div.dateBox').children('div.date').removeClass('selected');
			}
		}

		if ($(this)[0].classList[1] !== "border") {
			$(this).css('border', '1px solid black');
			$(this).children('div.dateBox').children('div.date').addClass('selected');
		}
	})
});

/* 페이지 크기 측정 */
function getWidth() {
	return $(this).width();
}

/* 달력 TypeC */
function makeCalendarTypeB(year, month) {
	/*연도, 월 표시*/
	$('#yearMonth').text(`${year}년 ${month + 1}월`);

	const firstDay = new Date(year, month, 1).getDay(); // 이번달 첫째 날의 요일
	const lastDate = new Date(year, month + 1, 0).getDate(); // 이번달 마지막 날 (다음달의 0번째 일은 이번달의 마지막날과 같다.)
	const lastDay = new Date(year, month + 1, 0).getDay(); // 이번달 마지막 날의 요일

	/* 첫째 날 전까지 공란 */
	$('.dateSel').append('<tr>');
	for (let i = 0; i < firstDay; i++) {
		$('.dateSel').append('<td></td>');
	}

	/* 날짜 채우기 */
	for (let i = 1; i <= lastDate; i++) {
		let dateClass = `${year}-${(month + 1) < 10 ? `0${month + 1}` : `${month + 1}`}-${i < 10 ? `0${i}` : `${i}`}`;
		let text = ""; // 공휴일 명칭

		let trSize = $('.dateSel').children('tr').length; // 주차 번호

		$('.dateSel').append(`
			<td class="p-0 pt-1 pb-1">
				<div class="infoBox d-flex flex-column">
					<div class="dateBox d-flex align-items-center text-center">
						<div class="date ${dateClass} rounded-circle m-1">${i}</div>
						<div class="text-xs text-truncate">${text}</div>
					</div>
					<div class="countBox d-flex justify-content-evenly mr-1 mb-1 ml-1 align-items-center text-center">
						<div class="incomeCount rounded-circle p-0">11</div>
						<div class="expenditureCount rounded-circle p-0">21</div>
					</div>
				</div>
			</td>
		`);

		let tdSize = $('.dateSel').children('td').length; // 해당 주차에 생성된 일

		if (tdSize % 7 == 0) {
			$('.dateSel').append(`
				</tr>
				<tr>
			`);
		}
	}

	/* 남은 날 공란 */
	for (let i = 6; i > lastDay; i--) {
		$('.dateSel').append('<td></td>');
	}
	$('.dateSel').append('</tr>');

	/* 달력 크기 맞추기 */
	if ($('.dateSel').children('td').length == 35) {
		$('.dateSel').append('<tr>');
		for (let i = 0; i < 7; i++) {
			$('.dateSel').append('<td></td>');
		}
		$('.dateSel').append('</tr>');
	}

	/* 요일별 색상 지정 - 토, 일 */
	$('.date').each(function(index) {
		let day = new Date(year, month, index + 1);
		day = day.getDay();

		if (day == 6 || day == 0) { // 토요일, 일요일
			$(this).css('color', '#ffb500');
		} else {
			$(this).css('color', '#2768fa');
		}
	});
}

/* 오늘 날짜 표시 */
function checkToday() {
	$('.date').each(function() {
		if ($(this).text() == date.getDate() && nowYear == date.getFullYear() && nowMonth == date.getMonth()) {
			$(this).addClass('today');
			$(this).parent('div.dateBox').parent('div.infoBox').css('border', '1px solid black');
			$(this).addClass('selected');
		}
	})
}
