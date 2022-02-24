<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">가계부 작성은 끝나셨나요?</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					    	<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">준비가 되었으면 아래의 "로그아웃"을 눌러주세요.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
						<a class="btn btn-primary" href="/member/logout">로그아웃</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>