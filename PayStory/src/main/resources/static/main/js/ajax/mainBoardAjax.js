/* 페이지 로드 - 게시글 */
function mainBoardAjax() {
	let boardTabNumber = -1;
	
	if ($('#boardTab1').hasClass('select')) {
		boardTabNumber = 1;
	} else if ($('#boardTab2').hasClass('select')) {
		boardTabNumber = 2;
	}
	
	$.ajax({
		type: 'post',
		url: "/accountBook/board",
		data: {
			"boardTabNumber": boardTabNumber,
		},
		success: function(result) {
			$('#postBox').html(result);
		},
		error: function() {
			console.log("error");
		}
	});
}