<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<body>
		<div id="dateBox" class="mt-2">
			<div class="daySel typeA mb-2 mr-1">
				<div>SUN</div>
				<div>MON</div>
				<div>TUE</div>
				<div>WED</div>
				<div>THU</div>
				<div>FRI</div>
				<div>SAT</div>
			</div>
			<div class="dateSel typeA">
				<!-- 첫째 날 전까지 공란 -->
				<c:if test="${firstDay ne 0}">
					<c:forEach begin="0" end="${firstDay - 1}" step="1">
						<div class="infoBox border"></div>
					</c:forEach>
				</c:if>
				<!-- 날짜 채우기 -->
				<c:forEach var="date" items="${dateList}" varStatus="dateStatus">
					<div class="infoBox d-flex flex-column">
						<!-- 날짜, 휴무일 명칭(임시) -->
						<div class="dateBox d-flex align-items-center text-center">
							<div class="date typeA ${date.date} rounded-circle m-1">${date.day}</div>
							<div class="text-xs text-truncate">${date.holidayName}</div>
						</div>
						<!-- 일별 건수, 총 금액 -->
						<div class="countBox mr-1 mb-1 ml-1 align-items-center text-center">
							<!-- 수입 -->
							<div class="row pl-3 mb-1">
								<c:if test="${incomeList[dateStatus.index].count ne 0}">
									<div class="col-2 incomeCount help-cursor rounded-circle p-0">${incomeList[dateStatus.index].count}</div>
									<div class="col-md-9 incomeValue text-left text-truncate mr-1 ml-1 p-0">
										<fmt:formatNumber value="${incomeList[dateStatus.index].sum}" pattern="#,###" />
									</div>
								</c:if>
							</div>
							<!-- 지출 -->
							<div class="row pl-3">
								<c:if test="${expenditureList[dateStatus.index].count ne 0}">
									<div class="col-2 expenditureCount help-cursor rounded-circle p-0">${expenditureList[dateStatus.index].count}</div>
									<div class="col-md-9 expenditureValue text-left text-truncate mr-1 ml-1 p-0">
										<fmt:formatNumber value="-${expenditureList[dateStatus.index].sum}" pattern="#,###" />
									</div>
								</c:if>
							</div>
						</div>
						<!-- 일별 상세 - 태그별 건수, 총 금액 -->
						<div class="detailBox">
							<!-- 수입 -->
							<c:if test="${incomeList[dateStatus.index].count ne 0}">
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
															<c:forEach var="incomeItem" items="${incomeItemList[dateStatus.index]}">
																<tr>
																	<td>${incomeItem.tag}</td>
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
							</c:if>
							<!-- 지출 -->
							<c:if test="${expenditureList[dateStatus.index].count ne 0}">
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
															<c:forEach var="expenditureItem" items="${expenditureItemList[dateStatus.index]}">
																<tr>
																	<td>${expenditureItemList.tag}</td>
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
							</c:if>
						</div>
					</div>
				</c:forEach>
				<!-- 남은 날 공란 -->
				<c:forEach begin="${lastDay + 1}" end="6" step="1">
					<div class="infoBox border"></div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>