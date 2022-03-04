/**
 * newBoardForm.js
 */
 $(document).ready(function(){
	/***** 엔터키 submit 안 되게 OK *****/
	$(document).on('keydown', function(e){
		if(e.keyCode == 13) e.preventDefault();
	});
	
	/* Submit - 게시글 */
	$('#newBoardForm').on('submit', function(e){
		e.preventDefault();
		
		const formData = new FormData();
		formData.append('boardTitle',  $('.title').val());
		formData.append('boardCategoryNo',  $('#categoryNo option:selected').val());
		formData.append('boardFile',  $('#uploadFile')[0].files[0] || null);
		formData.append('boardContents',  $('.content').val());

		$.ajax({
			type:"post",
			enctype: 'multipart/form-data',	
			url: "/board/create", 	
			data: formData, 
			processData: false,
    		contentType: false,
			success: function(result) {
				if(result != 0){
					alert("게시글을 정상적으로 등록했습니다.\n게시판 목록 페이지로 이동합니다.");
					location.href = "/board/listAll";
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	});
	
	$("#uploadFile").change(function(e){
		// 파일 이름 표시
		let fileName = $(this).val();
		console.log(fileName)
	  	$(".custom-file-label").text(fileName.substring(12));
	});	
});