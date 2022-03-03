/**
 * nameCnt.js
 */
	
function fn_emailCheck() {
	$.ajax({
		url: "/member/emailCnt",
		type: "POST",
		dataType: "JSON",
		data: {"memberEmail" : $("#memberEmail").val()},
		success : function (data) {
			if(data == 1) {
				alert("이미 계정이 있습니다.")
			}else if(data == 0) {
				$("#emailCheck").attr("value", "Y");
				alert("사용 가능한 이메일입니다.")
			}
		}
	})
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	