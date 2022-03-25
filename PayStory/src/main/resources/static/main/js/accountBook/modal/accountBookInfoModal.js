$(function() {
	/* 예산 수정 버튼 클릭 */
	$('#budgetSettingBtn').on('click', function() {
		$('#secondModalDate').val($('#firstModalDate').val());

		let year = splitDate($('#firstModalDate').val(), "year");
		let month = splitDate($('#firstModalDate').val(), "month");

		selectBudgetAjax("second", year, month);

		switchModal($('#accountBookInfoModal'), $('#budgetEditModal'));
	});

	/* 수정 버튼 클릭 */
	$('#accountBookInfoEditBtn').on('click', function() {
		let title = $('#title').val();
		let describe = $('#describe').val();

		updateAccountBookInfoAjax(title, describe);

		$('#accountBookInfoModal').modal('hide');
	});
});