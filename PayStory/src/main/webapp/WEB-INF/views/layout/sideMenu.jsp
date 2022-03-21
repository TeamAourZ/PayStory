<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<input type="hidden" id="isShared" value="${ sessionScope.isShared }">	
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" id="logo" style="cursor:pointer;">
                <div class="sidebar-brand-icon">
                    <img alt="logo" src="<c:url value='/main/images/logo.png'/>" style="width: 100%;">
                </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" id="dashBoard" style="cursor:pointer;">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
           <div class="sidebar-heading">
                가계부
            </div>

            <!-- Nav Item - 상세 내역 조회 -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/accountBook/detailView'/>">
                    <i class="fas fa-tasks"></i>
                    <span>상세 내역 조회</span>
                </a>
            </li>

            <!-- Nav Item - 수입 | 지출 내역 추가 -->
            <li class="nav-item">
                <a class="nav-link" id="addItemBtn" style="cursor:pointer;">
                    <i class="fas fa-plus-circle"></i>
                    <span>수입 | 지출 내역 추가</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - 게시판 -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/board/listAll'/>">
                    <i class="far fa-clipboard"></i>
                    <span>게시판</span>
                </a>
            </li>

            <!-- Nav Item - 챗봇 -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/chatbotForm' />">
                    <i class="fas fa-robot"></i>
                    <span>챗봇</span>
                </a>
            </li>
            
            <!-- Nav Item - 관리자 -->
            <c:if test="${login.memberRank == 3}">
	            <li class="nav-item">
	                <a class="nav-link" href="<c:url value='/member/master' />">
	                    <i class="fas fa-address-book"></i>
	                    <span>관리자</span>
	                </a>
	            </li>
			</c:if>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->
        <script src="<c:url value='/main/js/sideMenu.js'/>"></script>
	</body>
</html>