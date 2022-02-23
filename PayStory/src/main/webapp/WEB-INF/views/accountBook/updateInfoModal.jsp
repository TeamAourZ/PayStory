<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<div class="modal fade" id="updateInfoModal" tabindex="-1" role="dialog" aria-labelledby="updateInfoModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="updateInfoModalLabel">가계부 정보</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					    	<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="updateAccountBookInfo">
							<!-- 타이틀 -->
							<div class="form-group">
								<label for="title">가계부 제목</label>
								<input type="text" id="title" name="accountBookTitle" class="form-control shadow-none" required>
							</div>
							<!-- 예산 날짜 -->
							<input type="hidden" name="budgetDate">
							<!-- 예산 -->
							<div class="form-group">
								<label for="budget">예산</label>
								<input type="text" id="budget" name="budget" class="form-control shadow-none" required>
							</div>
							<!-- 설명 -->
							<div class="form-group">
								<label for="describe">가계부 설명</label>
								<textarea id="describe" name="accountBookDescribe" class="form-control shadow-none" rows="3" maxlength="200"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-danger">삭제</button>
						<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>