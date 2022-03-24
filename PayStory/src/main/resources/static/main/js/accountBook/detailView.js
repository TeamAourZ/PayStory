const date = new Date();

var nowYear = date.getFullYear();
var nowMonth = date.getMonth(); // 0~11까지
var nowDay = date.getDate(); // 오늘 날짜

var firstDay = new Date(nowYear, nowMonth, 1).getDay(); // 달의 시작 요일 번호
var lastDate = new Date(nowYear, nowMonth + 1, 0).getDate(); // 달의 마지막 날
var lastDay = new Date(nowYear, nowMonth + 1, 0).getDay(); // 달의 마지막 요일 번호

isType = "C";

$(function() {
	$('#selectedDate').text(nowYear + "년 " + (nowMonth + 1) + "월 " + nowDay + "일");

	calendarAjax(isType, nowYear, nowMonth, -1); // 달력
	chartAjax(nowYear, nowMonth, nowDay); // 차트
	budgetStatusAjax(nowYear, nowMonth); // 예산 현황
	detailViewListAjax(nowYear, nowMonth, nowDay); // 상세 내역

	/* 페이지 크기 변화 감지 */
	$(window).resize(function() {
		let width = getWidth();

		if (1183 < width && width < 1343) {
			$('.isScroll').addClass('table-responsive');
		} else if (width >= 620) {
			$('.isScroll').removeClass('table-responsive');
		} else if (width < 620) {
			$('.isScroll').addClass('table-responsive');
		}
	});

	/* 기록(수정자 조회) 버튼 클릭 */
	$(document).on('click', '.dataEditHistory', function() {
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
	$(document).on('click', '.dataEdit', function() {
		if (confirm("해당 내역을 수정하시겠습니까?")) {
			let condition = $(this).parent('div').children('input').eq(0).val();	// 수입 / 지출 구분
			let dataNo = $(this).parent('div').children('input').eq(1).val();	// 수입 / 지출 내역 번호

			location.href = "/accountBook/detailViewList/edit/" + condition + "/" + dataNo; // 수정 페이지 이동 (수입 / 지출 입력 페이지 활용)
		}
	});

	/* 삭제 버튼 클릭 */
	$(document).on('click', '.dataDelete', function() {
		if (confirm("해당 내역을 삭제하시겠습니까?")) {
			let condition = $(this).parent('div').children('input').eq(0).val();			// 수입 / 지출 구분
			let dataNo = $(this).parent('div').children('input').eq(1).val();			// 수입 / 지출 내역 번호
			let receiptImage = $(this).parent('div').children('input').eq(2).val();	// 영수증 이미지

			deleteItemAjax(condition, dataNo, receiptImage, nowYear, nowMonth, nowDay);

			alert("삭제가 완료되었습니다.");
		}
	});

	/* 이미지 아이콘 클릭 시 영수증 이미지 모달 띄우기 */
	$(document).on('click', '.receiptImageShow', function() {
		$('#receiptImgModal').attr('src', '/images/receipt/' + accountBookNo + '/' + $(this).parent('div').children('input').eq(2).val()).addClass('w-100');
	});
});