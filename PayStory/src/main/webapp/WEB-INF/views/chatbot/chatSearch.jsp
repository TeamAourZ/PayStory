<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value='/main/js/ai/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/main/js/ai/incomeSearch.js'/>"></script>
	</head>
	<body>
		<h3>상품 검색</h3>
		<form id="incomeSearchFrm">
			<select id="type" name="type">
				<option value="">검색 조건 선택</option>
				<option value="incomeDate">날짜</option>
				<option value="incomeSource">수입원</option>
			</select>
			<input type="text" name="keyword">
			<input type="submit" value="검색">
		</form>
		
		<div id="searchResultbox"></div>
	</body>
</html>