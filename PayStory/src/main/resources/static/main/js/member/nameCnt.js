/**
 * nameCnt.js
 */
 


$(document).ready(function(){
	

});
function duplicate(){
	var memberName=$("#memberName").val();

	var submitObj = new Object();
	submitObj.memberName=memberName;
	
	$.ajax({
		url : "/member/nameCnt",
		type : "POST",
		contentType : "application/json; charset-utf-8",
		data : JSON.stringify(submitObj),
		dataType : "json"
		}).done(function(resMap) {
		if (resMap.res == "ok") {
		if (resMap.nameCnt == 0) {
		alert("사용할 수 있는 닉네임입니다.");
		$("#memberNameCheck").val("Y");
		} else {
		alert("중복된 닉네임 입니다.");
		$("#memberNameCheck").val("N");
		}
		}
		
		}).fail(function(e) {
		alert("등록 시도에 실패하였습니다." + e);
		}).always(function() {
		pass = false;
		});
		
}
		
function fnSubmit() {
	 
	var emailLimit =  /^[a-zA-Z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	var nameCheck = /^[가-힣a-zA-Z0-9]{2,15}$/;
	var namePwdCh = /^(?=.*[a-zA-Z0-9])((?=.*\d)|(?=.*\W)).{5,15}$/;
	 
	if ($("#memberName").val() == null || $("#memberName").val() == "") {
	alert("닉네임을 입력해주세요.");
	$("#memberName").focus();
	 
	return false;
	}
	
	if(!nameCheck.test($("#memberName").val())){
		alert("닉네임은 2~15자, 특수문자 불가합니다.");
		$("#memberName").focus();
		return false;
	} 
	 
	 
	if ($("#memberNameCheck").val() != 'Y') {
	alert("닉네임 중복체크를 눌러주세요.\n중복된 닉네임인지 확인해주세요.");
	$("#memberNameCheck").focus();
	 
	return false;
	}
	 
	 
	if ($("#memberEmail").val() == null || $("#memberEmail").val() == "") {
	alert("이메일을 입력해주세요.");
	$("#memberEmail").focus();
	 
	return false;
	}
	
	if(!emailLimit.test($("#memberEmail").val())){
		alert("이메일을 형식에 맞게 입력해주세요. ex) email@naver.com");
		$("#memberEmail").focus();
		return false;
	} 
		
	if ($("#emailCheck").val() != 'Y') {
	alert("이메일 중복체크를 눌러주세요.\n계정이 있는지 확인해주세요.");
	$("#emailCheck").focus();
	 
	return false;
	}	
	 
	if ($("#memberPwd").val() == null || $("#memberPwd").val() == "") {
	alert("비밀번호를 입력해주세요.");
	$("#memberPw").focus();
	 
	return false;
	}
	
	if(!namePwdCh.test($("#memberPwd").val())){
		alert("비밀번호는 특수문자 포함 5~15자로 입력하세요.");
		$("#memberPwd").focus();
		return false;
	} 
	 
	if ($("#memberPwd2").val() == null || $("#memberPwd2").val() == "") {
	alert("비밀번호 확인을 입력해주세요.");
	$("#memberPwd2").focus();
	 
	return false;
	}
	 
	if ($("#memberPwd").val() != $("#memberPwd2").val()) {
	alert("비밀번호가 일치하지 않습니다.");
	$("#memberPwd2").focus();
	 
	return false;
	}

	if (confirm("회원가입하시겠습니까?")) {
	 
	$("#join").submit();
	 
	return false;
	}
}