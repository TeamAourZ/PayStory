<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PayStory</title>
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/accountBook/calendarBase.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/calendarTypeB.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/detailViewList.css' />" rel="stylesheet" type="text/css">
		
		<!-------- CSS : Bootstrap -------->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		
		<!-------- JS : Bootstrap -------->
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
		
		<!-------- JS : Custom ------>
		<script src="<c:url value='/main/js/accountBook/detailViewCalendar.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/accountBook/calendarEtc.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/accountBook/detailViewList.js' />" type="text/javascript"></script>
	</head>
	<body>
		<div id="wrapper">
			<!-- Side Bar -->
			<jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp" flush="true" />
	
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				<!-- Main Content -->
				<div id="content">
					<!-- Top Menu Bar  -->
					<jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />
					
					<div class="container-fluid">
						<div class="row">
							<!-- 달력, 차트 -->
							<div class="col-lg-12 col-xl-4">
								<!-- 달력 -->
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header p-3">
										<div id="calendarBtnBox" class="d-flex justify-content-between mr-3 ml-3">
											<div id="prevNextBox" class="d-flex justify-content-between align-items-center">
												<i id="prevMonthBtn" class="fas fa-angle-left fa-lg pointer-cursor"></i>
												<h6 id="yearMonth" class="font-weight-bold text-primary m-0 mr-3 ml-3"></h6>
												<i id="nextMonthBtn" class="fas fa-angle-right fa-lg pointer-cursor"></i>
											</div>
											<div id="otherBtnBox" class="d-flex align-items-center">
												<i id="todayBtn" class="far fa-calendar fa-lg pointer-cursor"></i>
											</div>
										</div>
									</div>
									<!-- Card Body -->
									<div id="calendarBox" class="card-body">
										<div class="table m-0 mt-2">
											<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
												<div class="row">
													<div class="col-sm-12">
														<table class="table mb-0">
															<thead class="daySel">
																<tr class="text-center">
																	<th style="width: 14%;">SUN</th>
																	<th style="width: 14%;">MON</th>
																	<th style="width: 14%;">TUE</th>
																	<th style="width: 14%;">WED</th>
																	<th style="width: 14%;">THU</th>
																	<th style="width: 14%;">FRI</th>
																	<th style="width: 14%;">SAT</th>
																</tr>
															</thead>
															<tbody class="dateSel">
																<!-- js -->
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 차트 : 일일 통계 -->
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header p-3">
										<h6 class="m-0 font-weight-bold text-primary">일일 통계</h6>
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
							
							<!-- 일일 상세 내역 -->
							<div class="col-lg-12 col-xl-8">
								<div class="card shadow mb-4">
									<!-- Card Header -->
									<div class="card-header d-flex justify-content-between p-3">
										<h6 class="m-0 font-weight-bold text-primary">{년월일}</h6>
										<i class="fas fa-user-friends fa-lg pointer-cursor"></i>
										<!-- 
											jstl
											소유자, 참여자 표시
										 -->
									</div>
									<div id="detailViewBox" class="card-body d-flex flex-column align-items-center">
										<!-- ajax -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-------- JS : Bootstrap -------->
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/chart.js/Chart.min.js' />"></script>
		
		<!-------- JS : Custom -------->
		<script src="<c:url value='/main/js/accountBook/detailViewPieChart.js' />"></script>
	</body>
</html>