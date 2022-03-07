<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="PayStory 게시글 - 조회">
    <meta name="author" content="AourZ">
    <title>PayStory 게시글 조회</title>

    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
    <link href="/main/css/board/boardView.css" rel="stylesheet">

</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

       <!-- Side Bar -->
       <jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp"  flush="true" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
				<!-- Top Menu Bar  -->
                <jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />
				
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800 ml-5">게시글 조회</h1>
                    
                    <!-- 게시글 -->
                    <c:if test="${ not empty board }">
                    	<div class="p-4 bg-white w-75 m-auto rounded">
						 <div class="px-4">
		              		<div class="form-row">
		              			<!-- 제목 -->
			              		<div class="form-group col-8">
			              			<label>제목</label>
			              			<input type="text" class="form-control shadow-none" value="${ board.boardTitle }" readonly/>
			              		</div>
			              		<!-- 카테고리 -->
			              		<div class="form-group col-4">
				              		<label>카테고리</label>
				              		<input type="text" class="form-control shadow-none" value="${ board.boardCategoryName }" readonly/>
				              	</div>
		              		</div>
			              	<!-- 첨부파일 -->
			              	<div class="form-group">
				              	<label>첨부 파일</label>
				              	<input class="form-control shadow-none" readonly/>
			              	</div>
			              	<!-- 내용 -->
		              		<div class="form-group">
			              		<label>내용</label>
			              		<textarea class="content form-control shadow-none" name="boardContents" readonly>${ board.boardContents }</textarea>
			              	</div>
			              	<div class="d-flex align-items-center justify-content-center mt-3">
			              		<c:choose>
									<c:when test="${ board.memberNo eq sessionScope.memberNo }">
										<button type="button" class="updateBtn btn btn-primary w-25 mr-3 shadow-none">수정</button>
										<button type="button" class="listBtn btn btn-primary w-25 shadow-none">목록</button>
									</c:when>
									<c:otherwise>
						              	<button type="button" class="listBtn btn btn-primary w-25 shadow-none">목록</button>
									</c:otherwise>
				              	</c:choose>
							</div>
	              		</div>                   	
                    </div>
                    </c:if>
                </div>	<!-- container-fluid end -->
			</div>	<!-- Content end -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <jsp:include page="/WEB-INF/views/layout/logoutModal.jsp" flush="true"/>

    <!-- Bootstrap core JavaScript-->
    <script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/bootstrap/js/sb-admin-2.min.js"></script>
    <!-- boardView JavaScript -->
    <script src="/main/js/board/boardView.js"></script>
    
</body>
</html>