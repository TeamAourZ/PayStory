/**
 * addForm.js
 */
 
 $(function(){
	$('.memoBox').keyup(function (e) { 
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