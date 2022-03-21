<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<script src="<c:url value='/main/js/accountBook/modal/budgetEditModal.js' />" type="text/javascript"></script>
	</head>
	<body>
		<div class="modal fade" id="budgetEditModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="budgetEditModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" id="backToModalBtn1">
							<span>
								<i class="fas fa-arrow-left"></i>
							</span>
						</button>
						<h5 id="budgetEditModalLabel" class="modal-title font-weight-bold text-primary text-lg">예산 수정</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="d-flex flex-column flex-gap-2">
							<%-- 예산 --%>
							<div id="budgetBox">
								<h6 class="font-weight-bold text-secondary">예산</h6>
								<div class="input-group">
									<input type="month" class="form-control">
									<input type="text" class="form-control">
									<div class="input-group-append">
										<button type="button" id="editBudget" class="btn btn-primary">수정</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="backToModalBtn2" class="btn btn-secondary">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>