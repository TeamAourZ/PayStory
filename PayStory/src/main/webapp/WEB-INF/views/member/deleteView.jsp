<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <title>PayStory 회원탈퇴</title>
	    <!-------- CSS-------->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<link href="<c:url value='/main/css/member/findPw.css'/>" rel="stylesheet" type="text/css">	
	   	
	   	<style type="text/css">.btn-primary{margin-left:191px;}</style>
	   	
	   	<!-- Favicon -->
		<link rel="shortcut icon" href="/main/images/paystory.ico" type="image/x-icon"/>
	   	
	   	<!-------- JS-------->
	   	<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
	   	<script src="<c:url value='/main/js/member/pwUpdateView.js'/>"></script>
	   	<script type="text/javascript">
		$(document).ready(function(){
		
			$("#delete").on("click", function(){
				
				if($("#memberPwd").val()==""){
					alert("비밀번호를 입력해주세요");
					$("#memberPwd").focus();
					return false;
				}
				
				if($("#memberPwd2").val()==""){
					alert("비밀번호 확인을 입력해주세요");
					$("#memberPwd2").focus();
					return false;
				}
				
				if ($("#memberPwd").val() != $("#memberPwd2").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#memberPwd").focus();
					 
					return false;
					}
				
				$.ajax({
					url : "/member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#deleteForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
							}
							
						}
					}
				});
			});
		});
	</script>
	</head>	
		<body class="bg-gradient-primary">
		<div class="container">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">   
						<!-- <div class="row">
						</div> -->
						<div class="col-lg-7"> 
						<div class="p-5">
							<div class="text-center">
						    	<h1 class="h4 text-gray-900 mb-2">PayStory 회원탈퇴</h1>
						        <p class="mb-4">회원탈퇴 확인을 위해 비밀번호를 입력해주세요.</p>
						    </div>
						    <form action="/member/delete" method="post" id="deleteForm" name="deleteForm">
						    <input type="hidden" id="memberEmail" name="memberEmail" value="${login.memberEmail}">
						        <div class="form-group">
						            <input type="password" class="form-control form-control-user"
						                name="memberPwd" id="memberPwd" placeholder="비밀번호">
						        </div>
						        
						        <div class="form-group">
						            <input type="password" class="form-control form-control-user"
						                name="memberPwd2" id="memberPwd2" placeholder="비밀번호 확인">
						        </div>
						         <button type="button" id="delete" name="delete" class="btn btn-primary">회원탈퇴</button> 
						         <a href="<c:url value='/accountBook/myMain'/>" class="btn btn-default">취소</a>
						    </form>    
						</div>
					</div>
				 </div>		
			</div>
		</div>			  
			
			<!-------- JS : Bootstrap, Custom -------->
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
		<script src="<c:url value='/bootstrap/vendor/chart.js/Chart.min.js' />"></script>	
		         
		</body>
</html>