<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/accountBook/calendarTypeB.css' />" rel="stylesheet" type="text/css">
	</head>
	<body>
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
								<c:forEach begin="0" end="${(firstDay - 1) + (lastDate - 1)}" step="1" varStatus="dateStatus">
									<tr>
										<!-- 첫째 날 전까지 공란 -->
										<c:when test="${dateStatus le (firstDay - 1)}">
											<td></td>
										</c:when>
										<!-- 날짜 채우기 -->
										<c:otherwise>
											<c:set var="index" value="${dateStatus.index - (firstDay - 1)}" />
											
											<td class="tdDate p-0 pt-1 pb-1">
												<!-- 날짜, 휴무일 명칭(임시) -->
												<div class="dateBox d-flex align-items-center text-center">
													<div class="date ${dateList[index].date} rounded-circle m-1">${dateList[index].day}</div>
													<div class="text-xs text-truncate">${dateList[index].holidayName}</div>
												</div>
												<!-- 일별 건수 -->
												<div class="countBox d-flex justify-content-evenly mr-1 mb-1 ml-1 align-items-center text-center">
													<!-- 수입 -->
													<c:when test="${incomeList[index].count nq 0}">
														<div class="incomeCount help-cursor rounded-circle p-0">${incomeList[index].count}</div>
													</c:when>
													<!-- 지출 -->
													<c:when test="${expenditureList[index].count nq 0}">
														<div class="expenditureCount help-cursor rounded-circle p-0">${expenditureList[index].count}</div>
													</c:when>
												</div>
											</td>
										</c:otherwise>
										<!-- 남은 날 공란 -->
										<c:if test="${dateStatus.index eq ((firstDay - 1) + (lastDate - 1))}">
											<c:forEach begin="6" end="${lastDay - 1}" step="-1">
												<td></td>
											</c:forEach>
										</c:if>
									</tr>
								</c:forEach>
								<!-- 달력 크기 맞추기 -->
								<c:set var="length" value="${(firstDay - 1) + (lastDate - 1) + (lastDay - 1)}" />
								<c:if test="${length le 35}">
									<c:forEach begin="1" end="7" step="1">
										<td></td>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>