<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Custom fonts for this template-->
	    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&display=swap"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
	</head>
	<body>
		<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/'/>">
                <div class="sidebar-brand-icon">
                    <img alt="logo" src="/main/images/logo.png" style="width: 100%;">
                </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/'/>">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
           <div class="sidebar-heading">
                가계부
            </div>

            <!-- Nav Item - 상세 내역 조회 -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-tasks"></i>
                    <span>상세 내역 조회</span>
                </a>
            </li>

            <!-- Nav Item - 수입 | 지출 내역 추가 -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-plus-circle"></i>
                    <span>수입 | 지출 내역 추가</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - 게시판 -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="far fa-clipboard"></i>
                    <span>게시판</span>
                </a>
            </li>

            <!-- Nav Item - 챗봇 -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-robot"></i>
                    <span>챗봇</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->
		
		<!-- Bootstrap core JavaScript-->
		<script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
		<script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		<!-- Core plugin JavaScript-->
		<script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		<!-- Custom scripts for all pages-->
		<script src="/bootstrap/js/sb-admin-2.min.js"></script>
	</body>
</html>