/* 가계부 정보 모달 - 수정 */
function updateAccountBookInfoAjax(title, describe) {
	$.ajax({
		type: 'post',
		url: "/accountBook/modal/updateAccountBookInfo",
		data: {
			"title": title,
			"describe": describe
		},
		success: function() {
			alert("수정 내역이 반영되었습니다.");
			
			$('.accountBookTitle').text(title);
		},
		error: function() {
			console.log("error");
		}
	});
}