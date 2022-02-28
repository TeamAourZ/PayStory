/* 페이지 로드 - 게시글 */
function mainBoardAjax() {
	let boardTab = -1;
	
	if ($('#boardTab1').hasClass('selected')) {
		boardTab = 1;
	} else if ($('#boardTab2').hasClass('selected')) {
		boardTab = 2;
	}
	
	$.ajax({
		type: 'post',
		url: "/accountBook/board",
		data: {
			"boardTab": boardTab,
		},
		success: function(result) {
			$('#postBox').html(result);
		},
		error: function() {
			console.log("error");
		}
	});
}