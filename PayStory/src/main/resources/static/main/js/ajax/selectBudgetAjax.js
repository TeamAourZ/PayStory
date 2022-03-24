/* 가계부 정보 모달 - 예산 조회 */
function selectBudgetAjax(year, month) {
	$.ajax({
		type: 'post',
		url: "/accountBook/modal/selectBudget",
		data: {
			"year": year,
			"month": month,
		},
		success: function(result) {
			$('#budget').val(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		},
		error: function() {
			console.log("error");
		}
	});
}

function firstModalDateChange(e) {
	let year = -1;
	let month = -1;

	let selectDate = e.target.value.split('-');

	year = selectDate[0] * 1;
	month = selectDate[1] * 1;

	selectBudgetAjax(year, month);
}