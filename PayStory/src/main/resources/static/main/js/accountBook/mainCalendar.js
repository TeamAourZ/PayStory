/**
 * mainCalendar.js
 */

const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지

var isType = ""; // 달력 타입

$(function() {
	/* 달력 로딩 */
	if (getWidth() >= 1374) {
		isType = "A";
		loadAjax("calendarTypeA");
	} else {
		isType = "B";
		loadAjax("calendarTypeB");
	}

	/* 페이지 크기 변화 감지 */
	$(window).resize(function() {
		let width = getWidth();

		if (width >= 1374 && isType == "B") {
			isType = "A";
			loadAjax("calendarTypeA");
		} else if (width < 1374 && isType == "A") {
			isType = "B";
			loadAjax("calendarTypeB");
		} else if (width >= 620 && isType == "B") {
			$('table').eq(0).removeClass('table-responsive');
		} else if (width < 620 && isType == "B") {
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

		if (isType == "A") {
			makeCalendarTypeA(nowYear, nowMonth);
		} else {
			makeCalendarTypeB(nowYear, nowMonth);
		}
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

		if (isType == "A") {
			makeCalendarTypeA(nowYear, nowMonth);
		} else {
			makeCalendarTypeB(nowYear, nowMonth);
		}
		checkToday();
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		$('.dateSel').children().remove();

		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();

		if (isType == "A") {
			makeCalendarTypeA(nowYear, nowMonth);
		} else {
			makeCalendarTypeB(nowYear, nowMonth);
		}
		checkToday();
	});

	/* 달력 클릭 이벤트 */
	$(document).on('click', '.infoBox', function(e) {
		e.stopImmediatePropagation();

		for (let i = 0; i < $('.infoBox').length; i++) {
			//console.log($('.infoBox').eq(i)[0].classList[1]);
			if ($('.infoBox').eq(i)[0].classList[1] !== "border") {
				if (isType == "A") {
					$('.infoBox').eq(i).css('border', '1px solid #b5b1b1');
				} else {
					$('.infoBox').eq(i).css('border', '1px solid white');
				}
				$('.infoBox').eq(i).children('div.dateBox').children('div.date').removeClass('selected');
			}
		}

		if ($(this)[0].classList[1] !== "border") {
			$(this).css('border', '1px solid black');
			$(this).children('div.dateBox').children('div.date').addClass('selected');
		}

		$('.viewOn').addClass('d-none');
		$('.viewOn').removeClass('viewOn');
	});

	/* 달력 수입 / 지출 태그 */
	/* 수입 - 마우스 오버 */
	/*$(document).on('mouseover', '.incomeCount', function() {
		let day = new Date(nowYear, nowMonth, 1);
		day = day.getDay();
		let idx = $(this).parent().parent().parent('div.infoBox').index() - day;

		$('.incomeItemListBox').eq(idx).removeClass('d-none');
	});*/
	/* 수입 - 마우스 아웃 */
	/*$(document).on('mouseout', '.incomeCount', function() {
		let day = new Date(nowYear, nowMonth, 1);
		day = day.getDay();
		let idx = $(this).parent().parent().parent('div.infoBox').index() - day;

		$('.incomeItemListBox').eq(idx).addClass('d-none');
	});*/
	/* 지출 - 마우스 오버 */
	/*$(document).on('mouseover', '.expenditureCount', function() {
		let day = new Date(nowYear, nowMonth, 1);
		day = day.getDay();
		let idx = $(this).parent().parent().parent('div.infoBox').index() - day;

		$('.expenditureItemListBox').eq(idx).removeClass('d-none');
	});*/
	/* 지출 - 마우스 아웃 */
	/*$(document).on('mouseout', '.expenditureCount', function() {
		let day = new Date(nowYear, nowMonth, 1);
		day = day.getDay();
		let idx = $(this).parent().parent().parent('div.infoBox').index() - day;

		$('.expenditureItemListBox').eq(idx).addClass('d-none');
	});*/

	/* 달력 수입 / 지출 태그 */
	/* 수입 */
	$(document).on('click', '.incomeCount', function(e) {
		e.stopImmediatePropagation();

		let idx = getDayNum($(this));

		$('.incomeItemListBox').eq(idx).toggleClass('d-none');
		$('.incomeItemListBox').eq(idx).addClass('viewOn');
		$('.detailBox').eq(idx).css('margin-top', '-4.2em');

		resetDisplay($('.incomeItemListBox'), idx, true);
		resetDisplay($('.expenditureItemListBox'), idx, false);
	});
	/* 지출 */
	$(document).on('click', '.expenditureCount', function(e) {
		e.stopImmediatePropagation();

		let idx = getDayNum($(this));

		$('.expenditureItemListBox').eq(idx).toggleClass('d-none');
		$('.expenditureItemListBox').eq(idx).addClass('viewOn');
		$('.detailBox').eq(idx).css('margin-top', '-2.2em');

		resetDisplay($('.incomeItemListBox'), idx, false);
		resetDisplay($('.expenditureItemListBox'), idx, true);
	});

	/* detailBox - 수입 상세 태그 / 지출 상세 태그 닫기 */
	$(document).on('click', '.detailBoxClose', function(e) {
		e.stopImmediatePropagation();

		$(this).parent().parent().parent().parent().parent().addClass('d-none');
	});
});