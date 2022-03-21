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
    <title>PayStory 로그인</title>
    <!-------- CSS-------->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="<c:url value='/main/css/member/join.css'/>" rel="stylesheet" type="text/css">
    
    <!-- Favicon -->
	<link rel="shortcut icon" href="/main/images/paystory.ico" type="image/x-icon"/>

</head>
<body class="bg-gradient-primary">
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-image">
                            	<img src="<c:url value='/main/images/sideimgtest.png'/>">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">PayStory</h1>
                                    </div>
                                    <form class="user" id="login" name="login" method="post" action="<c:url value='/member/login'/>">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user" name="memberEmail"
                                                id="memberEmail" aria-describedby="emailHelp"
                                                placeholder="이메일">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" name="memberPwd"
                                                id="memberPwd" placeholder="비밀번호">
                                        </div>
		                                <input class="btn btn-primary btn-user btn-block" type="submit" value="로그인"> 
                                        <hr>
                                    </form>
                                    <div class="text-center">
                                		<a class="small" href="<c:url value='/member/findPwView'/>">비밀번호 찾기</a><br>
                                		<a class="small" href="<c:url value='/index'/>">홈 화면으로 가기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="<c:url value='/member/registerView'/>">계정이 없으신가요?&nbsp;&nbsp;회원가입으로 가기</a>
                                    </div>
                                </div>
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