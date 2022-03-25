/* 가계부 정보 모달 - 예산 조회 */
function selectBudgetAjax(condition, year, month) {
	$.ajax({
		type: 'post',
		url: "/accountBook/modal/selectBudget",
		data: {
			"year": year,
			"month": month,
		},
		success: function(result) {
			if (condition == "first") {
				$('#budget').val(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			} else if (condition == "second") {
				$('#inputBudget').val(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			}
		},
		error: function() {
			console.log("error");
		}
	});
}

function firstModalDateChange(e) {
	let year = splitDate(e.target.value, "year");
	let month = splitDate(e.target.value, "month");

	selectBudgetAjax("first", year, month);
}

function secondModalDateChange(e) {
	let year = splitDate(e.target.value, "year");
	let month = splitDate(e.target.value, "month");

	selectBudgetAjax("second", year, month);
}