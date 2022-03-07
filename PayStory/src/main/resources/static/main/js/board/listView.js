/**
 * listView.js
 */
 
$(function(){
	// 카테고리 
	$('.boardCategory a').each(function(){
		$(this).on('click', function(){
			// 선택으로 이동
			let ctgNo = $(this).attr('data-ctgNo');
			
			if(ctgNo != '*') location.href='/board/listCategory/' + ctgNo;
			else location.href='/board/listAll';
		});
	});
	
	// 게시글 리스트 클릭 
	// 해당 게시글 번호를 가진 조회 페이지로 이동
	$(document).on('click', '.boardList', function(){
		let boardNo = $(this).children(":first").children("input").val();
		location.href='/board/view/'+ boardNo;
	});
	
	// 삭제 버튼 클릭
	$(document).on('click', '.deleteBoard', function(){
		let boardNo = $(this).parents('.boardList').children(":first").children("input").val();
		location.href='/board/delete/'+ boardNo;
	})
});