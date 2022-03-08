<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<style>
.grid-item {
	width: 200px;
}

.grid-item--width2 {
	width: 400px;
}
</style>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>PayStory 공유 가계부</title>

<!-- Custom fonts for this template-->
<link href="/bootstrap/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/main/css/accountBook/public/publicMain.css">
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Side Bar -->
		<jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp"
			flush="true" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Top Menu Bar  -->
				<jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp"
					flush="true" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->

					<div class="publicBox shadow">
						<div class="card-header">
							<center>
								<h5>참여중인 공유가계부</h5>
							</center>
						</div>

						<%-- <td><img src="<c:url value='/images/${prd.prdNo}.jpg'/>" width="30" height="20">
			   					<!-- 또는  -->
			   			        <img src="/images/${prd.prdNo}.jpg" width="30" height="20"></td> --%>

						<c:forEach items="${shareMainVOList}" var="shareMain">
							<div class="publicAccountBox" style="display: inline-block;">
								<span
									style="margin: -15px; height: 25px; width: 25px; width: 25px; float: right; padding-top: 5px;">
									<i class="far fa-edit"></i>
								</span>
								<div onclick="location.href='/accountBook/public/setAccountNo?num=${shareMain.accountBookNo}'">
									<span class="ellipsis">${shareMain.accountBookTitle}</span>
									<div class="box" style="background: #BDBDBD;">
										<c:choose>
											<c:when test="${shareMain.ownerImage == null}">
												<img class="profile" src="<c:url value='/main/images/blankprofile.png'></c:url>" alt="">
											</c:when>
											
											<c:otherwise>
											    <img class="profile" src=<c:url value='/images/member/${shareMain.ownerNo}/${shareMain.ownerImage}'/>alt="">
										    </c:otherwise>
										</c:choose>

									</div>

									<span class="ellipsis">${shareMain.ownerName}</span>
									<div class="box2"
										style="background: #BDBDBD; display: inline-block;">
											<c:choose>
											    <c:when test="${shareMain.participantImage[0] == null}">
											       <img class="profile" src="<c:url value='/main/images/blankprofile.png'></c:url>" width="50px" height="50px" alt="">
											    </c:when>
											   
											    <c:otherwise>
											        <img class="profile" src=<c:url value='/images/member/${shareMain.participantNo[0]}/${shareMain.participantImage[0]}'></c:url> width="50px" height="50px" alt="">
											    </c:otherwise>
											</c:choose>
									</div>
									<div class="box2"
										style="background: #BDBDBD; display: inline-block;">
										<c:choose>
											    <c:when test="${shareMain.participantImage[1] == null}">
											       <img class="profile" src="<c:url value='/main/images/blankprofile.png'></c:url>" width="50px" height="50px" alt="">
											    </c:when>
											   
											    <c:otherwise>
											        <img class="profile" src=<c:url value='/images/member/${shareMain.participantNo[1]}/${shareMain.participantImage[1]}'></c:url> width="50px" height="50px" alt="">
											    </c:otherwise>
										</c:choose>
									</div>
									<div class="box2"
										style="background: #BDBDBD; display: inline-block;">
										<c:choose>
											    <c:when test="${shareMain.participantImage[2] == null}">
											       <img class="profile" src="<c:url value='/main/images/blankprofile.png'></c:url>" width="50px" height="50px" alt="">
											    </c:when>
											   
											    <c:otherwise>
											        <img class="profile" src=<c:url value='/images/member/${shareMain.participantNo[2]}/${shareMain.participantImage[2]}'></c:url> width="50px" height="50px" alt="">
											    </c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>

						</c:forEach>


						<!--박스 추가 버튼-->

						<div class="publicAccountBox" style="display: inline-block;">
							<span class="ellipsisplus1">임시</span>
							<div class="plusbox1" style="background: #BDBDBD;">
								<a href="create"><button type="button" id="mainPlusBtn">
										<i class="fa-solid fa-plus fa plusimage"></i>
									</button></a>
							</div>
							<span class="ellipsisplus2">임시</span>
							<div class="plusbox2"
								style="background: #BDBDBD; display: inline-block;"></div>
							<div class="plusbox2"
								style="background: #BDBDBD; display: inline-block;"></div>
							<div class="plusbox2"
								style="background: #BDBDBD; display: inline-block;"></div>
						</div>

						<!--박스 추가 버튼-->


					</div>


				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->

			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/bootstrap/js/sb-admin-2.js"></script>

	<!-- Page level plugins -->
	<script src="/bootstrap/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/bootstrap/js/demo/chart-area-demo.js"></script>
	<script src="/bootstrap/js/demo/chart-pie-demo.js"></script>


	<!-- <script src="https://naver.github.io/egjs-infinitegrid/release/latest/dist/infinitegrid.min.js" crossorigin="anonymous"></script> -->
	<script
		src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

	<script type="text/javascript">
		$('.grid').masonry({
			// options
			itemSelector : '.grid-item',
			columnWidth : 200
		});
	</script>
</body>
</html>