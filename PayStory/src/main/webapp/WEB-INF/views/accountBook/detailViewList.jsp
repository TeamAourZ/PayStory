<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/accountBook/detailViewList.css' />" rel="stylesheet" type="text/css">
	</head>
	<body>
		<c:choose>
			<c:when test="${empty dataList}">
				<span>내역이 존재하지 않습니다.</span>
			</c:when>
			<c:otherwise>
				<c:forEach var="data" items="${dataList}" varStatus="dataStatus">
					<!-- 수입 / 지출 내역 -->
					<div class="row dataBox w-100 pt-2 pb-2 mt-2">
						<c:choose>
							<c:when test="${data.mainTag eq 'income'}">
								<script type="text/javascript">
									$('.dataBox').eq(i).addClass('incomeData');
								</script>
							</c:when>
							<c:otherwise>
								<script type="text/javascript">
									$('.dataBox').eq(i).addClass('expenditureData');
								</script>
							</c:otherwise>
						</c:choose>
						<!-- 태그 -->
						<div class="col-2 align-self-center">
							<div class="rounded-circle text-center p-0">${data.tagName}</div>
						</div>
						<!-- 내용 1 -->
						<div class="col-8">
							<div class="d-flex mb-2">
								<div class="dataSource">${data.source}</div>
								<div class="dataAmount">
									<fmt:formatNumber value="${data.amount}" pattern="#,###" />
								</div>
								<c:if test="${(data.mainTag eq 'expenditure') && (fn:length(data.items) gt 0)}">
									<div id="detailsBox${dataStatus.index}" class="accordion">
										<div class="card">
											<div id="itemListCard${dataStatus.index}" class="card-header p-0 d-flex justify-content-between">
												<div class="side"></div>
												<h2 class="btn text-center collapsed w-100 m-0" data-toggle="collapse" data-target="#collapse${dataStatus.index}" aria-expanded="false" aria-controls="collapse${dataStatus.index}">
													상세 목록&nbsp;
												</h2>
												<div class="side text-center">
													<c:if test="${data.isReceipt eq true}">
														<i class="far fa-image fa-lg pointer-cursor"></i>
													</c:if>
												</div>
											</div>
											<div class="card-body p-0">
												<div id="collapse${dataStatus.index}" class="collapse" aria-labelledby="itemListCard${dataStatus.index}" data-parent="#detailsBox${dataStatus.index}">
													<div class="itemListBox mt-1">
														<c:forEach var="item" items="${data.items}">
															<div class="itemBox d-flex justify-content-between mb-1">
																<div class="itemName ml-5">${item.itemName}</div>
																<div class="itemPrice mr-5">${item.itemPrice}</div>
															</div>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
						<!-- 내용 2 -->
						<div class="col-2 d-flex flex-column">
							<div class="text-right">
								<i class="dataEdit far fa-edit fa-lg pointer-cursor"></i>
								<i class="dataDelete far fa-trash-alt fa-lg pointer-cursor"></i>
							</div>
							<div>
								{예금 변동 내역}
								<!-- 
									연산 고안 필요
								 -->
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>