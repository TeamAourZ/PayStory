/* 페이지 크기 측정 */
function getWidth() {
	return $(this).width();
}

/* 요일별 색상 지정 - 토, 일 */
function dayColor(year, month) {
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
			$(this).parent('div.dateBox').parent('div.infoBox').addClass('border-color-black');
			$(this).addClass('today');
			$(this).addClass('selected');
		}
	})
}

/* 대시보드 메인 - 달력 (A, B) 상세 박스 선택 */
function detailBoxSelect(obj, isType, isTag) {
	let detailBox;

	if (isType == "A") {
		detailBox = obj.parent().parent().next();
	} else {
		detailBox = obj.parent().next();
	}

	if (isTag === "income") {
		detailBox = detailBox.children('div:first-child');
	} else {
		detailBox = detailBox.children('div:last-child');
	}

	return detailBox;
}

/* 대시보드 메인 - 달력 (A, B) 수입 / 지출 상세 박스 숨기기 */
function detailBoxHide() {
	/* 수입 상세 박스 숨기기 */
	$('.tagIncomeListBox').each(function() {
		if ($(this).hasClass('viewOn')) {
			$(this).removeClass('viewOn');
			$(this).addClass('d-none');

			return;
		}
	});

	/* 지출 상세 박스 숨기기*/
	$('.tagExpenditureListBox').each(function() {
		if ($(this).hasClass('viewOn')) {
			$(this).removeClass('viewOn');
			$(this).addClass('d-none');

			return;
		}
	});
}