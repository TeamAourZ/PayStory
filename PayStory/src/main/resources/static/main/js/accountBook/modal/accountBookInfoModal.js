$(function() {
	/* 뒤로가기, 돌아가기 버튼 클릭 */
	$('#backToModalBtn1, #backToModalBtn2').on('click', function() {
		switchModal($('#budgetEditModal'), $('#accountBookInfoModal'));
	});
});