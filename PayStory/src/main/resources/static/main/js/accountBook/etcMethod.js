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

			return;
		}
	});
}

/* 갱신 시 날짜 선택 스타일 유지 */
function maintainDay(year, month, day) {
	let date = year + '-' + zeroFill(month + 1) + '-' + zeroFill(day);

	$('.infoBox').each(function() {
		if ($(this).hasClass('border-color-black')) {
			$(this).removeClass('border-color-black');
			$(this).children('div.dateBox').children('div.date').removeClass('selected');
		}
		if ($(this).children('div.dateBox').children('div.date').hasClass(date)) {
			$(this).addClass('border-color-black');
			$(this).children('div.dateBox').children('div.date').addClass('selected');
		}
	});
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

/* 숫자 0 채우기 */
function zeroFill(num) {
	return num < 10 ? "0" + num : num;
}

/* 달력 이동 년, 월, 일 전환 */
function tabChange(before, after) {
	before.removeClass('active show');
	before.addClass('d-none');

	after.removeClass('d-none');
	after.addClass('active show');
}

/* 달력 이동 초기화 */
function tabReset(year, month, day) {
	$('#modalYearBox').addClass('active show');
	$('#modalMonthBox').removeClass('active show');
	$('#modalDayBox').removeClass('active show');

	$('#modalYearBox').removeClass('d-none');
	$('#modalMonthBox').addClass('d-none');
	$('#modalDayBox').addClass('d-none');

	resetSelected(year);
	resetSelected(month);
	resetSelected(day);

	$('#dateMoveBtn').attr('disabled', true);
	$('#dateMoveBtn').removeClass('btn-primary');
	$('#dateMoveBtn').addClass('btn-danger disabled');

	init($('.modalYear'), $('.modalMonth'), $('.modalDay'));
}

/* 달력 이동 현재 날짜 선택 */
function addSelected(obj, value) {
	obj.each(function() {
		if ($(this).text() == value) {
			$(this).addClass('selected');
		}
	});
}

/* 달력 이동 날짜 선택 초기화 */
function resetSelected(obj) {
	obj.each(function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		}
	});
}

/* 달력 이동 출력 텍스트 변경 */
function changeText(year, month, day) {
	$('#selectDate').text(
		(year != -1 ? year + "년 " : "") +
		(month != -1 ? month + "월 " : "") +
		(day != -1 ? day + "일" : "")
	);
}

/* 달력 이동 초기화 (현재 날짜) */
function init(yearObj, monthObj, dayObj) {
	addSelected(yearObj, date.getFullYear());
	addId(date.getFullYear());

	addSelected(monthObj, date.getMonth() + 1);

	addSelected(dayObj, date.getDate());

	changeText(date.getFullYear(), date.getMonth() + 1, date.getDate());
}

/* 현재 년도 id 추가 (scrollspy) */
function addId(value) {
	$('.modalYear').each(function() {
		if ($(this).text() == value) {
			$(this).attr({
				id: 'nowYear'
			})
		}
	});
}

/* 모달 전환 */
function switchModal(before, after) {
	after.modal('show');
	before.modal('hide');
}

/* 금액 천단위 콤마 생성 */
function withComma(num) {
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

/* 금액 콤마 해제 */
function withoutComma(num) {
	return num.toString().replace(/,/g, '');
}

/* 년-월 분할 */
function splitDate(date, returnValue) {
	let year = -1;
	let month = -1;

	let selectDate = date.split('-');

	if (returnValue == "year") {
		year = selectDate[0] * 1;
		
		return year;
	} else if (returnValue == "month") {
		month = selectDate[1] * 1;
		
		return month;
	}
}