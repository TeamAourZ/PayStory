<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PayStory</title>
		<!-------- CSS : Custom -------->
		<link href="<c:url value = '/main/css/home.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value = '/main/css/calendar.css' />" rel="stylesheet" type="text/css">
		
		<!-------- CSS : Bootstrap -------->
		<link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
		
		<!-------- JS : Icon -------->
		<script src="https://kit.fontawesome.com/836510a8a4.js"></script>
		
		<!-------- JS : Custom -------->
		<script src="<c:url value = '/main/js/jquery-3.6.0.min.js' />"></script>
		<script src="<c:url value = '/main/js/calendar.js' />" type="text/javascript"></script>
		
		<!-------- JS : Bootstrap -------->
		<script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
		<script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
		<script src="/bootstrap/js/sb-admin-2.min.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<!-- Side Bar -->
			<%-- <jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp" flush="true" /> --%>
	
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
	
				<!-- Top Menu Bar  -->
				<%-- <jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" /> --%>
	
				<!-- Main Content -->
				<div id="content">
					<!-- 차트, 게시판 -->
					<article>
						<!-- 차트 -->
						<section id="chartSection">
							<!-- Pie Chart -->
							<div id = "chartBox">
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">월별 통계</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
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
									</div>
								</div>
							</div>
						</section>
	
						<!-- 게시판 -->
						<section id="forumSection">
							<div id="forumBox">
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">최신글</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<h1>내용</h1>
									</div>
								</div>
							</div>
						</section>
					</article>
	
					<!-- 달력 -->
					<article>
						<!-- 달력 -->
						<section id="calendar">
							<div id="calendarBox">
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="yearMonth m-0 font-weight-bold text-primary"></h6>
									</div>
									<!-- Card Body -->
									<div class="prevTodayNextBox">
										<i class="fas fa-chevron-left prevMonthBtn"></i>
										<button class="todayBtn">today</button>
										<i class="fas fa-chevron-right nextMonthBtn"></i>
									</div>
									<div class="dateBox">
										<div class="grid daySel">
											<div>일</div>
											<div>월</div>
											<div>화</div>
											<div>수</div>
											<div>목</div>
											<div>금</div>
											<div>토</div>
										</div>
										<div class="grid dateSel"></div>
									</div>
								</div>
							</div>
						</section>
					</article>
				</div>
			</div>
		</div>
		
		<!-------- JS : Bootstrap Chart, Custom -------->
		<script src = "<c:url value = '/bootstrap/vendor/chart.js/Chart.min.js' />"></script>
		<script src = "<c:url value = '/main/js/pieChart.js' />"></script>
	</body>
</html>