/* 가계부 정보 모달 - 수정 */
function updateAccountBookInfoAjax() {
	$.ajax({
		type: 'post',
		url: "/accountBook/modal/updateInfo",
		data: {
		},
		success: function(result) {
		},
		error: function() {
			console.log("error");
		}
	});
}