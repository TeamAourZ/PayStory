/**
 * 공유가계부 생성폼 유효성 검사
 */
 

var checkFlag = false;

$(document).ready(function() {		
	$('#accountBookTitle').focus();
	
	$(document).on('keydown', function(e){
		if(e.keyCode == 13) return false;   //발생한 이벤트의 키코드값이 13이라면 submit 안 되도록 설정
	});


// 유효성 확인 -----------------------------------------------------------------------------
	$('#createPublicForm').submit(function(){
		
		if($('#accountBookTitle').val() == ""){
				alert("제목을 입력해주세요");
				$(this).focus();   
				return false;
			}
			
		if($('#budgetAmount').val() == ""){
				alert("예산을 입력해주세요");
				$(this).focus();   
				return false;
			}
	
		var numcheck = /^[0-9]*$/;
	
	  if (!numcheck.test($('#budgetAmount').val())) {
	   		 alert("예산은 숫자로만 입력할 수 있습니다.");
	  		  $(this).focus();
	    		return false;
	  }
	
		if($('#participant_list\\[0\\]').val() == ""){
				alert("참여자를 적어도 1명 이상 입력해주세요");
				$(this).focus();   
				return false;
			}
	
	var participantNo=$('#participant_list\\[0\\]').val();
	
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
					alert("기재하신 이메일은 페이스토리 회원이 아닙니다");
					
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
