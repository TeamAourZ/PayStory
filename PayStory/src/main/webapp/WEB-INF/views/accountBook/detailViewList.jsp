<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			var accountBookNo = '<%= session.getAttribute("accountBookNo") %>';
		</script>
	</head>
	<body>
		<c:choose>
			<c:when test="${empty detailViewItemList}">
				<span>내역이 존재하지 않습니다.</span>
			</c:when>
			<c:otherwise>
				<c:set var="remainingBalance" value="${amount}" />
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
							<%-- 내역 시간 --%>
							<div class="sourceDate text-xs position-absolute">${fn:substring(detailViewItem.date, 11, 19)}</div>
							<%-- 태그 --%>
							<div class="col-2 align-self-center">
								<c:choose>
									<c:when test="${detailViewItem.condition eq 'income'}">
										<div class="rounded-circle income-color font-weight-bold text-center p-0">${detailViewItem.tagName}</div>
									</c:when>
									<c:when test="${detailViewItem.condition eq 'expenditure'}">
										<div class="rounded-circle expenditure-color font-weight-bold text-center p-0">${detailViewItem.tagName}</div>
									</c:when>
								</c:choose>
							</div>
							<%-- 내용 1 --%>
							<div class="col-8 align-self-center">
								<div class="d-flex flex-column flex-gap-2">
									<div class="d-flex flex-gap-3">
										<%-- 수입 / 지출원 --%>
										<div class="dataSource">${detailViewItem.source}</div>
										<%-- 수입 / 지출 금액 --%>
										<div class="dataAmount">
											<c:choose>
												<c:when test="${detailViewItem.amount > 0}">
													<div class="income-color">
														<fmt:formatNumber value="${detailViewItem.amount}" pattern="#,###" />
													</div>
												</c:when>
												<c:otherwise>
													<div class="expenditure-color">
														<fmt:formatNumber value="${detailViewItem.amount * -1}" pattern="#,###" />
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<c:if test="${not empty detailViewItem.memo}">
										<div>
											<%-- 수입 / 지출 내용 --%>
											<div class="dataMemo">${detailViewItem.memo}</div>
										</div>
									</c:if>
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
																	<i class="receiptImageShow far fa-image fa-lg pointer-cursor"
																		data-toggle="modal" data-target="#receiptModal" <%-- 모달 --%>
																		data-toggle="tooltip" data-placement="bottom" title="영수증 이미지 보기"> <%-- 툴팁 --%>
																	</i>
																	<input type="hidden" value="${detailViewItem.receiptImage}">
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
																			<div class="itemPrice mr-5">
																				<fmt:formatNumber value="${item.expenditureItemPrice}" pattern="#,###" />
																			</div>
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
							<div class="col-2 d-flex flex-column flex-gap-2">
								<div class="d-flex justify-content-end flex-gap-1">
									<%-- 수정자 데이터 --%>
									<c:choose>
										<c:when test="${detailViewItem.condition eq 'income'}">
											<c:set var="breakValue" value="false" /> <%-- break --%>
											<c:forEach var="income" items="${incomeEditorList}">
												<c:if test="${(not breakValue) && (detailViewItem.dataNo eq income.key)}">
													<i class="dataEditHistory fas fa-history fa-lg pointer-cursor"
														data-toggle="modal" data-target="#editHistoryModal" <%-- 모달 --%>
														data-toggle="tooltip" data-placement="bottom" title="수정 내역 조회"> <%-- 툴팁 --%>
														<%-- 수정자 리스트 --%>
														<c:set var="editorList" value="" />
														<c:forEach var="editor" items="${income.value}">
															<c:set var="editorList" value="${editorList}━${editor.member}┃${editor.editDate}" />
														</c:forEach>
														<input type="hidden" value="${editorList}">
													</i>
													
													<%-- break 처리 --%>
													<c:set var="breakValue" value="true" />
												</c:if>
											</c:forEach>
										</c:when>
										<c:when test="${detailViewItem.condition eq 'expenditure'}">
											<c:set var="breakValue" value="false" /> <%-- break --%>
											<c:forEach var="expenditure" items="${expenditureEditorList}">
												<c:if test="${(not breakValue) && (detailViewItem.dataNo eq expenditure.key)}">
													<i class="dataEditHistory fas fa-history fa-lg pointer-cursor"
														data-toggle="modal" data-target="#editHistoryModal" <%-- 모달 --%>
														data-toggle="tooltip" data-placement="bottom" title="수정 내역 조회"> <%-- 툴팁 --%>
														<%-- 수정자 리스트 --%>
														<c:set var="editorList" value="" />
														<c:forEach var="editor" items="${expenditure.value}">
															<c:set var="editorList" value="${editorList}━${editor.member}┃${editor.editDate}" />
														</c:forEach>
														<input type="hidden" value="${editorList}">
													</i>
													
													<%-- break 처리 --%>
													<c:set var="breakValue" value="true" />
												</c:if>
											</c:forEach>
										</c:when>
									</c:choose>
									
									<i class="dataEdit far fa-edit fa-lg pointer-cursor"
										data-toggle="tooltip" data-placement="bottom" title="내역 수정">
									</i>
									<i class="dataDelete far fa-trash-alt fa-lg pointer-cursor"
										data-toggle="tooltip" data-placement="bottom" title="내역 삭제">
									</i>
									<%-- 삭제 이벤트를 위한 데이터 적재 --%>
									<input type="hidden" value="${detailViewItem.condition}"> <%-- condition --%>
									<input type="hidden" value="${detailViewItem.dataNo}"> <%-- dataNo --%>
									<input type="hidden" value="${detailViewItem.receiptImage}"> <%-- receiptImage --%>
								</div>
								<div class="d-flex h-100 align-self-end align-items-center">
									<div class="changeBudget">
										<c:set var="remainingBalance" value="${remainingBalance + detailViewItem.amount}" />
										<fmt:formatNumber value="${remainingBalance}" pattern="#,###" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<%-- 영수증 이미지 모달 --%>
		<jsp:include page="/WEB-INF/views/accountBook/receiptImageModal.jsp" flush="true" />
		
		<%-- 수정자 조회 모달 --%>
		<jsp:include page="/WEB-INF/views/accountBook/modal/editHistoryModal.jsp" flush="true" />
	</body>
</html>