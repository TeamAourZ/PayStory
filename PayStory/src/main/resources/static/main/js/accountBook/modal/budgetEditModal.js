$(function() {
	/* 뒤로가기, 돌아가기 버튼 클릭 */
	$('#backToModalBtn1, #backToModalBtn2').on('click', function() {
		switchModal($('#budgetEditModal'), $('#accountBookInfoModal'));
	});

	/* 수정 버튼 클릭 */
	$('#budgetEditBtn').on('click', function() {
		let date = $('#secondModalDate').val();
		let budget = withoutComma($('#inputBudget').val());

		budgetSettingAjax(date, budget);
	});

	$('#inputBudget').on('keyup', function() {
		// 숫자만 입력
		$(this).val($(this).val().replace(/[^0-9]/g, ''));

		// 콤마
		let budget = $(this).val() || '0';
		let budgetWithComma = withComma(parseInt(budget));
		
		$(this).val(budgetWithComma);
	});
});