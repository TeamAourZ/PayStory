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
    <title>[가계부] 수입 | 지출 내역 추가</title>

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
                    <!-- Option Button : 지출 / 수입 선택 -->
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
					<div class="tab-content p-4 bg-white rounded">
						<div class="tab-pane fade in show active" id="expenditure" role="tabpanel">
							<!--지출 Form-->
							<form id="expenditureForm" class="my-4">
								<div class="form-row px-3"> 
									<!-- Form 영역 --> 
									<div class="formArea col-lg-8"> 
										<!-- 영수증 등록 -->
										<label for="uploadReceipt">영수증 등록</label>
										<div class="custom-file mb-3"> 
											<input type="file" id="uploadReceipt" name="expenditureImage" class="custom-file-input shadow-none" accept=".png, .jpg, .jpeg, .svg" aria-describedby="uploadReceipt">
											<label class="custom-file-label shadow-none" for="uploadReceipt">파일 선택</label>
										</div>
										<!-- 날짜 -->
										<div class="form-group">
											<label for="date">날짜</label>
											<input type="datetime-local" id="date" name="expenditureDate" class="form-control shadow-none" required>
										</div>
										<!-- 태그 -->
										<div class="form-group">
											<label for="tags">태그</label>
											<select id="tags" name="tagNo" class="form-control form-control-sm shadow-none" required>
												<option selected disabled value="">태그를 선택해주세요.</option>
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
											<input type="text" id="expenditureSource" name="expenditureSource" class="form-control form-control-sm shadow-none" required>
										</div>
										<!-- 아이템 아코디언 -->
										<div class="accordion" id="itemAccordian">
											<div class="card">
												<div class="card-header" id="heading">
													<h2 class="mb-0">
														<button class="showItem btn btn-light btn-block text-left collapsed d-flex justify-content-between shadow-none py-2 px-3" type="button" data-toggle="collapse" data-target="#items" aria-expanded="false" aria-controls="items">
														  상세 항목 
														  <i class="fas fa-angle-down"></i>
														</button>
													</h2>
												</div>
												<div id="items" class="collapse" aria-labelledby="heading" data-parent="#itemAccordian">
													<div class="card-body">
													  	<!-- 아이템 리스트 -->
														<div id="itemWrap">
															<!-- 아이템 -->
															<div class="item default form-group form-row">
																<div class="col-7">
																	<label for="expenditureItem">내용</label>
																	<input type="text" name="expenditureItemName" class="expenditureItem form-control form-control-sm shadow-none" required>
																</div>
																<div class="col-4">
																	<label for="expenditureItemAmount">금액</label>
																	<input type="text" name="expenditureItemPrice" class="expenditureItemAmount form-control form-control-sm shadow-none" required>
																</div>
																<div class="col-1">
																	<button class="removeItem btn shadow-none p-0"><i class="fas fa-minus-circle"></i></button>
																	<!-- <input type="button" class="removeItem btn shadow-none p-0" value="삭제"> -->
																</div>
															</div>
														</div>
														<!-- 아이템 추가 버튼 -->
														<div class="addBtn w-100 d-flex justify-content-center">
															<button id="addItem" class="btn shadow-none"><i class="fas fa-plus-circle"></i></button>
															<!-- <input type="button" id="addItem" class="btn shadow-none" value="추가"> -->
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 총 금액 -->
										<div class="form-group row px-2 mt-2">
											<label for="expenditureTotalAmount" class="col-8 col-form-label text-right">총 금액</label>
											<div class="col-4 d-flex">
												<input type="text" id="expenditureTotalAmount" name="expenditureAmount" class="form-control-plaintext text-right" value="0" readonly>
												<span style="padding: 0.5rem 0;">원</span>
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
											<textarea id="expenditureMemo" name="expenditureMemo" class="memoBox form-control shadow-none" rows="3" maxlength="100"></textarea>
										</div>
									</div>
									<!-- 이미지 영역 -->
									<div id="imgArea" class="col-lg-4 text-center border rounded mb-3">
										<i class="fa fa-image"></i>
										<span class="imgtext">영수증 이미지 미리보기</span>
										<div class="tooltipContent"><p>클릭하여 이미지 크게 보기</p></div>
										<img id="receiptImg" />
									</div>
								</div>
								<div class="d-flex align-items-center justify-content-center mt-3">
									<button type="submit" class="btn btn-primary w-25 mr-3 shadow-none">등록</button>
									<button type="reset" class="btn btn-primary w-25 shadow-none">취소</button>
								</div>
							</form>
						</div> <!--  End 지출 Form -->
						
						<div class="tab-pane fade px-5" id="income" role="tabpanel">
							<!-- 수입 Form -->
							<form id="incomeForm" class="my-4">
								<!-- 날짜 -->
								<div class="form-group"> 
									<label for="date">날짜</label>
									<input type="datetime-local" id="date" name="incomeDate" class="form-control shadow-none" required>
								</div>
								<!-- 태그 -->
								<div class="form-group"> 
									<label for="tags">태그</label>
									<select id="tags" name="tagNo" class="form-control" required>
										<option selected disabled value="">태그를 선택해주세요.</option>
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
									<input type="text" id="incomeSource" name="incomeSource" class="form-control shadow-none" required>
								</div>
								<!-- 금액 -->
								<div class="form-group">
									<label for="incomeAmount">금액</label>
									<input type="text" id="incomeAmount" name="incomeAmount" class="form-control shadow-none" required>
								</div>
								<!-- 메모 -->
								<div class="form-group">
									<div class="textWrap d-flex align-item-center justify-content-between">
										<label for="incomeMemo">메모</label>
										<div class="textLength">
											<span class="textCount">0</span>
											<span class="textTotal">/100자</span>
										</div>
									</div>
									<textarea id="incomeMemo" name="incomeMemo" class="memoBox form-control shadow-none" rows="3" maxlength="100"></textarea>
								</div>
								<div class="d-flex align-items-center justify-content-center mt-3">
									<button type="submit" class="btn btn-primary w-25 mr-3 shadow-none">등록</button>
									<button type="reset" class="btn btn-primary w-25 shadow-none">취소</button>
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
    
    <!-- 영수증 이미지 Modal-->
    <jsp:include page="/WEB-INF/views/accountBook/receiptImageModal.jsp" flush="true"/>

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