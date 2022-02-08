<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Custom fonts for this template-->
	    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&display=swap"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
	</head>
	<body>
		<!-- Topbar -->
	    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		   
		   <!-- Topbar Navbar -->
		   <ul class="navbar-nav ml-auto">
		
		       <!-- Nav Item - Search Dropdown (Visible Only XS) -->
		       <li class="nav-item dropdown no-arrow d-sm-none">
		           <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
		               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		               <i class="fas fa-search fa-fw"></i>
		           </a>
		           <!-- Dropdown - Messages -->
		           <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
		               aria-labelledby="searchDropdown">
		               <form class="form-inline mr-auto w-100 navbar-search">
		                   <div class="input-group">
		                       <input type="text" class="form-control bg-light border-0 small"
		                           placeholder="Search for..." aria-label="Search"
		                           aria-describedby="basic-addon2">
		                       <div class="input-group-append">
		                           <button class="btn btn-primary" type="button">
		                               <i class="fas fa-search fa-sm"></i>
		                           </button>
		                       </div>
		                   </div>
		               </form>
		           </div>
		       </li>
		
		       <!-- Nav Item - My Account -->
		       <li class="nav-item dropdown no-arrow mx-1">
		           <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
		               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		              <button class="btn btn-outline-secondary">내 가계부</button>
		           </a>
		        </li>   
		
		       <!-- Nav Item - Public Account -->
		       <li class="nav-item dropdown no-arrow mx-1">
		           <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
		               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		               <button class="btn btn-outline-secondary">공유 가계부</button>
		           </a>
		       </li>
			   
			   <!-- Nav Item - divider -->
		       <div class="topbar-divider d-none d-sm-block"></div>
		
		       <!-- Nav Item - User Information -->
		       <li class="nav-item dropdown no-arrow">
		           <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
		               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		               <!-- userName -->
		               <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
		               <!-- userImg -->
		               <img class="img-profile rounded-circle"
		                   src="/bootstrap/img/undraw_profile.svg">
		           </a>
		           <!-- Dropdown - User Information -->
		            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
		                aria-labelledby="userDropdown">
		                <a class="dropdown-item" href="#">
		                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
		                    Profile
		                </a>
		                <a class="dropdown-item" href="#">
		                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
		                    Settings
		                </a>
		                <a class="dropdown-item" href="#">
		                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
		                    Activity Log
		                </a>
		                <div class="dropdown-divider"></div>
		                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
		                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
		                    Logout
		                </a>
		            </div>
		        </li>
		    </ul>
		</nav>
		<!-- End of Topbar -->
                
		<!-- Bootstrap core JavaScript-->
		<script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
		<script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		<!-- Core plugin JavaScript-->
		<script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		<!-- Custom scripts for all pages-->
		<script src="/bootstrap/js/sb-admin-2.min.js"></script>
	</body>
</html>