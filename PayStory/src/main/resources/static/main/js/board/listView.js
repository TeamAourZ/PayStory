/**
 * listView.js
 */
 
$(function(){
	// 카테고리 
	$('.boardCategory a').each(function(){
		$(this).on('click', function(){
			// 선택으로 이동
			let ctgNo = $(this).attr('data-ctgNo');
			console.log(ctgNo)
			
			if(ctgNo != '*') location.href='/board/listCategory/' + ctgNo;
			else location.href='/board/listAll';
		});
	});
	
	// 게시글 리스트 클릭 
	// 해당 게시글 번호를 가진 조회 페이지로 이동
	$(document).on('click', '.boardList', function(){
		let boardNo = $(this).children(":first").children("input").val();
		let currntViews =$(this).children(":last").children("input").val();
		$(this).children(":last").children("input").val(++currntViews);
		let updateViews = $(this).children(":last").children("input").val();
		
		// 조회수 추가
		$.ajax({
			type: 'post',
			url: '/board/updateViews',
			data: {'boardViews': updateViews, 'boardNo': boardNo},
			success: function(result){
				if(result != 0){
					// 조회 페이지로 이동
					location.href='/board/view/'+ boardNo;
				}
			},
			error: function(e){
				console.log(e);
			}
		});
	});
});