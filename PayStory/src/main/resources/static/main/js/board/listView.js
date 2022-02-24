/**
 * listView.js
 */
 
$(function(){
	// 카테고리 
	$('.boardCategory a').each(function(i){
		$(this).on('click', function(){
			// 선택된 것만 CSS 적용 OK
			$('.boardCategory a:not(:eq('+i+'))').removeClass('active');
			$(this).addClass('active');
			
			// 선택 ajax
			let ctgNo = $(this).attr('data-ctgNo');
			$.ajax({
				type: 'post',
				url: '/board/listCategory',
				data: {'boardCategoryNo': ctgNo},
				sucess: function(result){
					console.log(result)
				},
				error: function(e){
					console.log(e)
				}
			});
		});
	});
	
	// 게시글 리스트 클릭 
	// 해당 게시글 번호를 가진 조회 페이지로 이동
	$(document).on('click', '.boardList', function(){
		let boardNo = $(this).children(":first").children("input").val();
		location.href='/board/view/'+ boardNo;
	});
});