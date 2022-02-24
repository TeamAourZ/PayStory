/* 페이지 로드 - 차트 */
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