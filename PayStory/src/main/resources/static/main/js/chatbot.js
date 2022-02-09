/**
 * chatbot.js
 */


 $(function(){
	
	
	// 챗봇에게 질문하고 응답받기 - 텍스트 응답
	// message 입력하고 전송 버튼 눌렀을 때
	$('#chatForm').on('submit', function(event){
		event.preventDefault();
		
		// 메시지 입력하지 않고 [전송] 버튼 누른 경우 (웰컴 메시지 출력되지 않도록)
		if ($('#message').val() == ""){
			alert("질문을 입력하세요");
			return false;
		}
		
		/* chatBox에 보낸 메시지 추가 */
		if($('#message').val() != ""){
			$('#chatBox').append('<div class="msgBox send"><span id="in"><span>' + 
												$('#message').val() + '</span></span></div><br>');
		}
		
		/* 입력란 비우기*/
		$('#message').val('');
	});	// submit 끝
});