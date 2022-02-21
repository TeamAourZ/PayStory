/**
 * calendarTypeA.js
 */

/* 달력 TypeA */
function makeCalendarTypeA(year, month) {
	/*연도, 월 표시*/
	$('#yearMonth').text(`${year}년 ${month + 1}월`);

	const firstDay = new Date(year, month, 1).getDay(); // 이번달 첫째 날의 요일
	const lastDate = new Date(year, month + 1, 0).getDate(); // 이번달 마지막 날 (다음달의 0번째 일은 이번달의 마지막날과 같다.)
	const lastDay = new Date(year, month + 1, 0).getDay(); // 이번달 마지막 날의 요일

	/* 첫째 날 전까지 공란 */
	for (let i = 0; i < firstDay; i++) {
		$('.dateSel').append('<div class="infoBox border"></div>');
	}

	/* 날짜 채우기 */
	for (let i = 1; i <= lastDate; i++) {
		let dateClass = `${year}-${(month + 1) < 10 ? `0${month + 1}` : `${month + 1}`}-${i < 10 ? `0${i}` : `${i}`}`;
		let text = ""; // 공휴일 명칭

		$('.dateSel').append(`
			<div class="infoBox d-flex flex-column">
				<div class="dateBox d-flex align-items-center text-center">
					<div class="date ${dateClass} rounded-circle m-1">${i}</div>
					<div class="text-xs text-truncate">${text}</div>
				</div>
				<div class="countBox mr-1 mb-1 ml-1 align-items-center text-center">
					<div class="row pl-3 mb-1">
						<div class="col-2 incomeCount help-cursor rounded-circle p-0">11</div>
						<div class="col-md-9 incomeValue text-left text-truncate mr-1 ml-1 p-0">123,123,113</div>
					</div>
					<div class="row pl-3">
						<div class="col-2 expenditureCount help-cursor rounded-circle p-0">21</div>
						<div class="col-md-9 expenditureValue text-left text-truncate mr-1 ml-1 p-0">-123,123,113</div>
					</div>
				</div>
				<div class="detailBox">
					
				</div>
			</div>
		`);
	}

	/* detailBox 내용 */
	makeDetailInfo()

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

	/* 요일별 색상 지정 - 토, 일 */
	dayColor(year, month);
}