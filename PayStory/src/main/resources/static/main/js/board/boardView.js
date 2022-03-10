/**
 * boardView.js
 */
 
 $(function(){
	// 수정 버튼 클릭
	$('.updateBtn').on('click', function(){
		let boardNo = $('.boardNo').val();
		alert("수정 페이지로 이동합니다.");
		location.href="/board/updateForm/" + boardNo;
	});
	
	// 삭제 버튼 클릭
	$('.deleteBtn').on('click', function(){
		let boardNo = $('.boardNo').val();
		let answer = confirm('정말로 삭제하시겠습니까?');
		if(answer) location.href='/board/delete/'+ boardNo;
	});
	
	// 목록 버튼 클릭
	$('.listBtn').on('click', function(){
		alert("목록 페이지로 이동합니다.");
		location.href="/board/listAll"
	})
});