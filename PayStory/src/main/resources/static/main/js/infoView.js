/**
 * infoView.js
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
	var nameCheck = /^[가-힣a-zA-Z0-9]{2,15}$/;
	
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
	alert("닉네임 중복체크를 눌러주세요.");
	$("#memberNameCheck").focus();
	 
	return false;
	}
	
	if (confirm("수정하시겠습니까?")) {
	 
	$("#infoView").submit();
	 
	return false;
	}
	
}