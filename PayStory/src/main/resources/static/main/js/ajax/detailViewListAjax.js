/* 페이지 로드 - 일별 상세 내역 조회 */
function detailViewListAjax() {
	$.ajax({
		type: 'post',
		url: "/accountBook/detailViewList",
		data: {
		},
		success: function(result) {
			$('#detailViewListBox').html(result);
		},
		error: function() {
			console.log("error");
		}
	});
}