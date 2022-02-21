<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/accountBook/calendarTypeA.css' />" rel="stylesheet" type="text/css">
		
		<!-------- JS : Custom ------>
		<script src="<c:url value='/main/js/accountBook/calendarTypeA.js' />" type="text/javascript"></script>
	</head>
	<body>
		<div id="dateBox" class="mt-2">
			<div class="daySel mb-2 mr-1">
				<div>SUN</div>
				<div>MON</div>
				<div>TUE</div>
				<div>WED</div>
				<div>THU</div>
				<div>FRI</div>
				<div>SAT</div>
			</div>
			<div class="dateSel">
				<!-- js -->
			</div>
		</div>
	</body>
</html>