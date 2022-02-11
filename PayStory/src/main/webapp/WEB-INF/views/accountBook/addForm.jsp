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
    <title>Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
    <link href="/main/css/addForm.css" rel="stylesheet">
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

                    <!-- Form Option : 지출 / 수입 -->
                    <div class="d-flex align-items-center justify-content-center mb-4">
                        <ul class="nav nav-pills nav-justified w-50">
						  <li class="nav-item mr-4">
						    <a class="nav-link border border-primary active" data-toggle="tab" href="#expenditure" role="tab">지출</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link border border-primary" data-toggle="tab" href="#income" role="tab">수입</a>
						  </li>
						</ul>
                    </div>
                    
                    <!-- Form panels -->
					<div class="tab-content w-75 m-auto p-4 bg-white rounded">
						<!--지출 Form-->
						<div class="tab-pane fade in show active" id="expenditure" role="tabpanel">
							<form id="expenditureForm" class="my-4">
								<div class="form-row px-3"> 
									<!-- Form 영역 --> 
									<div class="col-md-8"> 
										<!-- 영수증 등록 -->
										<div class="custom-file mb-3"> 
											<label class="custom-file-label" for="uploadReceipt">영수증 등록</label>
											<input type="file" class="custom-file-input shadow-none" id="uploadReceipt">
										</div>
										<!-- 날짜 -->
										<div class="form-group"> 
											<label for="date">날짜</label>
											<input type="date" class="form-control shadow-none" id="date">
										</div>
										<!-- 태그 -->
										<div class="form-group"> 
											<label for="tags">태그</label>
											<select id="tags" class="form-control form-control-sm">
												<option selected>태그를 선택해주세요.</option>
												<option>식품</option>
												<option>용품</option>
												<option>외식</option>
												<option>주거/통신</option>
												<option>교육/문화/미용/건강</option>
												<option>교통/차량</option>
												<option>경조사/용돈 등 사회생활</option>
												<option>저축/보험</option>
												<option>기타</option>
											</select>
										</div>
										<!-- 상호명 -->
										<div class="form-group">
											<label for="expenditureSource">상호명</label>
											<input type="text" class="form-control form-control-sm shadow-none" id="expenditureSource">
										</div>
										<!-- 아이템 1-->
										<div class="form-group form-row">
											<div class="col-sm-8">
												<label for="expenditureItem">내용</label>
												<input type="text" class="form-control form-control-sm shadow-none" id="expenditureItem">
											</div>
											<div class="col-sm-4">
												<label for="expenditureItemAmount">금액</label>
												<input type="text" class="form-control form-control-sm shadow-none" id="expenditureItemAmount">
											</div>
										</div>
										<!-- 아이템 2-->
										<div class="form-group form-row item2">
											<div class="col-sm-8">
												<label for="expenditureItem">내용</label>
												<input type="text" class="form-control form-control-sm shadow-none" id="expenditureItem">
											</div>
											<div class="col-sm-4">
												<label for="expenditureItemAmount">금액</label>
												<input type="text" class="form-control form-control-sm shadow-none" id="expenditureItemAmount">
											</div>
										</div>
										<!-- 총 금액 -->
										<div class="form-group row px-2">
											<label for="expenditureTotalAmount" class="col-sm-8 col-form-label text-right">총 금액</label>
											<div class="col-sm-4">
												<input type="text" readonly class="form-control-plaintext text-right" id="expenditureTotalAmount" value="12,000원">
											</div>
										</div>
										<!-- 메모 -->
										<div class="form-group">
											<label for="expenditureMemo">메모</label>
											<textarea class="form-control shadow-none" id="expenditureMemo" rows="3"></textarea>
										</div>
									</div>
									<!-- 이미지 영역 -->
									<div class="col-md-4 border rounded text-center mb-3">
									</div>
								</div>
								<div class="d-flex align-items-center justify-content-center mt-3">
									<button type="submit" class="btn btn-primary w-25 mr-3">등록</button>
									<button type="reset" class="btn btn-primary w-25">취소</button>
								</div>
							</form>
						</div> <!--  End 지출 Form -->
						
						<!-- 수입 Form -->
						<div class="tab-pane fade px-5" id="income" role="tabpanel">
							<form id="incomeForm" class="my-4">
								<!-- 날짜 -->
								<div class="form-group"> 
									<label for="date">날짜</label>
									<input type="date" class="form-control shadow-none" id="date">
								</div>
								<!-- 태그 -->
								<div class="form-group"> 
									<label for="tags">태그</label>
									<select id="tags" class="form-control">
										<option selected>태그를 선택해주세요.</option>
										<option>급여</option>
										<option>보너스</option>
										<option>사업소득</option>
										<option>금융소득</option>
										<option>기타</option>
									</select>
								</div>
								<!-- 수입원 -->
								<div class="form-group">
									<label for="incomeSource">수입원</label>
									<input type="text" class="form-control shadow-none" id="incomeSource">
								</div>
								<!-- 금액 -->
								<div class="form-group">
									<label for="incomeAmount">금액</label>
									<input type="text" class="form-control shadow-none" id="incomeAmount">
								</div>
								<!-- 메모 -->
								<div class="form-group">
									<label for="expenditureMemo">메모</label>
									<textarea class="form-control shadow-none" id="expenditureMemo" rows="3"></textarea>
								</div>
								<div class="d-flex align-items-center justify-content-center mt-3">
									<button type="submit" class="btn btn-primary w-25 mr-3">등록</button>
									<button type="reset" class="btn btn-primary w-25">취소</button>
								</div>
							</form>							
						</div> <!--  End 수입 Form -->
					</div>
                </div>
			</div>
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <jsp:include page="/WEB-INF/views/layout/logoutModal.jsp" flush="true"/>

    <!-- Bootstrap core JavaScript-->
    <script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/bootstrap/js/sb-admin-2.min.js"></script>
</body>
</html>