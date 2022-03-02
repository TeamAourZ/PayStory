<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<body>
		<%--
			jstl 변환 필
			태그 별 색상
		 --%>
		<div class="chart-pie pt-4 pb-2">
			<canvas id="myPieChart"></canvas>
		</div>
		<div class="mt-4 text-center small">
			<span class="mr-2">
				<i class="fas fa-circle text-primary"></i>
				Direct
			</span>
			<span class="mr-2">
				<i class="fas fa-circle text-success"></i>
				Social
			</span>
			<span class="mr-2">
				<i class="fas fa-circle text-info"></i>
				Referral
			</span>
		</div>
		
		<%-------- JS : Bootstrap --------%>
		<script src="<c:url value='/bootstrap/vendor/chart.js/Chart.min.js' />"></script>
	
		<%-------- JS : Custom --------%>
		<script src="<c:url value='/main/js/accountBook/chart.js' />"></script>
	</body>
</html>