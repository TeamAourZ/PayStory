<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>랜딩페이지</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<link href="<c:url value='main/css/index.css'/>" rel="stylesheet" type="text/css">
	</head>
<body>
	<div id="wrap">
		<header>
			<div class="headerBox">
				<div class="nullBox"><img src="<c:url value='main/images/null.png'/>" id="nullImg"></div> 
				<div class="logoBox"><a href="<c:url value='/index'/>"><img src="<c:url value='main/images/indexlogo.png'/>" id="logoImg"></a></div>	
				<nav>
					<div class="userBox">
						<ul>
							<c:if test="${empty login}">
							<li><a href="<c:url value='/member/loginView'/>">로그인</a></li>
							<li><a href="<c:url value='/member/registerView'/>">회원가입</a></li>
							</c:if>
							 <c:if test="${not empty login}">
							 ${login.memberName} 해윙~	
							<li><a href="${path}/member/logout">로그아웃</a></li>
							</c:if>
						</ul>
					</div>
				</nav>
			</div>
		</header>
		<section>
			<article class="section">
				<input type="radio" name="slide" id="slide01" checked>
				<input type="radio" name="slide" id="slide02">
				
				<div class="slidwrap">
					<ul class="slidelist">
						<li>
							<a>
								<label for="slide02" class="left"></label>
								<img src="<c:url value='main/images/slide01.png'/>">
								<label for="slide02" class="right"></label>
							</a>
						</li>
						<li>
							<a>
								<label for="slide01" class="left"></label>
								<img src="<c:url value='main/images/slide02.png'/>">
								<label for="slide01" class="right"></label>
							</a>
						</li>
					</ul>
				</div>
			</article>
			<!-- 상세 -->
			<article class="main_text">
			<h1>Pay Story</h1>
			<div class="contents">Pay Story는 공유가계부, 대시보드, AI기능이 탑재됐습니다.</div>
			
			<ul class="fn">
				<li>
					<div class="fn_img">
						<img src="<c:url value='main/images/iconT1.png'/>">
					</div>
					<div class="contents_bold">공유가계부</div>
					<div class="contents3">
					가족 혹은 모임에서 예산 관리를<br>하고 싶다고 생각하신적은 없나요?<br>저희가 해결해 줄게요
					</div>
				</li>
				<li>
					<div class="fn_img">
						<img src="<c:url value='main/images/iconT3.png'/>">
					</div>
					<div class="contents_bold">대시보드</div>
					<div class="contents3">
					수입, 지출 상세내역을 한눈에 보고 자신의 지출 성향을 파악하세요
					</div>
				</li>
				<li>
					<div class="fn_img">
						<img src="<c:url value='main/images/iconT2.png'/>">
					</div>
					<div class="contents_bold">AI기능</div>
					<div class="contents3">
					영수증으로 자동입력하기와 챗봇<br>기능으로 여러 AI기능을 사용해봐요
					</div>
				</li>
			</ul>
			</article>
			
			<article class="fn_text">
				<h1>공유가계부</h1>
				<div class="contents">가족이나 모임에서<br>다 같이 예산관리를<br>할 수 있게 해줍니다</div>
				
				<ul class="sharing">
					<li>
						<div class="sharing_img">
							
						</div>
					</li>
				</ul>
			</article>
		</section>
		
	</div>
</body>
</html>