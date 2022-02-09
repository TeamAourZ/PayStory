<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>챗 봇</title>
	    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	    <link rel="stylesheet" type="text/css" href="/main/css/style.css">
	    <script src="/main/js/jquery-3.6.0.min.js"></script>
	    <script src="/main/js/chatbot.js"></script>
	</head>
	
	<body>
	    <div class="container">
	        <div class="leftSide">
	            <!-- header -->
	            <div class="header">
	                <div class="userimg">
	                    <img src="images/user.jpg" class="cover">
	                </div>
	                <ul class="nav_icons">
	                    <li>
	                        <ion-icon name="scan-circle-outline"></ion-icon>
	                    </li>
	                    <li>
	                        <ion-icon name="chatbox"></ion-icon>
	                    </li>
	                    <li>
	                        <ion-icon name="ellipsis-vertical"></ion-icon>
	                    </li>
	                </ul>
	            </div>
	            <!-- search -->
	            <div class="search_chat">
	                <div>
	                    <input type="text" placeholder="질문을 입력해주세요.">
	                    <ion-icon name="search-outline"></ion-icon>
	                </div>
	            </div>
	            <!-- chat list -->
	            <div class="chatlist">
	                <div class="block active">
	                    <div class="imgbox">
	                        <img src="images/ma.jpg" class="cover">
	                    </div>
	                    <div class="details">
	                        <div class="listHead">
	                            <h4>마동석</h4>
	                            <p class="time">10:56</p>
	                        </div>
	                        <div class="message_p">
	                            <p>어떻게 지내? aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="block unread">
	                    <div class="imgbox">
	                        <img src="images/jang.jpg" class="cover">
	                    </div>
	                    <div class="details">
	                        <div class="listHead">
	                            <h4>장기용</h4>
	                            <p class="time">10:56</p>
	                        </div>
	                        <div class="message_p">
	                            <p>Hello~?</p>
	                            <b>1</b>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>

	        <div class="rightSide">
	            <div class="header">
	                <div class="imgText">
	                    <div class="userimg">
	                        <img src="images/user.jpg" class="cover">
	                    </div>
	                    <h4>정유성<br><span>online</span></h4>
	                </div>
	                <ul class="nav_icons">
	                    <li>
	                        <ion-icon name="search-outline"></ion-icon>
	                    </li>
	                    <li>
	                        <ion-icon name="ellipsis-vertical"></ion-icon>
	                    </li>
	                </ul>
	            </div>
	            
	            <!-- chatbox -->
	            <div id="chatBox">
	                <!-- <div class="message my_message">
	                    <p>Hi<br><span>12:15</span></p>
	                </div>
	                <div class="message frnd_message">
	                    <p>Hello<br><span>12:17</span></p>
	                </div> -->
	            </div>
	            <!-- chat input -->
	            <div class="chatbox_input">
	            	<form id = "chatForm">
		                <ion-icon name="happy-outline"></ion-icon>
		                <ion-icon name="document-attach-outline"></ion-icon>
		                <input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">	
		                <ion-icon type="submit" id="submit" value="전송" name="enter"></ion-icon>
		                <ion-icon name="mic"></ion-icon>
	                </form>
	            </div>
	        </div>
	    </div>
	
	</body>

</html>