<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Pay Story 가계부 - 수입/지출 내역 추가">
    <meta name="author" content="AourZ">
    <title>수입 | 지출 내역 추가</title>

    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">

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
				
				<!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800 ml-5">게시글 뷰</h1>
				
                <!-- Begin Page Content -->
                <div class="container-fluid">
	               	<div class="formWrap p-4 bg-white rounded">
		                <form class="my-4">
		                	<div class="form-row">
	                			<div class="form-group col-8">
									<div class="col-auto">
								    	<label class="col-form-label">제목</label>
									</div>
									<div class="col-auto">
								    	<input type="text" id="inputTitle" class="form-control" aria-describedby="titleHelpInline" value="{title}" readonly>
								    	
									</div>
								</div>
								<div class="form-group col-4">
									<div class="col-auto">
								    	<label class="col-form-label">카테고리</label>
									</div>
									<div class="col-auto">
								    	<input type="text" id="inputCtg" class="form-control" aria-describedby="ctgHelpInline" value="{category}" readonly>
									</div>
								</div>
					 
							</div><br>
							<div class="form-group col-12">
								<label for="floatingTextarea">내용</label>
							  	<textarea class="form-control" cols="8" rows="10" id="floatingTextarea" readonly>{content}</textarea>
							  
							</div><br>
							<div class="d-flex align-items-center justify-content-center mt-3">
								<button type="button" class="updateBtn btn btn-primary w-25 mr-3 shadow-none">수정</button>
								<button type="button" class="listBtn btn btn-primary w-25 shadow-none">목록</button>
							</div>
						</form> 
						
					</div>
					
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