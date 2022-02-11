<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Pay Story 가계부 - 수입/지출 내역 추가">
    <meta name="author" content="AourZ">
    <title>수입 | 지출 내역 추가</title>

    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.css" rel="stylesheet">
    <style type="text/css">
    	input:focus,
		input:active {outline: none;}
		textarea {resize: none;}
		.item2 {margin-bottom: 0;}
		.form-row > .col,
		.form-row > [class*="col-"] {
		  padding: 5px;
		}
    </style>
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
										<label for="uploadReceipt">영수증 등록</label>
										<div class="custom-file mb-3"> 
											<input type="file" id="uploadReceipt" class="custom-file-input shadow-none" accept=".png, .jpg, .jpeg, .svg" aria-describedby="uploadReceipt">
											<label class="custom-file-label shadow-none" for="uploadReceipt">파일 선택</label>
										</div>
										<!-- 날짜 -->
										<div class="form-group"> 
											<label for="date">날짜</label>
											<input type="date" class="form-control shadow-none" id="date" required>
										</div>
										<!-- 태그 -->
										<div class="form-group"> 
											<label for="tags">태그</label>
											<select id="tags" class="form-control form-control-sm" required>
												<option selected disabled>태그를 선택해주세요.</option>
												<option value="5">식품</option>
												<option value="6">용품</option>
												<option value="7">외식</option>
												<option value="8">주거/통신</option>
												<option value="9">교육/문화/미용/건강</option>
												<option value="10">교통/차량</option>
												<option value="11">경조사/용돈 등 사회생활</option>
												<option value="12">저축/보험</option>
												<option value="13">기타</option>
											</select>
										</div>
										<!-- 상호명 -->
										<div class="form-group">
											<label for="expenditureSource">상호명</label>
											<input type="text" class="form-control form-control-sm shadow-none" id="expenditureSource" required>
										</div>
										<!-- 아이템 -->
										<div class="form-group form-row">
											<div class="col-sm-8">
												<label for="expenditureItem">내용</label>
												<input type="text" class="form-control form-control-sm shadow-none" id="expenditureItem" required>
											</div>
											<div class="col-sm-4">
												<label for="expenditureItemAmount">금액</label>
												<input type="text" class="form-control form-control-sm shadow-none" id="expenditureItemAmount" required>
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
											<div class="textWrap d-flex align-item-center justify-content-between">
												<label for="expenditureMemo">메모</label>
												<div class="textLength">
													<span class="textCount">0</span>
													<span class="textTotal">/100자</span>
												</div>
											</div>
											<textarea class="memoBox form-control shadow-none" id="expenditureMemo" rows="3" maxlength="100"></textarea>
										</div>
									</div>
									<!-- 이미지 영역 -->
									<div class="col-md-4 border rounded text-center mb-3">
										<img id="receiptImg" />
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
									<input type="date" class="form-control shadow-none" id="date" required>
								</div>
								<!-- 태그 -->
								<div class="form-group"> 
									<label for="tags">태그</label>
									<select id="tags" class="form-control" required>
										<option selected disabled>태그를 선택해주세요.</option>
										<option value="1">급여</option>
										<option value="2">보너스</option>
										<option value="3">사업소득</option>
										<option value="4">금융소득</option>
										<option value="13">기타</option>
									</select>
								</div>
								<!-- 수입원 -->
								<div class="form-group">
									<label for="incomeSource">수입원</label>
									<input type="text" class="form-control shadow-none" id="incomeSource" required>
								</div>
								<!-- 금액 -->
								<div class="form-group">
									<label for="incomeAmount">금액</label>
									<input type="text" class="form-control shadow-none" id="incomeAmount" required>
								</div>
								<!-- 메모 -->
								<div class="form-group">
									<div class="textWrap d-flex align-item-center justify-content-between">
										<label for="expenditureMemo">메모</label>
										<div class="textLength">
											<span class="textCount">0</span>
											<span class="textTotal">/100자</span>
										</div>
									</div>
									<textarea class="memoBox form-control shadow-none" id="expenditureMemo" rows="3" maxlength="100"></textarea>
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
    
    <!-- Page level scripts -->
    <script src="/main/js/addForm.js"></script>
</body>
</html>