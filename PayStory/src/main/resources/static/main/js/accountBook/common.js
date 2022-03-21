$(function() {
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

		nowDay = $('.date.selected').text();

		if (isType == "C") {
			$('#selectedDate').text(nowYear + "년 " + (nowMonth + 1) + "월 " + nowDay + "일");

			chartAjax(nowYear, nowMonth, nowDay); // 차트
			detailViewListAjax(nowYear, nowMonth, nowDay); // 상세 내역
		} else {
			$('.viewOn').addClass('d-none');
			$('.viewOn').removeClass('viewOn');
		}
	});

	/* detailBox 닫기 - 수입 상세 태그 / 지출 상세 태그 / 월별 예산 현황 / 공유 회원 목록 */
	$(document).on('click', '.detailBoxClose', function(e) {
		e.stopImmediatePropagation();

		$(this).parent().parent().parent()
			.parent().parent().parent()
			.parent().parent().parent().addClass('d-none');
	});

	/* 당월 예산, 남은 예산, 총 수입금, 총 지출금 */
	$('.budgetStatusBoxToggle').on('click', function() {
		$('#budgetStatusBox').toggleClass('d-none');
	});

	/* 차트 태그 선택 */
	$('.chartTab').on('click', function() {
		$('.chartTab').each(function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('font-weight-bold text-primary selected');
			}
		});
		$(this).addClass('font-weight-bold text-primary selected');

		chartAjax(nowYear, nowMonth, nowDay); // 차트
	});

	/* 공유 회원 목록 */
	$('.shareMemberBoxToggle').on('click', function() {
		$('#shareMemberBox').toggleClass('d-none');
	});
});