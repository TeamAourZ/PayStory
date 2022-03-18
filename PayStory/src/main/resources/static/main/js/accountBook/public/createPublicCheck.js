/**
 * 공유가계부 생성폼 유효성 검사
 */

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
		
	
	
	}); 
	
	// submit 종료			
});   // ready 종료
