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
				        <div class="leftSide">
				            <!-- header -->
				            <div class="header">
				                <div class="userimg">
				                    <img onerror='this.src="<c:url value='/main/images/blankprofile.png'></c:url>"' src="/images/member/${login.memberNo}/${login.memberImage}" class="cover">
				                </div>
				                <ul class="nav_icons">
				                    <li>
				                    	<span><input type="button" class="delinput" value="&#xf002" ></span>
				                    </li>
				                    
				                    <li>
				                        <span><input type="button" class="delinput" value="&#xf27a" ></span>
				                        <!-- <span><input type="button" class="delinput" value="&#xf4b3" onclick="div_hide();"></span> -->
				                    </li>
				                    
				                    <li>
				                        <i class="fa-solid fa-ellipsis-vertical"></i>
				                    </li>
				                </ul>
				            </div>
				            <!-- search -->
				            <div id="search_chat" class="search_chat">
				                <div>
				                    <input type="text" placeholder="질문을 입력해주세요.">
				                    <i class="fa-solid fa-magnifying-glass"></i>
				                </div>
				            </div>
				            
				            <!-- chat list -->
				            <div class="chatlist">
				                <div class="block active">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/logo.png' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>PayStory 챗봇</h4>
				                            <p class="time">10:56</p>
				                        </div>
				                        <div class="message_p">
				                            <p>안녕하세요. PayStory를 방문해 주셔서 감사합니다.</p>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/jang.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>장기용</h4>
				                            <p class="time">10:56</p>
				                        </div>
				                        <div class="message_p">
				                            <p>하...</p>
				                            <b>4</b>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/ma.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>마동석</h4>
				                            <p class="time">10:56</p>
				                        </div>
				                        <div class="message_p">
				                            <p>까꿍</p>
				                            <b>1</b>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/bin.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>원빈</h4>
				                            <p class="time">02:26</p>
				                        </div>
				                        <div class="message_p">
				                            <p>금이빨 빼고 모조리 다 씹어 먹어줄게</p>
				                            <b>2</b>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/hyun.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>안보현</h4>
				                            <p class="time">00:00</p>
				                        </div>
				                        <div class="message_p">
				                            <p>도베르만 내가 바로 미친개</p>
				                            <b>1</b>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/iu.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>iu</h4>
				                            <p class="time">08:24</p>
				                        </div>
				                        <div class="message_p">
				                            <p>나는요 오빠가 좋은걸~</p>
				                            <b>14</b>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/jun.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>위하준</h4>
				                            <p class="time">01:51</p>
				                        </div>
				                        <div class="message_p">
				                            <p>정신 똑바로 안차려?</p>
				                            <b>6</b>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/sick.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>최우식</h4>
				                            <p class="time">05:05</p>
				                        </div>
				                        <div class="message_p">
				                            <p>야 김다미 어디가</p>
				                            <b>1</b>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/son.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>손예진</h4>
				                            <p class="time">10:56</p>
				                        </div>
				                        <div class="message_p">
				                            <p>내가? 언제? 좀 예쁘긴 해</p>
				                            <b>2</b>
				                        </div>
				                    </div>
				                </div>
				                <div class="block unread">
				                    <div class="imgbox">
				                        <img src="<c:url value='/main/images/chat/suk.jpg' />" class="cover">
				                    </div>
				                    <div class="details">
				                        <div class="listHead">
				                            <h4>김민석</h4>
				                            <p class="time">12:56</p>
				                        </div>
				                        <div class="message_p">
				                            <p>하준이형 그때 너무 아프더라..</p>
				                            <b>3</b>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>

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