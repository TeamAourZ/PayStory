<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PayStory 게시글 작성</title>
		<!-------- CSS : Bootstrap -------->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/board/newBoardForm.css' />" rel="stylesheet" type="text/css">
		
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
	</head>
	<body>
		<div id="wrapper">

       <!-- Side Bar -->
       <jsp:include page="/WEB-INF/views/layout/sideMenu.jsp"  flush="true" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
				<!-- Top Menu Bar  -->
                <jsp:include page="/WEB-INF/views/layout/topMenu.jsp" flush="true" />

                <!-- Begin Page Content -->
                <div class="container-fluid">
                	<!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800 ml-5">게시글 작성</h1>
                    
                    <!-- 게시글 작성 form -->
					<div class="formWrap p-4 bg-white rounded">
						<form id="newBoardForm" class="px-4">
		              		<div class="form-row">
		              			<!-- 제목 -->
			              		<div class="form-group col-8">
			              			<label>제목</label>
			              			<input class="title form-control shadow-none" name="boardTitle">
			              		</div>
			              		<!-- 카테고리 -->
			              		<div class="form-group col-4">
				              		<label>카테고리</label>
				              		<select id="boardCategoryNo" name="boardCategoryNo" class="form-control shadow-none" required>
										<option selected disabled value="">카테고리를 선택해주세요.</option>
										<c:if test="${ sessionScope.memberRank eq '3' }">
											<option value="bc001">공지사항</option>
										</c:if>
										<option value="bc002">질문</option>
										<option value="bc003">정보공유</option>
										<option value="bc004">자유게시판</option>
									</select>
				              	</div>
		              		</div>
			              	<!-- 첨부파일 -->
			              	<label for="uploadFile">첨부 파일</label>
							<div class="custom-file mb-3"> 
								<input type="file" id="uploadFile" name="boardFile" class="custom-file-input shadow-none" accept=".png, .jpg, .jpeg, .svg" aria-describedby="uploadFile">
								<label class="custom-file-label shadow-none" for="uploadFile">파일 선택</label>
							</div>
			              	<!-- 내용 -->
		              		<div class="form-group">
			              		<label>내용</label>
			              		<textarea class="content form-control shadow-none" rows="10" name="boardContents"></textarea>
			              	</div>
			              	<div class="d-flex align-items-center justify-content-center mt-3">
								<button type="submit" class="btn btn-primary w-25 mr-3 shadow-none">등록</button>
								<button type="button" class="listBtn btn btn-primary w-25 shadow-none">취소</button>
							</div>
	              		</form>
					</div>
                </div>
			</div>
        </div>
        <!-- End of Content Wrapper -->
    </div>


	<!-------- JS : Bootstrap -------->
	<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
	<script src="<c:url value='/bootstrap/vendor/chart.js/Chart.min.js' />"></script>

	<!-------- JS : Custom -------->
	<script src="<c:url value='/main/js/board/newBoardForm.js' />"></script>
</body>
</html>