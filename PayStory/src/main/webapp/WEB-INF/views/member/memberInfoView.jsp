<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>프로필수정</title>	
		<!-------- CSS-------->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<link href="<c:url value='/main/css/profile.css'/>" rel="stylesheet" type="text/css">	
		
		<script src="<c:url value='/main/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/main/js/infoView.js'/>"></script>
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
                                    <h6 class="m-0 font-weight-bold text-primary">회원정보 수정</h6>
                                </div>
                                <div class="card-body">           
                                	<form id="infoView" action="/member/infoUpdate" method="POST" class="form-signup form-user panel-body"  autocomplete="off">
                            		<input type="hidden" id="memberNameCheck" name="memberNameCheck" value="N"/>                             
                					<fieldset>
                					<!-- 프로필 이미지 -->
                						<div class="imageBox">
                							<ul>
                								<li>
                									<a href="#">
                										<div class="screen">
                											<div class="imageTextTop">프로필 이미지 수정</div>
                											<div class="imageTextBottom">클릭해주세요</div >
                											<img class="profile" src="<c:url value='/main/images/logo.png'/>">
                										</div>
                									</a>
                								</li>
                							</ul>
                							<%-- <img class="profile" src="/image/${login.memberImg}"> --%>
                						</div>
                					<!-- 이메일, 닉네임 -->	
                    					<div class="form-group">
					                        <label class="control-label" for="fullName">이메일</label>
					                        <input type="text" name="memberEmail" class="form-control input-sm"  value="${login.memberEmail}" id="memberEmail" readonly>
                    					</div>
                   						<div class="form-group">
                        					<label class="control-label" for="nickname">닉네임</label>                      
       						 					<a href="#" class="btn btn-outline-dark btn-icon-split" style="text-align:center;" onclick="duplicate(); return false;">
           											<span class="icon text-white-30">
            		    								<i class="fas fa-check"></i>            		   
           				 							</span>
           				 							<span class="text">중복체크</span>
        										</a>
                        						<input type="text" name="memberName" class="form-control input-sm" placeholder="닉네임"  value="${login.memberName}" id="memberName">      
                    					</div>                       
                					</fieldset>
               						 <button class="btn btn-primary btn-block" type="button" onclick="fnSubmit(); return false;">정보 수정</button>
            						</form>                               
                                </div>
                            </div>
                            <!-- 비밀번호 변경, 회원탈퇴 -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">비밀번호 변경, 회원탈퇴</h6>                   
                                </div>
                                <div class="card-body">
                                     <a href="<c:url value='/member/pwUpdateView'/>"  class="btn btn-info btn-block">비밀번호 변경</a>
               						 <a href="<c:url value='/member/memberDelete'/>"  class="btn btn-default btn-block">회원 탈퇴</a>                                  
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">참여 가계부</h6>
                                </div>
                                <div class="card-body">
                                    <br>                                 
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