/**
 * addForm.js
 */
 
 $(function(){
	// 엔터키 눌렀을 때 submit 안 되도록
	$(document).on('keydown', function(e){
		if(e.keycode == 13) e.preventDefault();
	})
	
	// 파일 업로드시 파일이름 보이게
	$("#uploadReceipt").on('change',function(){
	  var fileName = $(this).val();
	  $(".custom-file-label").text(fileName.substring(12));
	});
	
	// 메모 글자수 제한
	$('.memoBox').on('keyup', function(e){ 
		let content = $(this).val(); 
		// 글자수 세기 
		if (content.length == 0 || content == '') { 
			$('.textCount').text('0'); 
		} else { 
			$('.textCount').text(content.length); 
		} 
		
		// 글자수 제한 
		if (content.length > 100) { 
			// 100자 부터는 타이핑 되지 않도록 
			$(this).val($(this).val().substring(0, 100)); 
			// 100자 넘으면 알림창 뜨도록 
			alert('글자수는 100자까지 입력 가능합니다.'); 
		} 
	});
});