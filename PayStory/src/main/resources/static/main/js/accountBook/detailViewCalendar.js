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
		nowMonth--;
		if (nowMonth === -1) { // 0월이 되면 이전 연도 12월로 변경
			nowYear--;
			nowMonth += 12;
		}

		calendarAjax("C", nowYear, nowMonth); // 달력
	});

	/* 다음 버튼 클릭 */
	$('#nextMonthBtn').on('click', () => {
		nowMonth++;
		if (nowMonth === 12) { // 13월이 되면 다음 연도 1월로 변경
			nowYear++;
			nowMonth -= 12;
		}

		calendarAjax("C", nowYear, nowMonth); // 달력
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();

		calendarAjax("C", nowYear, nowMonth); // 달력
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
});