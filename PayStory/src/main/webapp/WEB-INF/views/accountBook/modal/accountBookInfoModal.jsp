<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<script src="<c:url value='/main/js/accountBook/modal/accountBookInfoModal.js' />" type="text/javascript"></script>
	</head>
	<body>
		<div class="modal fade" id="accountBookInfoModal" tabindex="-1" role="dialog" aria-labelledby="accountBookInfoModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 id="accountBookInfoModalLabel" class="modal-title font-weight-bold text-primary text-lg">가계부 정보</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="d-flex flex-column flex-gap-2">
							<%-- 타이틀 --%>
							<div id="titleBox">
								<h6 class="font-weight-bold text-secondary">가계부 이름</h6>
								<div class="input-group">
									<input type="text" id="title" class="form-control">
								</div>
							</div>
							
							<%-- 예산 --%>
							<div id="budgetBox">
								<h6 class="font-weight-bold text-secondary">예산</h6>
								<div class="input-group">
									<input type="month" id="firstModalDate" class="form-control" onchange="firstModalDateChange(event)">
									<input type="text" id="budget" class="form-control" readonly>
									<div class="input-group-append">
										<button type="button" id="budgetSettingBtn" class="btn btn-outline-secondary">
											<i class="calendarSettings fas fa-cog fa-lg"></i>
										</button>
									</div>
								</div>
								<div>
									<span class="text-danger font-weight-light text-xs">＊예산 수정은 별도입니다.</span>
								</div>
							</div>
							
							<%-- 설명 --%>
							<div id="describeBox">
								<h6 class="font-weight-bold text-secondary">설명</h6>
								<div class="input-group">
									<textarea id="describe" class="form-control" rows="3" maxlength="200"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="accountBookInfoEditBtn" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>