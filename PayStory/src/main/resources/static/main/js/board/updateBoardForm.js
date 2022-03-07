/**
 * updateBoardForm.js
 */
 
$(function(){
	/***** 엔터키 submit 안 되게 OK *****/
	$(document).on('keydown', function(e){
		if(e.keyCode == 13) e.preventDefault();
	});
	
	$("#uploadFile").change(function(e){
		// 파일 이름 표시
		let fileName = $(this).val();
	  	$(".custom-file-label").text(fileName.substring(12));
	});	
	
	$('.card').hover(function(){
		$('.deleteBtn').removeClass('hidden');
	}, function(){
		$('.deleteBtn').addClass('hidden');
	});	
	
	/* 첨부 파일 이미지 삭제 */
	$('.deleteBtn').each(function(){
		$(this).on('click', function(e){
			e.preventDefault();
			let currentImg = $(this).parent().parent();
			currentImg.remove();
		});
	});
	
	/* Submit - 게시글 수정 */
	$('#updateBoardForm').on('submit', function(e){
		e.preventDefault();
		
		const formData = new FormData();
		formData.append('boardTitle',  $('.title').val());
		formData.append('boardCategoryNo',  $('#boardCategoryNo option:selected').val());
		formData.append('file',  $('#uploadFile')[0].files[0] || null);
		formData.append('boardContents',  $('.content').val());
		formData.append('boardFileInDB', $('.boardFileInDB').val());
		formData.append('boardNo', $('.boardNo').val());
		
		console.log($('.boardFileInDB').val())
		console.log($('#boardCategoryNo option:selected').val())

		$.ajax({
			type:"post",
			enctype: 'multipart/form-data',	
			url: "/board/update", 	
			data: formData, 
			processData: false,
    		contentType: false,
			success: function(result) {
				if(result != 0){
					alert("게시글을 정상적으로 수정했습니다.\n게시판 목록 페이지로 이동합니다.");
					location.href = "/board/listAll";
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	});
	
	// 취소 버튼 클릭
	$('.listBtn').on('click', function(){
		let answer = confirm("작성을 취소하시겠습니끼?");
		if(answer) {
			alert('목록 페이지로 이동합니다.');
			location.href="/board/listAll";
		}
	});
});