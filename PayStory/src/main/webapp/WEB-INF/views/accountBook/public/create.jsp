<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<style>
.grid-item { width: 200px; }
.grid-item--width2 { width: 400px; }
</style>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>PayStory 공유가계부 - 생성</title>

    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
        
    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/main/css/accountBook/public/publicCreate.css">
    <script src="https://kit.fontawesome.com/7031b090f1.js" crossorigin="anonymous"></script>
    
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

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="createBox shadow">
                    <div class="card-header">
                   	<center><h5>공유가계부를 만들어보세요</h5></center>
                   	</div>
                        <form id="createPublicForm" name="createPublicForm" action="<c:url value='/accountBook/public/create/do'/>">
                           	<input id="accountBookTitle" type="text" name="accountBookTitle" class="inputbox" placeholder="제목" size="50">
                            <input id="budgetAmount" type="text" name="budgetAmount" class="inputbox" placeholder="예산(원)" size="50">
                            <input id="participant_list[0]" type="text" name="participant_list[0]" class="inputbox plusbox" placeholder="초대할 이메일주소" size="50">
                            <button type="button" id="plusbtn" class="plusbtn plusbox btn1"><i class="fa-solid fa-plus fa plusImage"></i></button>
                            
                            <div class="clearboth"></div>
                            <div class="choice">
                            <button type="submit" id="submitbtn1" class="btn1">생성</button>
                            </div>
                       </form>
                            <button onclick="location.href='/accountBook/public/main'" id="resetbtn1" class="btn1">취소</button>
                            
                        </div>
               

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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <script src="/main/js/createPublicCheck.js"></script>
    <script src="/main/js/createPublicAccount.js"></script>
    <script type="text/javascript">
    var emailIndex = 0;
    /* var emailList = ['email1']; */
    
    $('.grid').masonry({
   	  // options
   	  itemSelector: '.grid-item',
   	  columnWidth: 200
   	});
    
   /*  function addEmail() {
		alert("test");	
	} */
    
    $('#plusbtn').on('click', function(){
    	emailIndex+=1;
    	$('#listSize').val(emailIndex);
    	
    	$('#plusbtn').before("<input id='participant_list["+emailIndex+"]' type='text' name='participant_list["+emailIndex+"]' class='inputbox plusbox' placeholder='초대할 이메일주소' size='50'>");
    	$('#plusbtn').before("<button type='button' id='delbtn"+emailIndex+"' class='delbtn delbox btn1' onclick='delEmail("+emailIndex+")'><i class='fa-solid fa-xmark delImage'></i></button>");
    	
    	/* emailList.push('email'+emailIndex); */
	});

	function delEmail(index) {
		$("#participant_list\\["+index+"\\]").remove();
		$("#delbtn"+index).remove();
		
	/* 	if(emailIndex > index && $("#participant_list\\["+emailIndex+"\\]")!=NULL){
			$("#participant_list\\["+index+"\\]")=$("#participant_list\\["+emailIndex+"\\]");
			$("#participant_list\\["+emailIndex+"\\]").remove();
			$("#delbtn"+emailIndex).remove();
		} */
			
	}
	
	
    </script>
    
</body>
</html>