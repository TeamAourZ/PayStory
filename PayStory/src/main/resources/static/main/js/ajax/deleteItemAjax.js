/* 페이지 로드 - 내역 삭제 */
function deleteItemAjax(condition, dataNo, receiptImage, year, month, day) {
	$.ajax({
		type: 'post',
		url: "/accountBook/detailViewList/delete",
		data: {
			"condition": condition,
			"dataNo": dataNo,
			"receiptImage": receiptImage
		},
		success: function() {
		},
		error: function() {
			console.log("error");
		}, complete: function() {
			calendarAjax("C", year, month, day); // 달력
			chartAjax(year, month, day); // 차트
			budgetStatusAjax(year, month); // 예산 현황
			detailViewListAjax(year, month, day); // 상세 내역
		}
	});
}