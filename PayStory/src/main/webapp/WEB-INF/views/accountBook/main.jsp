<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PayStory 가계부 - 대시보드 : 메인</title>
		
		<%-------- CSS : Custom --------%>
		<link href="<c:url value='/main/css/accountBook/common.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/chart.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/color.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/mainBoard.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/calendar.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/modal/dateSelectModal.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/modal/accountBookInfoModal.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/main/css/accountBook/modal/budgetEditModal.css' />" rel="stylesheet" type="text/css">
		
		<%-------- CSS : Bootstrap --------%>
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		
		<%-------- JS : Bootstrap --------%>
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
		
		<%-------- JS : Custom ------%>
		<script src="<c:url value='/main/js/accountBook/etcMethod.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/accountBook/main.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/accountBook/common.js' />" type="text/javascript"></script>
		
		<%-------- JS : Custom : Ajax ------%>
		<script src="<c:url value='/main/js/ajax/chartAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/budgetStatusAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/mainBoardAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/calendarAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/selectAccountBookInfoAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/updateAccountBookInfoAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/selectBudgetAjax.js' />" type="text/javascript"></script>
		<script src="<c:url value='/main/js/ajax/budgetSettingAjax.js' />" type="text/javascript"></script>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="/main/images/paystory.ico" type="image/x-icon"/>
	</head>
	<body>
		<div id="wrapper">
			<%-- Side Bar --%>
			<jsp:include page="/WEB-INF/views/layout/sideMenu.jsp" flush="true" />
	
			<%-- Content Wrapper --%>
			<div id="content-wrapper" class="d-flex flex-column">
				<%-- Main Content --%>
				<div id="content">
					<%-- Top Menu Bar  --%>
					<jsp:include page="/WEB-INF/views/layout/topMenu.jsp" flush="true" />
	
					<div class="container-fluid">
						<div class="row">
							<%-- 차트, 게시판 --%>
							<div id="chartAndBoardCard" class="col-lg-12 col-xl-4">
								<%-- 차트 : 월별 통계 --%>
								<div class="card shadow mb-4">
									<%-- Card Header --%>
									<div class="card-header p-3">
										<div class="d-flex justify-content-between">
											<div id="chartMainTagBox" class="d-flex flex-gap-2">
												<input type="hidden" id="chartType" value="m">
												<h6 id="chartTab1"  class="chartTab m-0 pointer-cursor font-weight-bold text-primary selected">수입</h6>
												<h6 id="chartTab2"  class="chartTab m-0 pointer-cursor">지출</h6>
											</div>
											<div id="budgetStatusBox" class="position-absolute d-none">
												<%-- ajax --%>
											</div>
											<i class="budgetStatusBoxToggle fas fa-info-circle fa-lg pointer-cursor"
												data-toggle="tooltip" data-placement="bottom" title="당월 예산 현황">
											</i>
										</div>
									</div>
									<%-- Card Body --%>
									<div class="card-body">
										<div id="chartBox">
											<%-- ajax --%>
										</div>
									</div>
								</div>
	
								<%-- 게시판 : 최신글, 공지사항 --%>
								<div class="card shadow mb-4">
									<%-- Card Header --%>
									<div id="boardCategoryBox" class="card-header d-flex p-3 flex-gap-2">
										<h6 id="boardTab1"  class="boardCategory m-0 pointer-cursor font-weight-bold text-primary selected">전체</h6>
										<h6 id="boardTab2"  class="boardCategory m-0 pointer-cursor">공지사항</h6>
									</div>
									<%-- Card Body --%>
									<div class="card-body">
										<div id="boardBox" class="d-flex flex-column">
											<%-- ajax --%>
										</div>
									</div>
								</div>
							</div>
	
							<%-- 달력 --%>
							<div id="calendarCard" class="col-lg-12 col-xl-8">
								<div class="card shadow mb-4">
									<%-- Card Header --%>
									<div class="card-header d-flex justify-content-between p-3">
										<c:choose>
											<c:when test="${accountBookTitle eq null || accountBookTitle eq ''}">
												<c:choose>
													<c:when test="${isShared eq false}">
														<h6 class="accountBookTitle m-0 font-weight-bold text-primary">내 가계부</h6>
													</c:when>
													<c:otherwise>
														<h6 class="accountBookTitle m-0 font-weight-bold text-primary">공유 가계부</h6>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<h6 class="accountBookTitle m-0 font-weight-bold text-primary">${accountBookTitle}</h6>
											</c:otherwise>
										</c:choose>
										<div class="d-flex flex-gap-2">
											<c:if test="${isShared eq true}">
												<c:if test="${fn:length(shareMemberInfoList) gt 1}">
													<div id="shareMemberBox" class="position-absolute d-none">
														<div class="table mb-0">
															<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
																<div class="row">
																	<div class="col-sm-12">
																		<table class="table mb-0">
																			<thead>
																				<tr class="text-center">
																					<th colspan="3">
																						목록
																						<i class="detailBoxClose fas fa-times pointer-cursor"></i>
																					</th>
																				</tr>
																			</thead>
																			<tbody class="shareMember">
																				<c:forEach var="member" items="${shareMemberInfoList}" varStatus="status">
																					<tr class="text-center">
																						<c:choose>
																							<c:when test="${status.index eq 0}">
																								<td>
																									<div class="profile-image-box rounded-circle border-color-yellow">
																										<img onerror='this.src="<c:url value='/main/images/blankprofile.png'></c:url>"'
																																	src="/images/member/${member.memberNo}/${member.memberImage}">
																									</div>
																								</td>
																							</c:when>
																							<c:otherwise>
																								<td>
																									<div class="profile-image-box rounded-circle border-color-blue">
																										<img onerror='this.src="<c:url value='/main/images/blankprofile.png'></c:url>"'
																																	src="/images/member/${member.memberNo}/${member.memberImage}">
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
													<i class="shareMemberBoxToggle fas fa-user-friends fa-lg pointer-cursor"
														data-toggle="tooltip" data-placement="bottom" title="공유 회원 목록">
													</i>
												</c:if>
											</c:if>
											<i id="accountBookSettings" class="fas fa-cog fa-lg pointer-cursor"
												data-toggle="tooltip" data-placement="bottom" title="달력 정보 조회 및 수정"> <%-- 툴팁 --%>
											</i>
										</div>
									</div>
									<%-- Card Body --%>
									<div id="calendarBox" class="card-body">
										<div id="calendarBtnBox" class="d-flex justify-content-between mr-3 ml-3">
											<div id="prevNextBox" class="d-flex justify-content-between align-items-center flex-gap-3">
												<i id="prevMonthBtn" class="fas fa-angle-left fa-2x pointer-cursor"
													data-toggle="tooltip" data-placement="bottom" title="이전 달">
												</i>
												<span id="yearMonth" class="text-lg font-weight-bold pointer-cursor"
													data-toggle="modal" data-target="#dateSelectModal" <%-- 모달 --%>
													data-toggle="tooltip" data-placement="bottom" title="날짜 이동"> <%-- 툴팁 --%>
												</span>
												<i id="nextMonthBtn" class="fas fa-angle-right fa-2x pointer-cursor"
													data-toggle="tooltip" data-placement="bottom" title="다음 달">
												</i>
											</div>
											<div id="otherBtnBox" class="d-flex flex-column align-items-end flex-gap-1">
												<div class="d-flex flex-gap-2">
													<i id="selectDayAddDataBtn" class="fas fa-plus fa-2x pointer-cursor"
														data-toggle="tooltip" data-placement="bottom" title="선택 날짜 내역 추가">
													</i>
													<i id="todayBtn" class="far fa-calendar fa-2x pointer-cursor"
														data-toggle="tooltip" data-placement="bottom" title="오늘 날짜 이동">
													</i>
												</div>
												<div class="d-flex flex-gap-2">
													<i class="far fa-circle non-cursor" style="color: #2768fa;"> : 수입</i>
													<i class="far fa-circle non-cursor" style="color: #ffb500;"> : 지출</i>
												</div>
											</div>
										</div>
										<div id="calendarDateBox">
											<%-- ajax --%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 날짜 선택 모달 --%>
		<jsp:include page="/WEB-INF/views/accountBook/modal/dateSelectModal.jsp" flush="true" />
		
		<%-- 가계부 정보 조회 및 수정 모달 --%>
		<jsp:include page="/WEB-INF/views/accountBook/modal/accountBookInfoModal.jsp" flush="true" />
		
		<%-- 예산 수정 모달 --%>
		<jsp:include page="/WEB-INF/views/accountBook/modal/budgetEditModal.jsp" flush="true" />
		
		<%-------- JS : Bootstrap --------%>
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
	</body>
</html>