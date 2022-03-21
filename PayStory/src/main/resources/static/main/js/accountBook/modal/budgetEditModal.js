$(function() {
	/* 예산 수정 버튼 클릭 */
	$('#budgetSettingBtn').on('click', function() {
		switchModal($('#accountBookInfoModal'), $('#budgetEditModal'));
	});
});