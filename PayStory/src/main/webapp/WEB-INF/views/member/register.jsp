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
    <title>회원가입</title>
    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="<c:url value='main/css/join.css'/>" rel="stylesheet" type="text/css">
    <script src="<c:url value='main/js/register.js'/>"></script>
</head>
<body class="bg-gradient-primary">
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-image"> <!-- bg-register-image -->
                    	<img src="<c:url value='main/images/sideimgtest.png'/>">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">계정을 만들어보세요!</h1>
                            </div>
                            <form class="user" id="join" name="join" method="post" action="<c:url value='/member/insertMember'/>">
                                <!-- <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="닉네임">
                                    </div> -->
                                <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="name"
                                            placeholder="닉네임">    <!-- exampleFirstName -->
                                    <!-- <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="Last Name">
                                    </div> -->
                                </div>                           
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="이메일">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="비밀번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                               <%--  <a href="<c:url value='/login'/>" type="submit" class="btn btn-primary btn-user btn-block">
                                    계정 등록하기!
                                </a> --%>
                                <input type="submit" value="계정 등록하기!" class="btn btn-primary btn-user btn-block">
                                <hr>
                                <a href="<c:url value='/'/>" class="btn btn-google btn-user btn-block">
                                    <!-- <i class="fab fa-google fa-fw"></i> --> Google 회원가입하기
                                </a>
                                <a href="<c:url value='/'/>" class="btn btn-facebook btn-user btn-block">
                                    <!-- <i class="fab fa-facebook-f fa-fw"></i> Register with --> Facebook 회원가입하기
                                </a>
                                <a href="<c:url value='/'/>" class="btn btn-naver btn-user btn-block">
                                    <!-- <i class="fab fa-naver-f fa-fw"></i> --> NAVER 회원가입하기
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="<c:url value='/login'/>">이미 계정이 있으신가요?&nbsp;&nbsp;로그인으로 가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<script src="<c:url value='main/js/register.js'/>"></script>
    <!-- Bootstrap core JavaScript-->
    <script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/bootstrap/js/sb-admin-2.min.js"></script>
    
</body>
</html>