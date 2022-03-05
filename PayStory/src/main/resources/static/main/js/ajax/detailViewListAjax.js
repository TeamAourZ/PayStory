/* 페이지 로드 - 일별 상세 내역 조회 */
function detailViewListAjax(year, month, day) {
	$.ajax({
		type: 'post',
		url: "/accountBook/detailViewList",
		data: {
			"year": year,
			"month": month + 1,
			"day": day
		},
		success: function(result) {
			$('#detailViewListBox').html(result);
		},
		error: function() {
			console.log("error");
		}
	});
}