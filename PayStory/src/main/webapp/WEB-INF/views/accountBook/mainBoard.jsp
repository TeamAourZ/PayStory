<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<body>
		<c:choose>
			<c:when test="${empty postList}">
				<span>게시글이 존재하지 않습니다.</span>
			</c:when>
			<c:otherwise>
				<c:forEach var="board" items="${boardList}">
					<div class="d-flex justify-content-around">
						<div class="boardCategoryName rounded ml-1">${board.boardCategoryName}</div>
						<div class="boardTitle rounded ml-1 mr-1">${board.boardTitle}</div>
						<div class="boardWritor rounded mr-1">${board.boardMemberName}</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>