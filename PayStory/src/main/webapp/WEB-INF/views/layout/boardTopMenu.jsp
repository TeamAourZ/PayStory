<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
	    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		   
		   <!-- Topbar Navbar -->
		   <ul class="navbar-nav ml-auto">
		       <!-- Nav Item - 내 가계부 -->
		        <li class="nav-item dropdown no-arrow mx-1">
		           <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
		               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		               <button class="btn btn-outline-secondary">내 가계부</button>
		           </a>
		       </li>  
		
		       <!-- Nav Item - 공용 가계부 -->
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
	</body>
</html>