const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지
var nowDay = date.getDate(); // 오늘 날짜

$(function() {
	/* 달력 B 스크롤바 생성 */
	if ((1183 < getWidth() && getWidth() < 1643) || (getWidth() < 620)) {
		$('table').eq(0).addClass('table-responsive');
	}

	$('#selectedDate').text(nowYear + "년 " + (nowMonth + 1) + "월 " + nowDay + "일");

	calendarAjax("C", nowYear, nowMonth); // 달력
	chartAjax(nowYear, nowMonth, nowDay); // 차트
	budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	detailViewListAjax($('#selectedDate').text()); // 상세 내역

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
		nowMonth--;
		if (nowMonth === -1) { // 0월이 되면 이전 연도 12월로 변경
			nowYear--;
			nowMonth += 12;
		}

		nowDay = -1;

		calendarAjax("C", nowYear, nowMonth); // 달력
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

		calendarAjax("C", nowYear, nowMonth); // 달력
		chartAjax(nowYear, nowMonth, nowDay); // 차트
		budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();
		nowDay = date.getDate();

		calendarAjax("C", nowYear, nowMonth); // 달력
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

		$('#selectedDate').text(nowYear + "년 " + (nowMonth + 1) + "월 " + nowDay + "일");

		chartAjax(nowYear, nowMonth, nowDay); // 차트
		detailViewListAjax($('#selectedDate').text()); // 상세 내역
	});

	/* detailBox 닫기 - 월별 예산 현황 */
	$(document).on('click', '.detailBoxClose', function(e) {
		e.stopImmediatePropagation();

		$(this).parent().parent().parent().parent().parent().addClass('d-none');
	});

	/* budgetStatusBox - 당월 예산, 남은 예산, 총 수입금, 총 지출금 */
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
});