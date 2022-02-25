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
			$(this).addClass('today');
			$(this).parent('div.dateBox').parent('div.infoBox').css('border', '1px solid black');
			$(this).addClass('selected');
		}
	})
}

/*


날짜 index 확인 필


*/
/* 날짜 index */
function getDayNum(obj) {
	let day = new Date(nowYear, nowMonth, 1);
	day = day.getDay();
	let idx;

	if (isType == "A") {
		idx = obj.parent().parent().parent('div.infoBox').index() - day;
		console.log(obj.parent().parent().parent('div.infoBox').index());
		console.log($('.infoBox').index());
		console.log("day : " + day);
		console.log("idx : " + idx);
	} else {
		idx = obj.parent().parent().parent('td.tdDate').index() - day;
		console.log(obj.parent().parent().parent('td.tdDate').index());
		console.log("day : " + day);
		console.log("idx : " + idx);
	}

	return idx;
}

/* detailBox - 수입 상세 태그 / 지출 상세 태그 가리기 */
function resetDisplay(obj, idx, check) {
	for (let i = 0; i < obj.length; i++) {
		if (idx != i || check == false) {
			obj.eq(i).addClass('d-none');
			obj.eq(i).removeClass('viewOn')
		}
	}
}