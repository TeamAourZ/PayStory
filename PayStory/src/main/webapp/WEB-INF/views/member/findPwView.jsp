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
	    <title>PayStory 비밀번호찾기</title>
	    <!-- Custom fonts for this template-->
	   <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="<c:url value='/main/css/member/findPw.css'/>" rel="stylesheet" type="text/css">
	</head>
	
	
	<script type="text/javascript">

	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}

	</script>
	
<body class="bg-gradient-primary">
<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">   
				<!-- <div class="row">
				</div> -->
				<div class="col-lg-7"> 
				<div class="p-5">
					<div class="text-center">
				    	<h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
				        <p class="mb-4">닉네임과 이메일을 입력해주세요!</p>
				    </div>
				    <form class="user" action="/member/findPw" method="post">
				       <div class="form-group">
				            <input type="text" class="form-control form-control-user"
				                id="memberName" aria-describedby="IdHelp" name="memberName"
				                placeholder="가입하신 닉네임을 기입해주세요">
				        </div>
				        <div class="form-group">
				            <input type="email" class="form-control form-control-user"
				                id="memberEmail" aria-describedby="emailHelp" name="memberEmail"
				                placeholder="가입하신 이메일을 기입해주세요">
				        </div>
				         
				        <button type="submit" class="btn btn-primary btn-user btn-block">
				            비밀번호 찾기
				        </button>
				    </form>
				    <hr>
				    <a href="/member/loginView" class="btn btn-google btn-user btn-block">
				     로그인
				    </a>
				    <hr>
				    <div class="text-center">
				    	<a class="small" href="<c:url value='/index'/>">메인페이지</a>
				    </div>
				</div>
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
    <script src="/bootstrap/js/sb-admin-2.min.js"></script>
         
</body>
</html>