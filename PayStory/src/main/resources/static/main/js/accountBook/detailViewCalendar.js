const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지

$(function() {
	/* 달력 B 스크롤바 생성 */
	if ((1183 < getWidth() && getWidth() < 1643) || (getWidth() < 620)) {
		$('table').eq(0).addClass('table-responsive');
	}

	calendarAjax("C", nowYear, nowMonth); // 가계부
	chartAjax(nowYear, nowMonth); // 차트
	detailViewListAjax(); // 상세 내역

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

		calendarAjax("C", nowYear, nowMonth); // 가계부
	});

	/* 다음 버튼 클릭 */
	$('#nextMonthBtn').on('click', () => {
		$('.dateSel').children().remove();

		nowMonth++;
		if (nowMonth === 12) { // 13월이 되면 다음 연도 1월로 변경
			nowYear++;
			nowMonth -= 12;
		}

		calendarAjax("C", nowYear, nowMonth); // 가계부
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		$('.dateSel').children().remove();

		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();

		calendarAjax("C", nowYear, nowMonth); // 가계부
	});

	/* 달력 클릭 이벤트 */
	$(document).on('click', '.infoBox', function(e) {
		e.stopImmediatePropagation();

		/* 날짜별 border 및 class 설정 */
		for (let i = 0; i < $('.infoBox').length; i++) {
			//console.log($('.infoBox').eq(i)[0].classList[1]);
			if ($('.infoBox').eq(i)[0].classList[1] !== "border") {
				$('.infoBox').eq(i).css('border', '1px solid white');
				$('.infoBox').eq(i).children('div.dateBox').children('div.date').removeClass('selected');
			}
		}

		/* 선택된 날짜 border 및 class 설정 */
		if ($(this)[0].classList[1] !== "border") {
			$(this).css('border', '1px solid black');
			$(this).children('div.dateBox').children('div.date').addClass('selected');
		}
	});
});