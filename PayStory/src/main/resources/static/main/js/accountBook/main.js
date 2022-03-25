const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지
var nowDay = date.getDate(); // 오늘 날짜

var firstDay = new Date(nowYear, nowMonth, 1).getDay(); // 달의 시작 요일 번호
var lastDate = new Date(nowYear, nowMonth + 1, 0).getDate(); // 달의 마지막 날
var lastDay = new Date(nowYear, nowMonth + 1, 0).getDay(); // 달의 마지막 요일 번호

var isType = ""; // 달력 타입

$(function() {
	/* 달력 로딩 */
	if (getWidth() >= 1374) {
		isType = "A";
	} else {
		isType = "B";
	}

	// 순서 설정
	if (getWidth() < 1183) {
		$('#chartAndBoardCard').css('order', '1');
		$('#calendarCard').css('order', '0');
	} else {
		$('#chartAndBoardCard').css('order', '0');
		$('#calendarCard').css('order', '1');
	}

	calendarAjax(isType, nowYear, nowMonth, -1); // 달력
	chartAjax(nowYear, nowMonth, nowDay); // 차트
	budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	mainBoardAjax(); // 게시판

	/* 페이지 크기 변화 감지 */
	$(window).resize(function() {
		let width = getWidth();

		// 달력 설정
		if (width >= 1374 && isType == "B") {
			isType = "A";
			calendarAjax(isType, nowYear, nowMonth, -1); // 달력
		} else if (width < 1374 && isType == "A") {
			isType = "B";
			calendarAjax(isType, nowYear, nowMonth, -1); // 달력
		} else if (width >= 620 && isType == "B") {
			$('.isScroll').removeClass('table-responsive');
		} else if (width < 620 && isType == "B") {
			$('.isScroll').addClass('table-responsive');
		}

		// 순서 설정
		if (width < 1183) {
			$('#chartAndBoardCard').css('order', '1');
			$('#calendarCard').css('order', '0');
		} else {
			$('#chartAndBoardCard').css('order', '0');
			$('#calendarCard').css('order', '1');
		}
	});

	/* 달력 + 버튼 클릭 이벤트 */
	$('#selectDayAddDataBtn').on('click', function() {
		if (0 < nowDay && nowDay <= 31) {
			let year = nowYear;
			let month = (nowMonth * 1) + 1;
			let day = nowDay;
			let hours = date.getHours();
			let minutes = date.getMinutes();

			month = month < 10 ? "0" + month : month;
			day = day < 10 ? "0" + day : day;
			hours = hours < 10 ? "0" + hours : hours;
			minutes = minutes < 10 ? "0" + minutes : minutes;

			let dateTime = year + "-" + month + "-" + day + "T" + hours + ":" + minutes;

			location.href = "/accountBook/add/" + dateTime; // 내역 입력 페이지 이동
		} else {
			alert("날짜를 선택해주세요.");
		}
	});

	/* 달력 수입 / 지출 태그 */
	/* 수입 */
	$(document).on('click', '.incomeCount', function(e) {
		e.stopImmediatePropagation();

		/* 수입 / 지출 상세 박스 숨기기*/
		detailBoxHide();

		/* 상세 박스 선택 */
		let detailBox = detailBoxSelect($(this), isType, "income");

		detailBox.addClass('viewOn');
		detailBox.removeClass('d-none');
		detailBox.parent('div.detailBox').css('margin-top', '-4.2em');
	});
	/* 지출 */
	$(document).on('click', '.expenditureCount', function(e) {
		e.stopImmediatePropagation();

		/* 수입 / 지출 상세 박스 숨기기*/
		detailBoxHide();

		/* 상세 박스 선택 */
		let detailBox = detailBoxSelect($(this), isType, "expenditure");

		detailBox.addClass('viewOn');
		detailBox.removeClass('d-none');
		detailBox.parent('div.detailBox').css('margin-top', '-4.2em');
	});

	/* 게시판 카테고리 선택 (전체, 공지사항) */
	$('.boardCategory').on('click', function() {
		$('.boardCategory').each(function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('font-weight-bold text-primary selected');
			}
		});
		$(this).addClass('font-weight-bold text-primary selected');

		mainBoardAjax(); // 게시판
	});

	/* 게시글 클릭 */
	$(document).on('click', '.postItem', function() {
		let boardNo = $(this).children('input').val();

		location.href = '/board/view/' + boardNo;
	});

	/* 가계부 설정 클릭 */
	$('#accountBookSettings').on('click', function() {
		selectAccountBookInfoAjax(); // 가계부 정보 조회
		selectBudgetAjax("first", nowYear, nowMonth + 1); // 예산 조회

		let date = nowYear + "-" + zeroFill(nowMonth + 1);

		$('#firstModalDate').val(date);

		$('#accountBookInfoModal').modal('show');
	});
});