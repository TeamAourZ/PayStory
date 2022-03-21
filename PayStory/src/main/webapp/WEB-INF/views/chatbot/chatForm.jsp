<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="PayStory 챗봇">
    <meta name="author" content="AourZ">
    <title>PayStory chat</title>

    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
    <!-- Chatbot CSS -->
    <link rel="stylesheet" type="text/css" href="/main/css/ai/chatbot.css">
    
    <!-- Favicon -->
	<link rel="shortcut icon" href="/main/images/paystory.ico" type="image/x-icon"/>
	
    <script src="/main/js/ai/jquery-3.6.0.min.js"></script>
	
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

       <!-- Side Bar -->
       <jsp:include page="/WEB-INF/views/layout/sideMenu.jsp"  flush="true" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
				<!-- Top Menu Bar  -->
                <jsp:include page="/WEB-INF/views/layout/topMenu.jsp" flush="true" />

                <!-- Begin Page Content -->
                <div class="container-fluid">
                
					<!-- Chatbot row -->
                    <div id="container_chatbot" class="container_chatbot">

				        <div id="rightSide" class="rightSide" >
				            <div class="header">
				                <div class="imgText">
				                    <div class="userimg">
				                        <img src="<c:url value='/main/images/logo.png' />" class="cover">
				                    </div>
				                    <h4>PayStory 챗봇<br><span>online</span></h4>
				                </div>
				                <ul class="nav_icons">
				                    <li>
				                        <i class="fa-solid fa-magnifying-glass"></i>
				                    </li>
				                    <li>
				                        <i class="fa-solid fa-ellipsis-vertical"></i>
				                    </li>
				                </ul>
				            </div>
				            
				            <!-- chatbox -->
				            <div id="chatBox">
				            	<p>${date}</p>
				            	<hr>
				            </div>
				            <!-- chat input -->
				            <div class="chatbox_input">
			            		<form id="chatForm_file" enctype="multipart/form-data">
			            			<i class="fa-regular fa-face-grin"></i>
			            			<label class="input-file-button"  for="uploadFile">
		            					<i class="fa-solid fa-folder-plus"></i>
			            			</label>
									<input type="file" id="uploadFile"  name="uploadFile" style="display:none" accept=".png, .jpg, .jpeg, .svg" aria-describedby="uploadFile">
									<!-- <input type="submit" value="결과 확인"> -->

								</form>
				            	<form id = "chatForm_chat" >
					                
					                <input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">	
					                <span><input type="submit" class="delinput" value="&#xf090"></span>
					                
				                </form>
				                <form id= "chatForm_voice">
				                	<button id="record" type="button"><i class="fa-solid fa-microphone"></i></button>
					                <button id="stop" type="button"><i class="fa-solid fa-stop"></i></button>
					                <div id="sound-clips"></div>
				                </form>
				                <div>
									<audio preload="auto" controls></audio>
								</div>
				            </div>
				            <!-- 이미지 모달 창 -->
				            <div class="modal_chatbotImg" name="modal_chatbotImg">
							  <div class="modal_chatbotContent" name="modal_chatbotContent">
							  	<form id="modal_formBox">
							  	</form>
							  </div>
							</div>
				        </div>
				    </div>	<!-- Chatbot container row end -->
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
    <script src="/main/js/ai/chatbot.js"></script>
    <script src="https://kit.fontawesome.com/7031b090f1.js" crossorigin="anonymous"></script>
    
</body>
</html>