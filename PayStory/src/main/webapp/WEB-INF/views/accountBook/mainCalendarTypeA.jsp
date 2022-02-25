<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/accountBook/calendarTypeA.css' />" rel="stylesheet" type="text/css">
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
				<!-- 첫째 날 전까지 공란 -->
				<c:forEach begin="0" end="${firstDay - 1}" step="1">
					<div class="infoBox border"></div>
				</c:forEach>
				<!-- 날짜 채우기 -->
				<c:forEach var="date" items="${dateList}" varStatus="dateStatus">
					<div class="infoBox d-flex flex-column">
						<!-- 날짜, 휴무일 명칭(임시) -->
						<div class="dateBox d-flex align-items-center text-center">
							<div class="date ${date.date} rounded-circle m-1">${date.day}</div>
							<div class="text-xs text-truncate">${date.holidayName}</div>
						</div>
						<!-- 일별 건수, 총 금액 -->
						<div class="countBox mr-1 mb-1 ml-1 align-items-center text-center">
							<!-- 수입 -->
							<div class="row pl-3 mb-1">
								<c:when test="${incomeList[dateStatus.index].count nq 0}">
									<div class="col-2 incomeCount help-cursor rounded-circle p-0">${incomeList[dateStatus.index].count}</div>
									<div class="col-md-9 incomeValue text-left text-truncate mr-1 ml-1 p-0">
										<fmt:formatNumber value="${incomeList[dateStatus.index].sum}" pattern="#,###" />
									</div>
								</c:when>
							</div>
							<!-- 지출 -->
							<div class="row pl-3">
								<c:when test="${expenditureList[dateStatus.index].count nq 0}">
									<div class="col-2 expenditureCount help-cursor rounded-circle p-0">${expenditureList[dateStatus.index].count}</div>
									<div class="col-md-9 expenditureValue text-left text-truncate mr-1 ml-1 p-0">
										<fmt:formatNumber value="-${expenditureList[dateStatus.index].sum}" pattern="#,###" />
									</div>
								</c:when>
							</div>
						</div>
						<!-- 일별 상세 - 태그별 건수, 총 금액 -->
						<div class="detailBox">
							<!-- 수입 -->
							<c:when test="${incomeList[dateStatus.index].count nq 0}">
								<div class="incomeItemListBox position-absolute d-none">
									<div class="table table-responsive mb-0">
										<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
													<i class="detailBoxClose fas fa-times position-absolute pointer-cursor"></i>
													<table class="table mb-0">
														<thead class="titleName">
															<tr class="text-center">
																<th>구분</th>
																<th>건수</th>
																<th>금액</th>
															</tr>
														</thead>
														<tbody class="incomeItem">
															<c:forEach var="incomeItem" items="${incomeItemList}">
																<tr>
																	<td>${incomeItem.name}</td>
																	<td><fmt:formatNumber value="${incomeItem.count}" pattern="#,###" /></td>
																	<td class="incomeValue"><fmt:formatNumber value="${incomeItem.sum}" pattern="#,###" /></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:when>
							<!-- 지출 -->
							<c:when test="${expenditureList[dateStatus.index].count nq 0}">
								<div class="expenditureItemListBox position-absolute d-none">
									<div class="table table-responsive mb-0">
										<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
													<i class="detailBoxClose fas fa-times position-absolute pointer-cursor"></i>
													<table class="table mb-0">
														<thead class="titleName">
															<tr class="text-center">
																<th>구분</th>
																<th>건수</th>
																<th>금액</th>
															</tr>
														</thead>
														<tbody class="expenditureItem">
															<c:forEach var="expenditureItem" items="${expenditureItemList}">
																<tr>
																	<td>${expenditureItemList.name}</td>
																	<td><fmt:formatNumber value="-${expenditureItemList.count}" pattern="#,###" /></td>
																	<td class="expenditureValue"><fmt:formatNumber value="-${expenditureItemList.sum}" pattern="#,###" /></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:when>
						</div>
					</div>
				</c:forEach>
				<!-- 남은 날 공란 -->
				<c:forEach begin="6" end="${lastDay - 1}" step="-1">
					<div class="infoBox border"></div>
				</c:forEach>
				<!-- 달력 크기 맞추기 -->
				<c:set var="length" value="${(firstDay - 1) + (lastDate - 1) + (lastDay - 1)}" />
				<c:if test="${length le 35}">
					<c:forEach begin="1" end="7" step="1">
						<div class="infoBox border"></div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</body>
</html>