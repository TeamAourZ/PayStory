/**
 * addForm.js
 */
 
 $(function(){
	// 엔터키 눌렀을 때 submit 안 되도록
	$(document).on('keydown', function(e){
		if(e.keycode == 13) e.preventDefault();
	})
	
	// 파일 업로드시 파일 이름 표시하고 이미지 영역에 미리보기
	$("#uploadReceipt").on('change',function(e){
		// 파일 이름 표시
		let fileName = $(this).val();
	  	$(".custom-file-label").text(fileName.substring(12));
	  	
	  	// 이미지 영역에 미리보기
	  	let file = e.target.files;
	  	let fileArr = Array.prototype.slice.call(file);
	  	
	  	fileArr.forEach(function(f){
			if(!f.type.match('image.*')) {
				alert("이미지 파일만 가능합니다.");
				return;
			}
			
			let render = new FileReader();
			render.onload = function(e){
				$('#receiptImg').attr('src', e.target.result);
				$('#receiptImg').css({
					'width':'100%',
					'height':'100%'
				});
			}
			render.readAsDataURL(f);		
		});
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