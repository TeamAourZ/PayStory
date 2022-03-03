<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <!-- Chatbot CSS -->
    <link rel="stylesheet" type="text/css" href="/main/css/ai/groupChat.css">
    <link rel="shortcut icon" href="/main/images/paystory.ico" type="image/x-icon"/>
    <script src="/main/js/ai/jquery-3.6.0.min.js"></script>
	
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
                
                <h1 class="h3 mb-2 text-gray-800 ml-5">PayStory GroupChatting</h1>

                <!-- Begin Page Content -->
                <div class="container-fluid">
                	<div id="chatt" class="formWrap p-2 bg-white rounded">
						<form class="my-4">
		                	<div class="form-row">
	                			<div class="form-group col-12">
									
									<div class="input-group mb-3">
										<input type="text" id="mid" class="form-control" placeholder="닉네임을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
										<button class="btn btn-primary  shadow-none" type="button" id="btnLogin">로그인</button>
									</div>
									
									
									<div id="talk" class="chatTalk"></div>
									<br>
									<div id="sendZone" class="input-group mb-3">
										<textarea id="msg" value="hi..." class="form-control" cols="8" rows="1"></textarea>
										<button class="btn btn-primary shadow-none" type="button" id="btnSend">전송</button>
									</div>
									
								</div>
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
    
    <!-- Chatbot JS-->
    <script src="/main/js/ai/groupChat.js"></script>
    <script src="https://kit.fontawesome.com/7031b090f1.js" crossorigin="anonymous"></script>
    
</body>
</html>