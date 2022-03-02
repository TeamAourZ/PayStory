<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<body>
		<div class="table mb-0">
			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<div class="row">
					<div class="col-sm-12">
						<i class="detailBoxClose fas fa-times position-absolute pointer-cursor"></i>
						<table class="table mb-0">
							<thead>
								<tr class="text-center">
									<th colspan="2">${year}년&nbsp;${month}월</th>
								</tr>
							</thead>
							<tbody class="budgetStatus">
								<tr class="text-right">
									<td>당월 예산 :</td>
									<c:choose>
										<c:when test="${empty budget}">
											<td>0</td>
										</c:when>
										<c:otherwise>
											<td><fmt:formatNumber value="${budget}" pattern="#,###" /></td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr class="text-right">
									<td>남은 예산 :</td>
									<td>
										<c:set var="remainingBudget" value="${budget + incomeTotalAmount - expenditureTotalAmount}" />
										<fmt:formatNumber value="${remainingBudget}" pattern="#,###" />
									</td>
								</tr>
								<tr class="text-right">
									<td>총 수입금 :</td>
									<c:choose>
										<c:when test="${empty incomeTotalAmount}">
											<td>0</td>
										</c:when>
										<c:otherwise>
											<td><fmt:formatNumber value="${incomeTotalAmount}" pattern="#,###" /></td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr class="text-right">
									<td>총 지출금 :</td>
									<c:choose>
										<c:when test="${empty expenditureTotalAmount}">
											<td>0</td>
										</c:when>
										<c:otherwise>
											<td><fmt:formatNumber value="${expenditureTotalAmount}" pattern="#,###" /></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>