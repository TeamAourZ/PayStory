const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지
var nowDay = date.getDate(); // 오늘 날짜

$(function() {
	$('#selectedDate').text(nowYear + "년 " + (nowMonth + 1) + "월 " + nowDay + "일");

	calendarAjax("C", nowYear, nowMonth, -1); // 달력
	chartAjax(nowYear, nowMonth, nowDay); // 차트
	budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	detailViewListAjax(nowYear, nowMonth, nowDay); // 상세 내역

	/* 페이지 크기 변화 감지 */
	$(window).resize(function() {
		let width = getWidth();

		if (1183 < width && width < 1643) {
			$('.isScroll').addClass('table-responsive');
		} else if (width >= 620) {
			$('.isScroll').removeClass('table-responsive');
		} else if (width < 620) {
			$('.isScroll').addClass('table-responsive');
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

		calendarAjax("C", nowYear, nowMonth, -1); // 달력
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

		calendarAjax("C", nowYear, nowMonth, -1); // 달력
		chartAjax(nowYear, nowMonth, nowDay); // 차트
		budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	});

	/* today 버튼 클릭 */
	$('#todayBtn').on('click', () => {
		const date = new Date();

		nowYear = date.getFullYear();
		nowMonth = date.getMonth();
		nowDay = date.getDate();

		calendarAjax("C", nowYear, nowMonth, -1); // 달력
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

		$('#selectedDate').text(nowYear + "년 " + (nowMonth + 1) + "월 " + nowDay + "일");

		chartAjax(nowYear, nowMonth, nowDay); // 차트
		detailViewListAjax(nowYear, nowMonth, nowDay); // 상세 내역
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

	/* 공유 회원 목록 */
	$(document).on('click', '.shareMemberBoxToggle', function(e) {
		e.stopImmediatePropagation();

		$('#shareMemberBox').toggleClass('d-none');
	});

	/* 기록(수정자 조회) 버튼 클릭 */
	$(document).on('click', '.dataEditHistory', function(e) {
		e.stopImmediatePropagation();

		let dataList = $(this).children('input').val(); // 수정자 목록 원본

		let editorList = dataList.split("━"); // 수정자 목록
		editorList.shift(); // 첫 요소(공백) 제거

		console.log(editorList);

		for (let i = 0; i < editorList.length; i++) {
			let editor = editorList[i].split("┃"); // 수정자 데이터

			$('.editMember').append(`
				<tr class="text-center">
					<td>${editor[0]}</td>
					<td>${editor[1]}</td>
				</tr>
			`);
		}
	});

	/* 수정 버튼 클릭 */
	$(document).on('click', '.dataEdit', function(e) {
		e.stopImmediatePropagation();

		if (confirm("해당 내역을 수정하시겠습니까?")) {
			let condition = $(this).parent('div').children('input').eq(0).val();	// 수입 / 지출 구분
			let dataNo = $(this).parent('div').children('input').eq(1).val();	// 수입 / 지출 내역 번호

			location.href = "/accountBook/detailViewList/edit/" + condition + "/" + dataNo; // 수정 페이지 이동 (수입 / 지출 입력 페이지 활용)
		}
	});

	/* 삭제 버튼 클릭 */
	$(document).on('click', '.dataDelete', function(e) {
		e.stopImmediatePropagation();

		if (confirm("해당 내역을 삭제하시겠습니까?")) {
			let condition = $(this).parent('div').children('input').eq(0).val();			// 수입 / 지출 구분
			let dataNo = $(this).parent('div').children('input').eq(1).val();			// 수입 / 지출 내역 번호
			let receiptImage = $(this).parent('div').children('input').eq(2).val();	// 영수증 이미지

			deleteItemAjax(condition, dataNo, receiptImage, nowYear, nowMonth, nowDay);

			alert("삭제가 완료되었습니다.");
		}
	});

	/* 이미지 아이콘 클릭 시 영수증 이미지 모달 띄우기 */
	$(document).on('click', '.receiptImageShow', function(e) {
		e.stopImmediatePropagation();

		$('#receiptImgModal').attr('src', '/images/receipt/' + accountBookNo + '/' + $(this).next('input').val()).addClass('w-100');
	});
});