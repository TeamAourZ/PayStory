<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PayStory</title>
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/calendar.css' />" rel="stylesheet" type="text/css">
		
		<!-------- CSS : Bootstrap -------->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" rel="stylesheet" crossorigin="anonymous">
		
		<!-------- JS : Custom -------->
		<script src="<c:url value='/main/js/jquery-3.6.0.min.js' />"></script>
		<script src="<c:url value='/main/js/calendar.js' />" type="text/javascript"></script>
		
		<!-------- JS : Bootstrap -------->
	</head>
	<body>
		<div id="wrapper">
			<!-- Side Bar -->
			<jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp" flush="true" />
	
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
	
				<!-- Top Menu Bar  -->
				<jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />
	
				<!-- Main Content -->
				<div class="d-flex">
					<!-- 차트, 게시판 -->
					<article class="w-30">
						<!-- 차트 -->
						<section id="chartSection">
							<!-- Pie Chart -->
							<div id="chartBox">
								<!--
									DB에서 해당 유저의 해당 월의 데이터 가져오기
									태그별 분류 및 합계 계산
									태그별 아이콘 및 명칭 생성
								 -->
								<div class="card shadow mb-4 ml-4">
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
								<div class="card shadow mb-4 ml-4">
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
					<article class="w-70">
						<!-- 달력 -->
						<section id="calendar">
							<div id="calendarBox">
								<div class="card shadow mb-4 mr-4 ml-4">
									<!-- Card Header -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">{가계부 타이틀}</h6>
									</div>
									<!-- Card Body -->
									<div id="calendarBtnBox" class="d-flex justify-content-between mt-1 mr-3 ml-3">
										<div id="prevNextBox" class="d-flex justify-content-between align-items-center">
											<i id="prevMonthBtn" class="fas fa-angle-left fa-2x m-1"></i>
											<span id="yearMonth" class="text-lg font-weight-bold mr-3 ml-3"></span>
											<i id="nextMonthBtn" class="fas fa-angle-right fa-2x m-1"></i>
										</div>
										<div id="otherBtnBox" class="d-flex flex-column align-items-end">
											<div>
												<i id="selectDayAddDataBtn" class="fas fa-plus fa-2x m-1"></i>
												<i id="todayBtn" class="far fa-calendar fa-2x m-1"></i>
											</div>
											<div>
												<i class="far fa-circle" style="color: blue;"> : 수입</i>&nbsp;
												<i class="far fa-circle" style="color: red;"> : 지출</i>
											</div>
										</div>
									</div>
									<div id="dateBox" class="m-2">
										<div class="daySel mb-2">
											<div>일</div>
											<div>월</div>
											<div>화</div>
											<div>수</div>
											<div>목</div>
											<div>금</div>
											<div>토</div>
										</div>
										<div class="dateSel"></div>
									</div>
								</div>
							</div>
						</section>
					</article>
				</div>
			</div>
		</div>
		
		<!-------- JS : Bootstrap, Custom -------->
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/chart.js/Chart.min.js' />"></script>
		<!-------- JS : Custom -------->
		<script src="<c:url value='/main/js/pieChart.js' />"></script>
	</body>
</html>