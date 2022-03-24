/* 가계부 정보 모달 - 가계부 정보 조회 */
function selectAccountBookInfoAjax() {
	$.ajax({
		type: 'post',
		url: "/accountBook/modal/selectAccountBookInfo",
		success: function(result) {
			$('#title').val(result.accountBookTitle);
			$('#describe').val(result.accountBookDescribe);
		},
		error: function() {
			console.log("error");
		}
	});
}