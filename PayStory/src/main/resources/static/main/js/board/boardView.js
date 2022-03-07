/**
 * boardView.js
 */
 
 $(function(){
	$('.updateBtn').on('click', function(){
		let boardNo = $('.boardNo').val();
		alert("수정 페이지로 이동합니다.");
		location.href="/board/updateForm/" + boardNo;
	});
	
	$('.listBtn').on('click', function(){
		alert("목록 페이지로 이동합니다.");
		location.href="/board/listAll"
	})
});