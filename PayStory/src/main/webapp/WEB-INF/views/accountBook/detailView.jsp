<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PayStory 가계부 - 대시보드 : 상세 내역 조회</title>
		
		<%-------- CSS : Custom --------%>
		<link href="<c:url value='/main/css/accountBook/common.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/calendar.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/chart.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/color.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/detailViewList.css' />" rel="stylesheet" type="text/css">
		
		<%-------- CSS : Bootstrap --------%>
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		
		<%-------- JS : Bootstrap --------%>
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
		
		<%-------- JS : Custom ------%>
		<script src="<c:url value='/main/js/accountBook/etcMethod.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/accountBook/detailView.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/calendarAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/chartAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/budgetStatusAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/detailViewListAjax.js' />" type="text/javascript"></script>
	</head>
	<body>
		<div id="wrapper">
			<%-- Side Bar --%>
			<jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp" flush="true" />
	
			<%-- Content Wrapper --%>
			<div id="content-wrapper" class="d-flex flex-column">
				<%-- Main Content --%>
				<div id="content">
					<%-- Top Menu Bar  --%>
					<jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />
					
					<div class="container-fluid">
						<div class="row">
							<%-- 달력, 차트 --%>
							<div class="col-lg-12 col-xl-5">
								<%-- 달력 --%>
								<div class="card shadow mb-4">
									<%-- Card Header --%>
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
									<%-- Card Body --%>
									<div id="calendarDateBox" class="card-body">
										<%-- ajax --%>
									</div>
								</div>
								
								<%-- 차트 : 일별 통계 --%>
								<div class="card shadow mb-4">
									<%-- Card Header --%>
									<div class="card-header p-3">
										<div class="d-flex justify-content-between">
											<div id="chartMainTagBox" class="d-flex">
												<input type="hidden" id="chartType" value="d">
												<h6 id="chartTab1"  class="chartTab m-0 pointer-cursor font-weight-bold text-primary selected">수입</h6>
												<h6 id="chartTab2"  class="chartTab m-0 pointer-cursor">지출</h6>
											</div>
											<div id="budgetStatusBox" class="position-absolute d-none">
												<%-- ajax --%>
											</div>
											<i class="budgetStatusBoxToggle fas fa-info-circle fa-lg pointer-cursor"></i>
										</div>
									</div>
									<%-- Card Body --%>
									<div class="card-body">
										<div id="chartBox">
											<%-- ajax --%>
										</div>
									</div>
								</div>
							</div>
							
							<%-- 일일 상세 내역 --%>
							<div class="col-lg-12 col-xl-7">
								<div class="card shadow mb-4">
									<%-- Card Header --%>
									<div class="card-header d-flex justify-content-between p-3">
										<h6 id="selectedDate" class="m-0 font-weight-bold text-primary">asd</h6>
										<c:if test="${isShared eq true}">
											<c:if test="${fn:length(shareMemberInfoList) gt 1}">
												<div id="shareMemberBox" class="position-absolute d-none">
													<div class="table mb-0">
														<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
															<div class="row">
																<div class="col-sm-12">
																	<i class="detailBoxClose re-position-1 fas fa-times position-absolute pointer-cursor"></i>
																	<table class="table mb-0">
																		<thead>
																			<tr class="text-center">
																				<th colspan="3">목록</th>
																			</tr>
																		</thead>
																		<tbody class="shareMember">
																			<c:forEach var="member" items="${shareMemberInfoList}" varStatus="status">
																				<tr class="text-center">
																					<c:choose>
																						<c:when test="${status.index eq 0}">
																							<td>
																								<div class="profileImage rounded-circle border-color-yellow">
																									<%--
																									
																										이미지 경로 확인 필요
																									
																									 --%>
																									<%-- <img src="${member.memberImage}"> --%>
																								</div>
																							</td>
																						</c:when>
																						<c:otherwise>
																							<td>
																								<div class="profileImage rounded-circle border-color-blue">
																									<%--
																									
																										이미지 경로 확인 필요
																									
																									 --%>
																									<%-- <img src="${member.memberImage}"> --%>
																								</div>
																							</td>
																						</c:otherwise>
																					</c:choose>
																					<td class="align-middle">${member.memberName}</td>
																					<td class="align-middle">${member.memberEmail}</td>
																				</tr>
																			</c:forEach>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</div>
												</div>
												<i class="shareMemberBoxToggle fas fa-user-friends fa-lg pointer-cursor"></i>
											</c:if>
										</c:if>
									</div>
									<div id="detailViewListBox" class="card-body d-flex flex-column align-items-center">
										<%-- ajax --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-------- JS : Bootstrap --------%>
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
	</body>
</html>