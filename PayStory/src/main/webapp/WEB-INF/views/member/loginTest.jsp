<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인테스트</title>
		<link href="<c:url value='main/css/login.css'/>" rel="stylesheet" type="text/css">
	</head>
<body>
	<div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
            	<div class="top-logo-wrap">
                	<%-- <div class="side_img">
                    	<img src="<c:url value='main/images/sideimgtest.png'/>">
                    </div> --%>
                </div>
                <!-- <h1>How does a login system work?</h1>
                <p>In computer security, logging in is the process by which an individual gains access 
                to a computer system by identifying and authenticating themselves.</p> -->
            </div>
            <div class="login-form-left-side">
                <div class="login-top-wrap">
                    <span>계정이없나요? 지금 회원가입해봐요.</span>
                    <button class="create-account-btn shadow-light">회원가입</button>
                </div>
                <div class="login-input-container">
                    <div class="login-input-wrap input-id">
                        <i class="far fa-envelope"></i>
                        <input placeholder="아이디" type="text">
                    </div>
                    <div class="login-input-wrap input-password">
                        <i class="fas fa-key"></i>
                        <input placeholder="비밀번호"  type="password">
                    </div>
                </div>
                <div class="login-btn-wrap">
                    <button class="login-btn">Login</button>
                    <a href="#" >아이디 찾기</a>
                    <a href="#" >비밀번호찾기 찾기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>