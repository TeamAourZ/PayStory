<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PayStory 쉽고 편리한 가계부를 경험해보세요!</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="<c:url value='main/css/index.css'/>" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="wrap">
		<nav class="navbar">
			<div class="userBox">
				<h3 class="logo">PayStory</h3>
				<ul class="userNav">
					<c:if test="${empty login}">
						<li class="itemBox"><a
							href="<c:url value='/member/loginView'/>">로그인</a></li>
						<li class="itemBox"><a
							href="<c:url value='/member/registerView'/>">회원가입</a></li>
					</c:if>
					<c:if test="${not empty login}">
					 ${login.memberName}	
					<li class="itemBox"><a href="${path}/member/logout">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
		<section>
			<article class="section">
				<input type="radio" name="slide" id="slide01" checked> <input
					type="radio" name="slide" id="slide02">

				<div class="slidwrap">
					<ul class="slidelist">
						<li><a> <label for="slide02" class="left"></label> <img
								src="<c:url value='main/images/slide01.png'/>"> <label
								for="slide02" class="right"></label>
						</a></li>
						<li><a> <label for="slide01" class="left"></label> <img
								src="<c:url value='main/images/slide02.png'/>"> <label
								for="slide01" class="right"></label>
						</a></li>
					</ul>
				</div>
			</article>
		</section>
		<section>
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
						<div class="contents3">수입, 지출 상세내역을 한눈에 보고 자신의 지출 성향을 파악하세요
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
		</section>
<!-- 기능 소개 -->
		<!-- 공유가계부 소개란 -->
		<section class="css-vjuko1 e7dsxmo0">
			<div class="p-container p-container--default css-8vb2wj">
				<div class="p-container__inner">
					<div class="css-bjn8wh e14wovf12">
						<div class="css-awfxon">
							<h1 class="css-1kclp9l e1b3da522">공유가계부</h1>
							<h2 class="css-1iw59sv e1b3da521">가족이나 모임에서<br>다 같이 예산관리를<br>해봐요!</h2>
						</div>
						<div class="css-v5945b e984jyk0">
							<div colspan="2" style="flex-basis: calc(100% - 30px); max-width: calc(100% - 30px);" class="css-r7qaja e1gj2pfq0">
								<div class="css-1qjyiud"> 
									<div class="css-rgylcs e14wovf11">
										<div class="css-1foy5fx e14wovf10">
											<img src="<c:url value='main/images/indexTest3.png'/>">
										</div>
									</div>
									<p class="css-u4tc6t">
									같이 예산관리를 하고 싶다고<br>생각하신적은 없나요?<br><br>
									<span class="css-1smue61">PayStory에서 가능합니다!</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 대시보드 소개란 -->
		<section class="css-1i7bcd8 e7dsxmo0">
			<div class="p-container p-container--default css-1ot8705">
				<div class="p-container__inner">
					<div class="css-1w1coa0 e1prhvo15">
						<div class="css-udln85">
							<h1 class="css-1kclp9l e1b3da522">대시보드</h1>
							<h2 class="css-csrb5e e1b3da521">지출 부터 수입까지<br>대시보드로 한 눈에!</h2>
						</div>
						<div style class="css-ymgzel e1prhvo14">
							<div class="e1prhvo11 css-lkoukj ey5meut2">
								<img src="<c:url value='main/images/indexTest4.png'/>" class="css-i8161j ey5meut0">
								<img src="<c:url value='main/images/indexTest5.png'/>" class="css-zxsb69 ey5meut1">
							</div>						
						</div>
						<p class="css-lk5fic e1prhvo10">
						<!-- 수입, 지출 상세내역을 한눈에 보고 자신의 자금의 흐름을 파악하세요 -->
						자신의 수입, 지출을 한 눈에!<br>그래프와 달력을 통해 어느날 소비와 소득이 있는지 보고<br>
						상세보기를 통해 더 자세히 조회를 해봐요
						</p>
					</div>
				</div>
			</div>
		</section>
		
		
		<!-- AI 소개란 -->
		<section class="css-1i7bcd8 e7dsxmo0">
			<div class="p-container p-container--default css-1ot8705">
				<div class="p-container__inner">
					<div class="css-1w1coa0 e1prhvo15">
						<div class="css-udln85">
							<h1 class="css-1kclp9ll e1b3da522">AI</h1>
							<h2 class="css-csrb5e e1b3da521">AI기능으로<br>영수증을 기입만 하면<br>자동으로입력해줘요</h2>
						</div>
						<div style class="css-ymgzel e1prhvo14">
							<div class="e1prhvo11 css-lkoukj ey5meut2">
								<img src="<c:url value='main/images/indexTest7.png'/>" class="css-i8161jj ey5meut0">
							</div>						
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- end -->
		<section>
			<h1 class="end-text">이제 페이스토리를 작성해볼까요?</h1>
		</section>
	</div>
</body>
</html>