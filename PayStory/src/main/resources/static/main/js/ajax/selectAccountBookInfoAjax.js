/* 가계부 정보 모달 - 조회 */
function selectAccountBookInfoAjax(year, month) {
	$.ajax({
		type: 'post',
		url: "/accountBook/modal/selectInfo",
		data: {
			"year": year,
			"month": month + 1,
		},
		success: function(result) {
		},
		error: function() {
			console.log("error");
		}
	});
}