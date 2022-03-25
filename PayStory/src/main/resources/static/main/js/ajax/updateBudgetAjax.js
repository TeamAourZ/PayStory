/* 예산 설정 모달 - 추가 또는 수정 */
function budgetSettingAjax(date, budget) {
	$.ajax({
		type: 'post',
		url: "/accountBook/modal/budgetUpdate",
		data: {
			"date": date,
			"budget": budget
		},
		success: function() {
			alert(date + " 의 예산 설정이 완료되었습니다.");

			if (date === $('#firstModalDate').val()) {
				$('#budget').val(budget.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

				budgetStatusAjax(nowYear, nowMonth);

				$('#secondModalDate').val("");
				$('#inputBudget').val("");
			}
		},
		error: function() {
			console.log("error");
		}
	});
}