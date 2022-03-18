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
<title>PayStory 공유 가계부 - 참여자 삭제</title>

<!-- Custom fonts for this template-->
<link href="/bootstrap/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/7031b090f1.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/main/css/accountBook/public/publicCreate.css">
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
					<div class="d-flex align-items-center justify-content-center mb-4">
						<ul class="nav nav-pills nav-justified w-50">
							<li class="nav-item mr-4"><a
								class="nav-link border border-primary active" data-toggle="tab"
								href="#expenditure" role="tab">추가</a></li>
							<li class="nav-item"><a
								class="nav-link border border-primary" data-toggle="tab"
								href="#income" role="tab">삭제</a></li>
						</ul>
					</div>



					<!----------------------- 추가 ---------------------------->
					
					
					<div class="tab-content p-4 bg-white rounded">
						<div class="tab-pane fade in show active" id="expenditure"
							role="tabpanel">

							<div class="publicBox shadow">
								<div class="card-header">
									<center>
										<h5>참여자 추가</h5>
									</center>
								</div>

								<div class="participantPagePerson">
									<div align="right" class=profileBox>
										<img class="ownerImage"
											"<c:url value='/images/member/${shareMain.ownerNo}/${shareMain.ownerImage}'></c:url>"
											alt="">
									</div>
									<div class=profileBox2>강성우</div>
								</div>
								
								<div class="participantPagePerson">
									<div align="right" class=profileBox>
										<img class="profileImage"
											src="<c:url value='/main/images/blankprofile.png'></c:url>"
											alt="">
									</div>
									<div class=profileBox2>박하영</div>
									<button type='button' id='delbtn"+emailIndex+"'
										class='P-delbtn delbox btn1'
										onclick='delParticipant("+emailIndex+")'>
										<i class='fa-solid fa-xmark delImage'></i>
									</button>
								</div>
								
								<div class="participantPagePerson">
									<div align="right" class=profileBox>
										<img class="profileImage"
											src="<c:url value='/main/images/blankprofile.png'></c:url>"
											alt="">
									</div>
									<div class=profileBox2>박하영</div>
									<button type='button' id='delbtn"+emailIndex+"'
										class='P-delbtn delbox btn1'
										onclick='delParticipant("+emailIndex+")'>
										<i class='fa-solid fa-xmark delImage'></i>
									</button>
								</div>

							</div>
						</div>
					
					
					<!----------------------- 삭제 ---------------------------->
					
					
					<div class="tab-pane fade in show" id="income"
							role="tabpanel">

							<div class="publicBox shadow">
								<div class="card-header">
									<center>
										<h5>참여자 삭제</h5>
									</center>
								</div>

								<div class="participantPagePerson">
									<div align="right" class=profileBox>
										<img class="ownerImage"
											src="<c:url value='/main/images/blankprofile.png'></c:url>"
											alt="">
									</div>
									<div class=profileBox2>강성우</div>
								</div>
								<div class="participantPagePerson">
									<div align="right" class=profileBox>
										<img class="profileImage"
											src="<c:url value='/main/images/blankprofile.png'></c:url>"
											alt="">
									</div>
									<div class=profileBox2>박하영</div>
									<button type='button' id='delbtn"+emailIndex+"'
										class='P-delbtn delbox btn1'
										onclick='delParticipant("+emailIndex+")'>
										<i class='fa-solid fa-xmark delImage'></i>
									</button>
								</div>
								<div class="participantPagePerson">
									<div align="right" class=profileBox>
										<img class="profileImage"
											src="<c:url value='/main/images/blankprofile.png'></c:url>"
											alt="">
									</div>
									<div class=profileBox2>aourz</div>
									<button type='button' id='delbtn"+emailIndex+"'
										class='P-delbtn delbox btn1'
										onclick='delParticipant("+emailIndex+")'>
										<i class='fa-solid fa-xmark delImage'></i>
									</button>
								</div>

							</div>
						</div>
					
					
					</div>













					<!-- Content Row -->

					<!-- Content Row -->

					<!-- Content Row -->

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

		function delParticipant() {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				location.href = "registerParticipantDo?participantNo=${shareMain.accountBookNo}";
			} else { //취소
				return;
			}
		}
	</script>
</body>
</html>