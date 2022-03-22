/**
 * 공유가계부 참여자 추가 유효성 검사
 */
 

var checkFlag = false;

$(document).ready(function() {		
	$('#participant').focus();
	

// 유효성 확인 -----------------------------------------------------------------------------
	$('#addParticipantForm').submit(function(){
		
		if($('#participant').val() == ""){
				alert("참여자를 입력해주세요");
				$(this).focus();   
				return false;
			}
	
	var participantNo=$('#participant').val();
	
	$.ajax({
	        type : "POST",            // HTTP method type(GET, POST) 형식이다.
	        url : "/accountBook/public/checkParticipant",      // 컨트롤러에서 대기중인 URL 주소이다.
	        data : {"No": participantNo},            // Json 형식의 데이터이다.
	        async: false,
	        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	            // 응답코드 > 0000
	            //alert(res);
	            if(res=="nope"){
					checkFlag = false; 
					alert("참여자 이메일이 잘못 되었습니다");
					
				}else{
	            	checkFlag = true;
				}
	        },
	        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
				checkFlag = false;
	            alert("통신 실패.");
	        }
	    });
			if(!checkFlag){
				return false;
			}
			
	
	
	}); // submit 종료
				
});   // ready 종료
