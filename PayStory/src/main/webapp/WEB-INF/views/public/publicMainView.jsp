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
<script src="https://naver.github.io/egjs-infinitegrid/release/latest/dist/infinitegrid.min.js" crossorigin="anonymous"></script>
	
	<div class="publicAccountBox"> 
		<div class ="publicOwner">
			<img class="ownerImg" src="aaaa">
		</div>
		<div id ="publicParticipants" class ="publicParticipants">
			<img class="participantsImg" src="bbbb">
			<img class="participantsImg" src="cccc">
			<img class="participantsImg" src="dddd">
		</div>
		
		
		<table border="1" width="600">
				<tr><th>상품번호</th><th>상품명</th><th>가격</th>
						<th>제조사</th><th>재고</th><th>사진</th></tr>
		<c:forEach items="${prdList}" var="prd">
			   	<tr><td><a href="<c:url value='/product/detailViewProduct/${prd.prdNo}'/>">${prd.prdNo }</a></td>
			   			<td>${prd.prdName }</td>
			   			<td>${prd.prdPrice }</td>
			   			<td>${prd.prdCompany }</td>
			   			<td>${prd.prdStock }</td>
			   			<td><img src="<c:url value='/images/${prd.prdNo}.jpg'/>" width="30" height="20">
			   					<!-- 또는  -->
			   			        <img src="/images/${prd.prdNo}.jpg" width="30" height="20"></td>
			   	</tr>
			   </c:forEach>
			   </table>
			   
			   
	</div>
</body>
</html>