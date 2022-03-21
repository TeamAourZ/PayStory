/* 예산 설정 모달 - 추가 또는 수정 */
function budgetSettingAjax() {
	$.ajax({
		type: 'post',
		url: "/accountBook/modal/budgetSetting",
		data: {
		},
		success: function(result) {
		},
		error: function() {
			console.log("error");
		}
	});
}