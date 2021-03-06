<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
<script
	src="<c:url value='/main/js/accountBook/public/addParticipantCheck.js'/>"></script>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Side Bar -->
		<jsp:include page="/WEB-INF/views/layout/sideMenu.jsp" flush="true" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Top Menu Bar  -->
				<jsp:include page="/WEB-INF/views/layout/topMenu.jsp" flush="true" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->

					<div class="tab-content p-4 bg-white rounded d-flex flex-column align-items-center justify-content-center">
						<!----------------------- 추가 ---------------------------->
						<div class="publicBox shadow"> 
							<div class="card-header">
								<center>
									<h5>참여자 추가</h5>
								</center>
							</div>
							<form id="addParticipantForm" name="addParticipantForm"
								action="<c:url value='/accountBook/public/addParticipant'/>">
								<div align="right" class=profileBox>
									<img class="profileImage"src="<c:url value='/main/images/blankprofile.png'></c:url>" alt="">
								</div>
								<input id="participant" type="text" name="participant"
									class="participantinputbox" placeholder="초대할 이메일주소" size="50">
									<button type="submit" id="submitbtn1" class="ShareAddParticipantBtn">추가</button>
								
							</form>
						</div>
						
						<div class="publicBox shadow">
							<div class="card-header">
								<center>
									<h5>참여자 삭제</h5>
								</center>
							</div>

							<div class="participantPagePerson">
								<div align="right" class=profileBox>

									<c:choose>
										<c:when test="${shareMainVO.ownerImage == null}">
											<img class="ownerImage"
												src="<c:url value='/main/images/blankprofile.png'></c:url>"
												alt="">
										</c:when>
										<c:when test="${shareMainVO.ownerImage == ''}">
											<img class="ownerImage"
												src="<c:url value='/main/images/blankprofile.png'></c:url>"
												alt="">
										</c:when>
										<c:otherwise>
											<img class="ownerImage"
												src="<c:url value='/images/member/${shareMainVO.ownerNo}/${shareMainVO.ownerImage}'></c:url>"
												alt="">
										</c:otherwise>
									</c:choose>
								</div>
								<div class=profileBox2>${shareMainVO.ownerName}</div>
							</div>

							<c:forEach items="${shareMainVO.participantNo}" var="shareMain"
								varStatus="status">

								<div class="participantPagePerson">
									<div align="right" class=profileBox>
										<c:choose>
											<c:when
												test="${shareMainVO.participantImage[status.index] == null}">
												<img class="profileImage"
													src="<c:url value='/main/images/blankprofile.png'></c:url>"
													alt="">
											</c:when>
											<c:when
												test="${shareMainVO.participantImage[status.index] == ''}">
												<img class="profileImage"
													src="<c:url value='/main/images/blankprofile.png'></c:url>"
													alt="">
											</c:when>
											<c:otherwise>
												<img class="profileImage"
													src="<c:url value='/images/member/${shareMain}/${shareMainVO.participantImage[status.index]}'></c:url>"
													alt="">
											</c:otherwise>
										</c:choose>
									</div>
									<div class=profileBox2>${shareMainVO.participantName[status.index]}</div>
									<button type='button' id='delbtn"+emailIndex+"'
										class='ShareAddParticipantBtn'
										onclick='delParticipant("${shareMainVO.participantNo[status.index]}", "${fn:length(shareMainVO.participantNo)}")'>
										삭제
									</button>
								</div>

							</c:forEach>
						</div>
						<button type="button" class="deleteBtn btn btn-primary">공유 가계부 삭제</button>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

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

		function delParticipant(index, count) {
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				if(count==1){
					if(confirm("이 공유가계부를 삭제하시겠습니까?") == true){
						location.href = "/accountBook/public/removeParticipantDo?participantNO="
							+ index + "&participantCount=" + count;
					}
					else{
						return;
					}
				}
				location.href = "/accountBook/public/removeParticipantDo?participantNO="
						+ index + "&participantCount=" + count;
			}
			else { //취소
				return;
			}
		}

		function delEmail(index) {
			$("#participant_list\\[" + index + "\\]").remove();
			$("#delbtn" + index).remove();

			/* 	if(emailIndex > index && $("#participant_list\\["+emailIndex+"\\]")!=NULL){
					$("#participant_list\\["+index+"\\]")=$("#participant_list\\["+emailIndex+"\\]");
					$("#participant_list\\["+emailIndex+"\\]").remove();
					$("#delbtn"+emailIndex).remove();
				} */

		}
	</script>
</body>
</html>