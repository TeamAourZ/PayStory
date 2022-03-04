<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<body>
		<c:choose>
			<c:when test="${empty detailViewItemList}">
				<span>내역이 존재하지 않습니다.</span>
			</c:when>
			<c:otherwise>
				<c:forEach var="detailViewItem" items="${detailViewItemList}" varStatus="detailViewItemStatus">
						<%-- 수입 / 지출 구분 --%>
						<c:choose>
							<c:when test="${detailViewItem.condition eq 'income'}">
								<div class="card shadow dataBox w-100 p-2 incomeData">
							</c:when>
							<c:when test="${detailViewItem.condition eq 'expenditure'}">
								<div class="card shadow dataBox w-100 p-2 expenditureData">
							</c:when>
						</c:choose>
						<%-- 수입 / 지출 내역 --%>
						<div class="card-body row p-0">
							<%-- 태그 --%>
							<div class="col-2 align-self-center">
								<div class="rounded-circle text-center p-0">${detailViewItem.tagName}</div>
							</div>
							<%-- 내용 1 --%>
							<div class="col-8">
								<div class="d-flex flex-column flex-gap-1">
									<div class="d-flex flex-gap-3">
										<%-- 수입 / 지출원 --%>
										<h6 class="dataSource">${detailViewItem.source}</h6>
										<%-- 수입 / 지출 금액 --%>
										<h6 class="dataAmount"><fmt:formatNumber value="${detailViewItem.amount}" pattern="#,###" /></h6>
									</div>
									<div>
										<%-- 수입 / 지출 내용 --%>
										<h6 class="dataMemo">${detailViewItem.memo}</h6>
									</div>
									<%-- 지출 상세 항목 --%>
									<c:if test="${detailViewItem.condition eq 'expenditure'}">
										<c:set var="breakValue" value="false" /> <%-- break --%>
										<c:forEach var="expenditureItem" items="${expenditureItemList}">
											<c:if test="${(not breakValue) && (detailViewItem.dataNo eq expenditureItem.key)}">
												<div id="detailsBox${detailViewItemStatus.index}" class="accordion">
													<div class="card">
														<%-- header --%>
														<div id="itemListCard${detailViewItemStatus.index}" class="card-header p-0 d-flex justify-content-between">
															<div class="side"></div>
															<h2 class="btn text-center collapsed w-100 m-0" data-toggle="collapse"
																	data-target="#collapse${detailViewItemStatus.index}"
																	aria-expanded="false" aria-controls="collapse${detailViewItemStatus.index}">
																상세 목록&nbsp;
															</h2>
															<div class="side text-center">
																<c:if test="${not empty detailViewItem.receiptImage}">
																	<i class="far fa-image fa-lg pointer-cursor"></i>
																	<%--
																	
																	
																		클릭 시 모달로 해당 영수증 이미지 뿌려주기
																	
																	
																	 --%>
																</c:if>
															</div>
														</div>
														<%-- body --%>
														<div id="collapse${detailViewItemStatus.index}" class="collapse"
																aria-labelledby="itemListCard${detailViewItemStatus.index}"
																data-parent="#detailsBox${detailViewItemStatus.index}">
															<div class="card-body"> <%-- p-0 --%>
																<div class="itemListBox d-flex flex-column flex-gap-1">
																	<c:forEach var="item" items="${expenditureItem.value}">
																		<div class="itemBox d-flex justify-content-between mb-1">
																			<div class="itemName ml-5">${item.expenditureItemName}</div>
																			<div class="itemPrice mr-5">${item.expenditureItemPrice}</div>
																		</div>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>
												</div>
												
												<%-- break 처리 --%>
												<c:set var="breakValue" value="true" />
											</c:if>
										</c:forEach>
									</c:if>
								</div>
							</div>
							
							<%-- 내용 2 --%>
							<div class="col-2 d-flex flex-column">
								<div class="text-right">
									<i class="dataEdit far fa-edit fa-lg pointer-cursor"></i>
									<i class="dataDelete far fa-trash-alt fa-lg pointer-cursor"></i>
								</div>
								<div>
									{예금 변동 내역}
									<%-- 
										연산 고안 필요
									 --%>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>