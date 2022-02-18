<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var memberEmail = '${memberEmail}';

		alert(memberEmail + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다. 확인버튼을 누르면 로그인 페이지로 이동합니다.');

		self.location = "/member/loginView";
	</script>
</body>
</html>