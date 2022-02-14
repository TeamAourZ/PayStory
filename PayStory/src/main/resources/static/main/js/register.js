/**
 *  회원가입 유효성검사
 */
 
 window.onload = function() {
	document.getElementById('join').onsubmit = function() {
		
		/*이름*/
		var memName = document.getElementById('name');
		var nameCheck = /^[가-힣a-zA-Z0-9]{2,16}$/;
		
		if(memName.value ==""){
			alert("닉네임을 입력하세요.");
			memName.focus();
			return false;
		}
		
		if(memName.value.length < 2 || memName.value.length > 15) {
			alert("닉네임은 2~15자로 입력해주세요.");
			memName.value = "";
			memName.focus();
			
			return false;	
		}
		
		if(!nameCheck.test(memName.value)){
			alert("올바른 형식이 아닙니다.\n특수문자 불가, 2~15자 입력해주세요.");
			memName.focus();
			
			return false;
		}	
		
		/*이메일*/
		var memEmail = document.getElementById('exampleInputEmail');
		var emailLimit = /^[a-zA-Z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
		
		if(memEmail.value == "") {
			alert("이메일을 입력하세요.");
			memEmail.focus();
			
			return false;
		}
			
		if(!emailLimit.test(memEmail.value)){
			alert("올바른 이메일을 입력해 주세요");
			memEmail.focus();
			
			return false;
		}	
			
		/*비밀번호*/
		var memPwd = document.getElementById('exampleInputPassword');
		var memPwdCheck = document.getElementById('exampleRepeatPassword');
		
		if(memPwd.value =="") {
			alert("비밀번호를 입력하세요.");
			memPwd.focus();
			
			return false;
		}
		
		if(memPwd.value.length < 5 || memPwd.value.length > 15) {
			alert("비밀번호는 5~15자로 입력하세요.");
			memPwd.value = "";
			memPwd.focus();
			
			return false;	
		}
		
		
		if(memPwd.value != memPwdCheck.value) {
			alert("비밀번호가 일치하지 않습니다.");
			memPwdCheck.value = "";
			memPwdCheck.focus();
			
			return false;
		}
		
		if(!memName.value == "" && !memPwd.value == "" && !memEmail.value == "") {
				alert("PayStory에 오신것을\n환영합니다!");
				location.href="/login";
				
		} else {
				alert("미입력 항목이 있습니다.\n확인해주세요.");	
				return false;
		}
		

	};
};