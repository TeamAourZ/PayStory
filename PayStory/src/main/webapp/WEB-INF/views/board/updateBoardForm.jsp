<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PayStory 게시글 수정</title>
		<!-------- CSS : Bootstrap -------->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css' />" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/board/updateBoardForm.css' />" rel="stylesheet" type="text/css">
	</head>
	<body>
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
                    <h1 class="h3 mb-2 text-gray-800 ml-5">게시글 수정</h1>
                    
					<!-- 게시글 form  -->
					<c:if test="${ not empty board }">
						<div class="formWrap p-4 bg-white rounded">
							<form id="updateBoardForm" class="px-4">
								<!-- boardNo -->
								<input type="hidden" class="boardNo" value="${ board.boardNo }" />
			              		<div class="form-row">
			              			<!-- 제목 -->
				              		<div class="form-group col-8">
				              			<label>제목</label>
				              			<input class="title form-control shadow-none" name="boardTitle" value="${ board.boardTitle }">
				              		</div>
				              		<div class="form-group col-4">
					              		<label>카테고리</label>
					              		<select id="boardCategoryNo" name="boardCategoryNo" class="form-control shadow-none" required>
											<c:choose>
												<c:when test="${ board.boardCategoryNo eq 'bc002' }">
													<option disabled value="">카테고리를 선택해주세요.</option>
													<option selected value="bc002">질문</option>
													<option value="bc003">정보공유</option>
													<option value="bc004">자유게시판</option>
												</c:when>
												<c:when test="${ board.boardCategoryNo eq 'bc003' }">
													<option disabled value="">카테고리를 선택해주세요.</option>
													<option value="bc002">질문</option>
													<option selected value="bc003">정보공유</option>
													<option value="bc004">자유게시판</option>
												</c:when>
												<c:when test="${ board.boardCategoryNo eq 'bc004' }">
													<option disabled value="">카테고리를 선택해주세요.</option>
													<option value="bc002">질문</option>
													<option value="bc003">정보공유</option>
													<option selected value="bc004">자유게시판</option>
												</c:when>
												<c:otherwise>
													<option selected disabled value="">카테고리를 선택해주세요.</option>
													<option value="bc002">질문</option>
													<option value="bc003">정보공유</option>
													<option value="bc004">자유게시판</option>
												</c:otherwise>
											</c:choose>
										</select>
					              	</div>
			              		</div>
				              	<!-- 첨부파일 -->
				              	<label for="uploadFile">첨부 파일</label>
								<div class="custom-file mb-3"> 
									<input type="file" id="uploadFile" name="boardFile" class="custom-file-input shadow-none" accept=".png, .jpg, .jpeg, .svg" aria-describedby="uploadFile">
									<label class="custom-file-label shadow-none" for="uploadFile">파일 선택</label>
								</div>
								<c:if test="${ not empty board.boardFile }">
									<input type="hidden" class="boardFileInDB" value="${board.boardFile}"/>
				              		<div class="card">
									  <img src="/images/board/${board.memberNo}/${board.boardFile}" class="card-img">
									  <div class="card-img-overlay">
									  	<i class="deleteBtn hidden fa far fa-times-circle" data-toggle="tooltip" data-placement="bottom" title="삭제"></i>
									  </div>
									</div>
				              	</c:if>
				              	<!-- 내용 -->
			              		<div class="form-group">
				              		<label>내용</label>
				              		<textarea class="content form-control shadow-none" rows="10" name="content">${board.boardContents}</textarea>
				              	</div>
				              	<div class="d-flex align-items-center justify-content-center mt-3">
									<button type="submit" class="btn btn-primary w-25 mr-3 shadow-none">수정</button>
									<button type="reset" class="listBtn btn btn-primary w-25 shadow-none">취소</button>
								</div>
		              		</form>
						</div>
					</c:if>
                </div>
			</div>
        </div>
        <!-- End of Content Wrapper -->
    </div>


	<!-------- JS : Bootstrap -------->
	<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js' />"></script>
	<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js' />"></script>
	<script src="<c:url value='/bootstrap/vendor/chart.js/Chart.min.js' />"></script>

	<!-------- JS : Custom -------->
	<script src="<c:url value='/main/js/board/updateBoardForm.js' />"></script>
</body>
</html>