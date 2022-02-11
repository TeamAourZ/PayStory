
 /**
 * memIdCheck.js
    상품번호 중복 확인
 */
 
 $(document).ready(function(){
	
	$('#idCheck').on('click', function(){		
		event.preventDefault();
		
		$.ajax({
			type:"post",
			url:"memIdCheck",
			data:{"memId": $('#memId').val()},  
			dataType:'text',
			success:function(result){
				if(result == "no_use"){
					alert("사용할 수 없는 ID입니다.");
				}else{
				    alert("사용 가능한 ID입니다.");
			 }
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});
});