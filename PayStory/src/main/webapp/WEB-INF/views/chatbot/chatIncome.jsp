<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>전체 가계부 조회</h3>
			<table border="5" width="500">
				<tr><th>수입 번호</th><th>수입 날짜</th><th>수입원</th>
						<th>수입 내용</th><th>수입 금액</th></tr>
			
			   <c:forEach items="${incomeList }" var="income">
			   	<tr><td>${income.incomeNo }</td>
			   			<td>${income.incomeDate }</td>
			   			<td>${income.incomeSource }</td>
			   			<td>${income.incomeMemo }</td>
			   			<td>${income.incomeAmount }</td>
			   			
			   	</tr>
			   </c:forEach>
			</table><br>
	</body>
</html>