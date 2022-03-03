<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>PayStory 회원가입</title>
    <!-------- CSS-------->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="<c:url value='/main/css/member/join.css'/>" rel="stylesheet" type="text/css">
	<!-------- JS-------->
	<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
    <script src="<c:url value='/main/js/member/nameCnt.js'/>"></script>
    <script src="<c:url value='/main/js/member/emailCnt.js'/>"></script>
    
</head>
<body class="bg-gradient-primary">
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-image"> 
                    	<img src="<c:url value='/main/images/sideimgtest.png'/>">
                    	<!-- <img src="/main/images/sideimgtest.png"/> -->
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">계정을 만들어보세요!</h1>
                            </div>
                            
                            <!-- 회원가입 input -->
                            <form class="user" id="join" name="join" method="post" action="<c:url value='/member/register'/>">
                            
                            	<input type="hidden" id="memberNameCheck" name="memberNameCheck" value="N"/>
                            	<input type="hidden" name="memberNo" id="memberNo">          
                                <!-- 닉네임 -->
                                <div class="form-group row">
                                	<div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="memberName"
                                            placeholder="닉네임" id="memberName">          
                                    </div>
                                    <!-- 닉네임 중복체크 -->
                                    <div class="col-sm-4 mb-3 mb-sm-0">
                                    	<a href="#" class="btn btn-success btn-icon-split" style="text-align:center;" onclick="duplicate(); return false;"> 
                                    	
           								<span class="icon text-white-30">
            		  						<i class="fas fa-check"></i>
           								</span>
           				 				<span class="text">중복체크</span>
        								</a>
                                    </div>
                                </div>
                                <!-- 이메일 -->
                                <div class="form-group row">                           
                                <!-- div class="form-group"> -->
                                	<div class="col-sm-6 mb-3 mb-sm-0">
	                                    <input type="email" class="form-control form-control-user" name="memberEmail"
	                                        placeholder="이메일" id="memberEmail">
									</div>            
                                   	<div class="col-sm-4 mb-3 mb-sm-0">
                                    	<button class="btn btn-success btn-icon-split" type="button" id="emailCheck" onclick="fn_emailCheck();" value="N">
                                    	
           								<span class="icon text-white-30">
            		  						<i class="fas fa-check"></i>
           								</span>
           				 				<span class="text">중복체크</span>
        								</button>
                                    </div>        
                                </div>
                                <!-- 비밀번호 -->
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            name="memberPwd" placeholder="비밀번호" id="memberPwd">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            name="memberPwd2" placeholder="비밀번호 확인" id="memberPwd2">
                                    </div>
                                </div>
                              
                                <button class="btn btn-primary btn-user btn-block" type="button" onclick="fnSubmit(); return false;">
                                계정 등록하기
                                </button>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="<c:url value='/member/loginView'/>">이미 계정이 있으신가요?&nbsp;&nbsp;로그인으로 가기</a><br>
                                <a class="small" href="<c:url value='/index'/>">홈 화면으로 가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
    <!-- Bootstrap core JavaScript-->
    <script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/bootstrap/js/sb-admin-2.min.js"></script>
    
</body>
</html>