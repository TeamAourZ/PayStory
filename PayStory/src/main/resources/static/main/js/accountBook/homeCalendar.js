/**
 * homeCalendar.js
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

/* 페이지 로드 : 달력 */
function loadAjax(jspName) {
	$.ajax({
		url: jspName,
		success: function(result) {
			$('#calendarDateBox').html(result);

			/* 달력 B 스크롤바 생성 */
			if (getWidth() < 620) {
				$('table').eq(0).addClass('table-responsive');
			}

			if (isType == "A") {
				makeCalendarTypeA(nowYear, nowMonth);
			} else {
				makeCalendarTypeB(nowYear, nowMonth);
			}
			checkToday();
		},
		error: function() {
			console.log("error");
		}
	})
}

/* 페이지 크기 측정 */
function getWidth() {
	return $(this).width();
}

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

/* 달력 TypeB */
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

		$('.dateSel').append(`
			<td class="tdDate p-0 pt-1 pb-1">
				<div class="infoBox d-flex flex-column">
					<div class="dateBox d-flex align-items-center text-center">
						<div class="date ${dateClass} rounded-circle m-1">${i}</div>
						<div class="text-xs text-truncate">${text}</div>
					</div>
					<div class="countBox d-flex justify-content-evenly mr-1 mb-1 ml-1 align-items-center text-center">
						<div class="incomeCount help-cursor rounded-circle p-0">11</div>
						<div class="expenditureCount help-cursor rounded-circle p-0">21</div>
					</div>
					<div class="detailBox">
						
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

	/* detailBox 내용 */
	makeDetailInfo()

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
	dayColor(year, month);
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

/* detailBox 내용 */
function makeDetailInfo() {
	/* 임시 */

	/*
		table-responsive
		row m-0
	*/


	for (let i = 0; i < $('.infoBox').length; i++) {
		if ($('.infoBox').eq(i)[0].classList[1] != "border") {
			$('.infoBox').eq(i).children('div.detailBox').append(`
				<div class="incomeItemListBox position-absolute d-none">
					<div class="table table-responsive-sm mb-0">
						<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
							<div class="row m-0">
								<div class="col-sm-12">
									<i class="detailBoxClose fas fa-times position-absolute pointer-cursor"></i>
									<table class="table mb-0">
										<thead class="titleName">
											<tr class="text-center">
												<th>구분</th>
												<th>건수</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody class="incomeItem">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="expenditureItemListBox position-absolute d-none">
					<div class="table mb-0">
						<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
							<div class="row m-0">
								<div class="col-sm-12">
									<i class="detailBoxClose fas fa-times position-absolute pointer-cursor"></i>
									<table class="table mb-0">
										<thead class="titleName">
											<tr class="text-center">
												<th>구분</th>
												<th>건수</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody class="expenditureItem">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			`)

			/* 일자별 상세 태그 내용 : 임시 - 데이터에 맞게 추가해야 함*/
			/* 수입 */
			/*for (let i = 0; i < 7; i++) {
				$('.infoBox').eq(i).children('div.detailBox').children('.incomeItem').append(`
					<tr>
						<td>{@@@@}</td>
						<td>{123}</td>
						<td>{123,123,123}</td>
					</tr>
				`);
			}*/
			/* 지출 */
			/*for (let i = 0; i < 7; i++) {
				$('.infoBox').eq(i).children('div.detailBox').children('.expenditureItem').append(`
					<tr>
						<td>{@@@@}</td>
						<td>{123}</td>
						<td>{123,123,123}</td>
					</tr>
				`);
			}*/
		}
	}
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