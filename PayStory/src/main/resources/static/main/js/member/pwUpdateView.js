/**
 * pwUpdateView.js
 */
 
 $(document).ready(function(){
		
	$("#pwUpdate").on("click", function(){
		if($("#memberPwd").val==""){
			alert("현재 비밀번호를 입력해주세요");
			$("#memberPwd").focus();
			return false
		}
		if($("#memberPwd1").val==""){
			alert("변경비밀번호을를 입력해주세요");
			$("#memberPwd1").focus();
			return false
		}
		if($("#memberPwd2").val==""){
			alert("변경비밀번호를 입력해주세요");
			$("#memberPwd2").focus();
			return false
		}
		if ($("#memberPwd").val() != $("#memberPwd2").val()) {
			alert("변경비밀번호가 일치하지 않습니다.");
			$("#memberPwd2").focus();
		
		$.ajax({
			url : "/member/pwCheck",
			type : "POST",
			dataType : "json",
			data : $("#pwUpdateForm").serializeArray(),
			success: function(data){
				
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;
				}else{
					if(confirm("변경하시겠습니까?")){
						$("#pwUpdateForm").submit();
					}
					
				}
			}
		})
		
	});			
})