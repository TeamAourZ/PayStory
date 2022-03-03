/* 페이지 로드 - 예산 현황 */
function budgetStatusAjax(year, month) {
	$.ajax({
		type: 'post',
		url: "/accountBook/budgetStatus",
		data: {
			"year": year,
			"month": month + 1,
		},
		success: function(result) {
			$('#budgetStatusBox').html(result);
		},
		error: function() {
			console.log("error");
		}
	});
}