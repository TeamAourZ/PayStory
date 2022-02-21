<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>비밀번호변경</title>	
		<!-------- CSS-------->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<link href="<c:url value='/main/css/profile.css'/>" rel="stylesheet" type="text/css">	
		
		<script src="<c:url value='/main/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/main/js/pwUpdateView.js'/>"></script>
	</head>
	<body>
		<div id="wrapper">
			<!-- Side Bar -->
			<jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp" flush="true" />	
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				<!-- Main Content -->
				<div id="content">
					<!-- Top Menu Bar  -->
					<jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />		
					<div class="container-fluid">
                      <div class="row">
                        <div class="col-lg-6">                   
                            <!-- 회원정보 수정 -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">비밀번호변경</h6>
                                </div>
                                <div class="card-body">           
                                	<form action="/member/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
				                    <input type="hidden" id="memberEmail" name="memberEmail" value="${login.memberEmail}">
									<div class="col-sm-8 col-sm-offset-2">
								        <div class="panel panel-default panel-margin-10">
								            <div class="panel-body panel-body-content text-center">
								                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
								                <div class="form-group">
								                    <input type="password" name="memberPwd" id="memberPwd" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
								                </div>
								                <div class="form-group">
								                    <input type="password" name="memberPwd1" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
								                </div>
								                <div class="form-group">
								                    <input type="password" name="memberPwd2" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
								                </div>
								                <button type="button" id="pwUpdate" name="pwUpdate" class="btn btn-primary">비밀번호 변경</button> <a href="<c:url value='/member/infoView'/>" class="btn btn-default">취소</a>
								            </div>
								        </div>
								    </div>									 																		
								</form>
                            </div>
                        </div>
                    </div>                        						
				</div>
			</div>
		</div>
	</div>
</div>	
		<!-------- JS : Bootstrap, Custom -------->
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/chart.js/Chart.min.js' />"></script>	
	</body>
</html>