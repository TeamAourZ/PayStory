<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<body>
		<div class="table m-0 mt-2">
			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<div class="row">
					<div class="col-sm-12">
						<table class="table mb-0 isScroll">
							<thead class="daySel typeB">
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
							<tbody class="dateSel typeB">
								<%-- 당월 날짜 index --%>
								<c:set var="dateIndex" value="0" />
								
								<%-- 날짜 생성 --%>
								<c:forEach begin="0" end="${week}" step="1" varStatus="weekStatus">
									<tr>
										<c:choose>
											<%-- 첫째 주 --%>
											<c:when test="${weekStatus.index eq 0}">
												<%-- 이전 달 날짜 생성 (빈 날짜 - 당월 시작 날짜 이전까지만) --%>
												<c:if test="${firstDay ne 0}">
													<c:forEach begin="0" end="${firstDay - 1}" step="1">
														<td class="p-1 border-color-white">
															<div class="emptyBox border"></div>
														</td>
													</c:forEach>
												</c:if>
												
												<%-- 해당 주차의 첫째 주 날짜 생성 --%>
												<c:forEach begin="0" end="${6 - firstDay}" step="1">
													<td class="p-1 border-color-white">
														<div class="infoBox border-color-default pointer-cursor">
															<%-- 날짜, 휴무일 명칭(임시) --%>
															<div class="dateBox d-flex align-items-center text-center">
																<div class="date ${dateList[dateIndex].date} rounded-circle m-1">${dateList[dateIndex].day}</div>
																<div class="text-xs text-truncate">${dateList[dateIndex].holidayName}</div>
															</div>
															<%-- 일별 건수 --%>
															<div class="countBox d-flex justify-content-evenly mr-1 mb-1 ml-1 align-items-center text-center">
																<%-- 수입 --%>
																<c:if test="${dateIncomeList[dateIndex].count ne 0 && not empty dateIncomeList[dateIndex].count}">
																	<div class="incomeCount help-cursor rounded-circle p-0"
																		data-toggle="tooltip" data-placement="bottom" title="수입 상세 태그 조회">
																		${dateIncomeList[dateIndex].count}
																	</div>
																</c:if>
																<%-- 지출 --%>
																<c:if test="${dateExpenditureList[dateIndex].count ne 0 && not empty dateExpenditureList[dateIndex].count}">
																	<div class="expenditureCount help-cursor rounded-circle p-0"
																		data-toggle="tooltip" data-placement="bottom" title="지출 상세 태그 조회">
																		${dateExpenditureList[dateIndex].count}
																	</div>
																</c:if>
															</div>
														</div>
													</td>
													
													<%-- 당월 날짜 index++ --%>
													<c:set var="dateIndex" value="${dateIndex + 1}" />
												</c:forEach>
											</c:when>
											<%-- 둘째 주부터 마지막 이전 주 --%>
											<c:when test="${0 lt weekStatus.index && weekStatus.index lt week}">
												<%-- 둘째 주부터 마지막 이전 주까지 날짜 생성 --%>
												<c:forEach begin="0" end="6" step="1">
													<td class="p-1 border-color-white">
														<div class="infoBox border-color-default pointer-cursor">
															<%-- 날짜, 휴무일 명칭(임시) --%>
															<div class="dateBox d-flex align-items-center text-center">
																<div class="date ${dateList[dateIndex].date} rounded-circle m-1">${dateList[dateIndex].day}</div>
																<div class="text-xs text-truncate">${dateList[dateIndex].holidayName}</div>
															</div>
															<%-- 일별 건수 --%>
															<div class="countBox d-flex justify-content-evenly mr-1 mb-1 ml-1 align-items-center text-center">
																<%-- 수입 --%>
																<c:if test="${dateIncomeList[dateIndex].count ne 0 && not empty dateIncomeList[dateIndex].count}">
																	<div class="incomeCount help-cursor rounded-circle p-0"
																		data-toggle="tooltip" data-placement="bottom" title="수입 상세 태그 조회">
																		${dateIncomeList[dateIndex].count}
																	</div>
																</c:if>
																<%-- 지출 --%>
																<c:if test="${dateExpenditureList[dateIndex].count ne 0 && not empty dateExpenditureList[dateIndex].count}">
																	<div class="expenditureCount help-cursor rounded-circle p-0"
																		data-toggle="tooltip" data-placement="bottom" title="지출 상세 태그 조회">
																		${dateExpenditureList[dateIndex].count}
																	</div>
																</c:if>
															</div>
															<%-- 일별 상세 - 태그별 건수, 총 금액 --%>
															<div class="detailBox">
																<%-- 수입 --%>
																<c:if test="${dateIncomeList[dateIndex].count ne 0 && not empty dateIncomeList[dateIndex].count}">
																	<div class="tagIncomeListBox position-absolute d-none">
																		<div class="table mb-0">
																			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
																				<div class="row">
																					<div class="col-sm-12">
																						<table class="table mb-0">
																							<thead>
																								<tr class="text-center">
																									<th>구분</th>
																									<th>건수</th>
																									<th>
																										금액
																										<i class="detailBoxClose fas fa-times pointer-cursor"></i>
																									</th>
																								</tr>
																							</thead>
																							<tbody class="tagIncome">
																								<c:forEach var="tagIncome" items="${tagIncomeList[dateIndex]}">
																									<tr class="text-center">
																										<td>${tagIncome.tag}</td>
																										<td><fmt:formatNumber value="${tagIncome.count}" pattern="#,###" /></td>
																										<td class="incomeValue"><fmt:formatNumber value="${tagIncome.sum}" pattern="#,###" /></td>
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
																<%-- 지출 --%>
																<c:if test="${dateExpenditureList[dateIndex].count ne 0 && not empty dateExpenditureList[dateIndex].count}">
																	<div class="tagExpenditureListBox position-absolute d-none">
																		<div class="table mb-0">
																			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
																				<div class="row">
																					<div class="col-sm-12">
																						<table class="table mb-0">
																							<thead>
																								<tr class="text-center">
																									<th>구분</th>
																									<th>건수</th>
																									<th>
																										금액
																										<i class="detailBoxClose fas fa-times pointer-cursor"></i>
																									</th>
																								</tr>
																							</thead>
																							<tbody class="tagExpenditure">
																								<c:forEach var="tagExpenditure" items="${tagExpenditureList[dateIndex]}">
																									<tr class="text-center">
																										<td>${tagExpenditure.tag}</td>
																										<td><fmt:formatNumber value="${tagExpenditure.count}" pattern="#,###" /></td>
																										<td class="expenditureValue"><fmt:formatNumber value="${tagExpenditure.sum}" pattern="#,###" /></td>
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
													</td>
													
													<%-- 당월 날짜 index++ --%>
													<c:set var="dateIndex" value="${dateIndex + 1}" />
												</c:forEach>
											</c:when>
											<%-- 마지막 주 --%>
											<c:when test="${weekStatus.index eq week}">
												<%-- 당월 마지막 주 날짜 생성 --%>
												<c:forEach begin="0" end="${lastDay}" step="1">
													<td class="p-1 border-color-white">
														<div class="infoBox border-color-default pointer-cursor">
															<%-- 날짜, 휴무일 명칭(임시) --%>
															<div class="dateBox d-flex align-items-center text-center">
																<div class="date ${dateList[dateIndex].date} rounded-circle m-1">${dateList[dateIndex].day}</div>
																<div class="text-xs text-truncate">${dateList[dateIndex].holidayName}</div>
															</div>
															<%-- 일별 건수 --%>
															<div class="countBox d-flex justify-content-evenly mr-1 mb-1 ml-1 align-items-center text-center">
																<%-- 수입 --%>
																<c:if test="${dateIncomeList[dateIndex].count ne 0 && not empty dateIncomeList[dateIndex].count}">
																	<div class="incomeCount help-cursor rounded-circle p-0"
																		data-toggle="tooltip" data-placement="bottom" title="수입 상세 태그 조회">
																		${dateIncomeList[dateIndex].count}
																	</div>
																</c:if>
																<%-- 지출 --%>
																<c:if test="${dateExpenditureList[dateIndex].count ne 0 && not empty dateExpenditureList[dateIndex].count}">
																	<div class="expenditureCount help-cursor rounded-circle p-0"
																		data-toggle="tooltip" data-placement="bottom" title="지출 상세 태그 조회">
																		${dateExpenditureList[dateIndex].count}
																	</div>
																</c:if>
															</div>
															<%-- 일별 상세 - 태그별 건수, 총 금액 --%>
															<div class="detailBox">
																<%-- 수입 --%>
																<c:if test="${dateIncomeList[dateIndex].count ne 0 && not empty dateIncomeList[dateIndex].count}">
																	<div class="tagIncomeListBox position-absolute d-none">
																		<div class="table mb-0">
																			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
																				<div class="row">
																					<div class="col-sm-12">
																						<table class="table mb-0">
																							<thead>
																								<tr class="text-center">
																									<th>구분</th>
																									<th>건수</th>
																									<th>
																										금액
																										<i class="detailBoxClose fas fa-times pointer-cursor"></i>
																									</th>
																								</tr>
																							</thead>
																							<tbody class="tagIncome">
																								<c:forEach var="tagIncome" items="${tagIncomeList[dateIndex]}">
																									<tr class="text-center">
																										<td>${tagIncome.tag}</td>
																										<td><fmt:formatNumber value="${tagIncome.count}" pattern="#,###" /></td>
																										<td class="incomeValue"><fmt:formatNumber value="${tagIncome.sum}" pattern="#,###" /></td>
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
																<%-- 지출 --%>
																<c:if test="${dateExpenditureList[dateIndex].count ne 0 && not empty dateExpenditureList[dateIndex].count}">
																	<div class="tagExpenditureListBox position-absolute d-none">
																		<div class="table mb-0">
																			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
																				<div class="row">
																					<div class="col-sm-12">
																						<table class="table mb-0">
																							<thead>
																								<tr class="text-center">
																									<th>구분</th>
																									<th>건수</th>
																									<th>
																										금액
																										<i class="detailBoxClose fas fa-times pointer-cursor"></i>
																									</th>
																								</tr>
																							</thead>
																							<tbody class="tagExpenditure">
																								<c:forEach var="tagExpenditure" items="${tagExpenditureList[dateIndex]}">
																									<tr class="text-center">
																										<td>${tagExpenditure.tag}</td>
																										<td><fmt:formatNumber value="${tagExpenditure.count}" pattern="#,###" /></td>
																										<td class="expenditureValue"><fmt:formatNumber value="${tagExpenditure.sum}" pattern="#,###" /></td>
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
													</td>
													
													<%-- 당월 날짜 index++ --%>
													<c:set var="dateIndex" value="${dateIndex + 1}" />
												</c:forEach>
												
												<%-- 다음 달 날짜 생성 (빈 날짜 - 마지막 주차의 빈 날짜 공간 만큼만) --%>
												<c:if test="${lastDay ne 6}">
													<c:set var="lastDay" value="${lastDay + 1}" />
													<c:forEach begin="0" end="${6 - lastDay}" step="1">
														<td class="p-1 border-color-white">
															<div class="emptyBox border"></div>
														</td>
													</c:forEach>
												</c:if>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>