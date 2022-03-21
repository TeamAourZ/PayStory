<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="Pay Story 가계부 - 수입/지출 내역 추가">
		<meta name="author" content="AourZ">
		<title>[가계부] 수입 | 지출 내역 추가</title>
		
		<!-- CSS : Bootstrap -->
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<link href="<c:url value='/bootstrap/css/sb-admin-2.css'/>" rel="stylesheet">
		
		<!-- CSS : Main -->
		<link href="<c:url value='/main/css/accountBook/addItemForm.css'/>" rel="stylesheet">
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="/main/images/paystory.ico" type="image/x-icon"/>
		
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js'/>"></script>

		<script type="text/javascript">
			var accountBookNo = '<%= session.getAttribute("accountBookNo") %>';
		</script>
	</head>
	<body id="page-top">
		<!-- Page Wrapper -->
		<div id="wrapper">
			
			<!-- Side Bar -->
			<jsp:include page="/WEB-INF/views/layout/sideMenu.jsp" flush="true" />
			
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				
				<!-- Main Content -->
				<div id="content">
					
					<!-- Top Menu Bar  -->
					<jsp:include page="/WEB-INF/views/layout/topMenu.jsp" flush="true" />
						
					<!-- Begin Page Content -->
					<div class="container-fluid">
						<%-- 내역 수정을 통해 진입 시 지출 / 수입 선택 불가 --%>
						<c:if test="${not isEdit}">
							<!-- Option Button : 지출 / 수입 선택 -->
							<div id="navTabBox" class="d-flex align-items-center justify-content-center mb-4">
								<ul class="nav nav-pills nav-justified w-50">
									<li class="nav-item mr-4">
										<a class="nav-link border border-primary active" data-toggle="tab" href="#expenditure" role="tab">지출</a>
									</li>
									<li class="nav-item">
										<a class="nav-link border border-primary" data-toggle="tab" href="#income" role="tab">수입</a>
									</li>
								</ul>
							</div>
						</c:if>
						
						<!-- Form panels -->
						<div class="tab-content p-4 bg-white rounded">
							<div class="tab-pane fade in show active" id="expenditure" role="tabpanel">
								<!--지출 Form-->
								<form id="expenditureForm" class="my-4">
									<div class="form-row px-3 position-relative">
										<!-- Loading Spinner --> 
										<div class="ajaxSpinner">
											<div>
												<h3>영수증을 인식하고 있습니다.</h3>
												<h3>잠시만 기다려주세요.</h3>
												<img src="<c:url value='/main/images/spinner.gif' />" class="spinner" />
											</div>
										</div>
										<!-- Form 영역 -->
										<div class="formArea col-lg-8">
											<!-- 영수증 등록 -->
											<label for="uploadReceipt">영수증 등록</label>
											<div class="custom-file mb-3">
												<input type="hidden" id="imageValue"/>
												<input type="file" id="uploadReceipt" name="expenditureImage"
														class="custom-file-input shadow-none" accept=".png, .jpg, .jpeg, .svg" aria-describedby="uploadReceipt">
												<label class="custom-file-label shadow-none" for="uploadReceipt">파일 선택</label>
											</div>
											<!-- isShared : hidden -->
											<input type="hidden" id="isShared" value="${ sessionScope.isShared }">
											<!-- 날짜 -->
											<div class="form-group">
												<label for="expenditureDate">날짜</label>
												<input type="datetime-local" id="expenditureDate" name="expenditureDate" class="form-control shadow-none" required>
												<%-- 대시보드 메인 - 달력에서 날짜 선택 후 + 버튼 눌렀을 때 --%>
												<c:if test="${not empty dateTime}">
													<input type="hidden" id="temp" value="${dateTime}">
													<script type="text/javascript">
														$('#expenditureDate').val($('#temp').val());
														$('#temp').remove(); // 삭제
													</script>
												</c:if>
											</div>
											<!-- 태그 -->
											<div class="form-group">
												<label for="expenditureTags">태그</label>
												<select id="expenditureTags" name="tagNo" class="form-control form-control-sm shadow-none" required>
													<option selected disabled value="">태그를 선택해주세요.</option>
													<option value="t01">식품</option>
													<option value="t02">용품</option>
													<option value="t03">외식</option>
													<option value="t04">주거/통신</option>
													<option value="t05">교육/문화/미용/건강</option>
													<option value="t06">교통/차량</option>
													<option value="t07">경조사/용돈 등 사회생활</option>
													<option value="t08">저축/보험</option>
													<option value="t99">기타</option>
												</select>
											</div>
											<!-- 상호명 -->
											<div class="form-group">
												<label for="expenditureSource">상호명</label>
												<input type="text" id="expenditureSource" name="expenditureSource" class="form-control form-control-sm shadow-none" required>
												<c:if test="${not empty source}">
													<input type="hidden" id="temp" value="${source}">
													<script type="text/javascript">
														$('#expenditureSource').val($('#temp').val());
														$('#temp').remove(); // 삭제
													</script>
												</c:if>
											</div>
											<!-- 주소 -->
											<div class="form-group">
												<label for="expenditureAddress">주소</label>
												<input type="text" id="expenditureAddress" name="expenditureAddress" class="form-control form-control-sm shadow-none">
												<c:if test="${not empty address}">
													<input type="hidden" id="temp" value="${address}">
													<script type="text/javascript">
														$('#expenditureAddress').val($('#temp').val());
														$('#temp').remove(); // 삭제
													</script>
												</c:if>
											</div>
											<!-- 아이템 아코디언 -->
											<div class="accordion" id="itemAccordian">
												<div class="card">
													<div class="card-header" id="heading">
														<h2 class="mb-0">
															<button class="showItem btn btn-light btn-block text-left collapsed d-flex justify-content-between shadow-none py-2 px-3"
																		type="button" data-toggle="collapse" data-target="#items" aria-expanded="false" aria-controls="items">
																상세 항목
																<i class="fas fa-angle-up"></i>
															</button>
														</h2>
													</div>
													<div id="items" class="collapse show" aria-labelledby="heading" data-parent="#itemAccordian">
														<div class="card-body">
															<!-- 아이템 리스트 -->
															<div id="itemWrap">
																<!-- 아이템 -->
																<div class="item default form-group form-row">
																	<div class="col-7">
																		<label for="expenditureItem">내용</label>
																		<input type="text" id= "expenditureItemName" name="expenditureItemName" class="expenditureItem form-control form-control-sm shadow-none">
																		<c:if test="${not empty itemsList}">
																			<c:forEach var="items" items="${itemsList}">
																				<input type="text" id="temp" value="${items.expenditureItemName}">
																				<script type="text/javascript">
																					$('#expenditureItemName').val($('#temp').val());
																					$('#temp').remove(); // 삭제
																				</script>
																			</c:forEach>
																		</c:if>
																	</div>
																	<div class="col-4">
																		<label for="expenditureItemAmount">금액</label>
																		<input type="text" id= "expenditureItemPrice" name="expenditureItemPrice" class="expenditureItemAmount form-control form-control-sm shadow-none">
																		<c:if test="${not empty itemsList}">
																			<c:forEach var="items" items="${itemsList}">
																				<input type="hidden" id="temp" value="${items.expenditureItemPrice}">
																				<script type="text/javascript">
																					$('#expenditureItemPrice').val($('#temp').val());
																					$('#temp').remove(); // 삭제
																				</script>
																			</c:forEach>
																		</c:if>
																	</div>
																	<div class="col-1">
																		<button class="removeItem btn shadow-none p-0">
																			<i class="fas fa-minus-circle"></i>
																		</button>
																		<!-- <input type="button" class="removeItem btn shadow-none p-0" value="삭제"> -->
																	</div>
																</div>
																<c:if test="${isEdit && (fn:length(expenditureItemList) - 1 gt 0)}">
																	<c:forEach begin="0" end="${fn:length(expenditureItemList) - 2}" step="1">
																		<div class="item form-group form-row" id="newItem">
																			<div class="col-7">
																				<input type="text" class="expenditureItem form-control form-control-sm shadow-none">
																			</div>
																			<div class="col-4">
																				<input type="text" class="expenditureItemAmount form-control form-control-sm shadow-none">
																			</div>
																			<div class="col-1">
																				<button class="removeItem btn shadow-none p-0">
																					<i class="fas fa-minus-circle"></i>
																				</button>
																			</div>
																		</div>
																	</c:forEach>
																</c:if>
															</div>
															<!-- 아이템 추가 버튼 -->
															<div class="addBtn w-100 d-flex justify-content-center">
																<button id="addItem" class="btn shadow-none">
																	<i class="fas fa-plus-circle"></i>
																</button>
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
													<c:if test="${not empty totalAmount}">
														<input type="hidden" id="temp" value="${totalAmount}">
														<script type="text/javascript">
															$('#expenditureTotalAmount').val($('#temp').val());
															$('#temp').remove(); // 삭제
														</script>
													</c:if>
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
											<div class="tooltipContent">
												<p>클릭하여 이미지 크게 보기</p>
											</div>
											<img id="receiptImg" />
											<c:if test="${(isEdit && not empty expenditure.expenditureImage) || not empty image}">
												<c:choose>
													<c:when test="${not empty expenditure.expenditureImage}">
														<input type="hidden" id="receiptImage" value="${expenditure.expenditureImage}">
													</c:when>
													<c:when test="${not empty image}">
														<input type="hidden" id="receiptImage" value="${image}">
													</c:when>
												</c:choose>
												
												<script type="text/javascript">
													$('#receiptImg').attr('src', '/images/receipt/' + accountBookNo + '/' + $('#receiptImage').val()).css('width', '100%').css('height', '95%'); // 이미지 삽입
													$('#imgArea').addClass('hasImage');
													$('.hasImage').attr({
														'data-toggle': 'modal',
														'data-target': '#receiptModal'
													}); // 이미지 영역 속성 변경
													$('#imageValue').val($('#receiptImage').val());
													$('#receiptImage').remove(); // 삭제
												</script>
											</c:if>
										</div>
									</div>
									<div class="d-flex align-items-center justify-content-center mt-3">
										<button type="submit" id="expenditureSubmitBtn" class="btn btn-primary w-25 mr-3 shadow-none">등록</button>
										<button type="button" class="cancelBtn btn btn-primary w-25 shadow-none">취소</button>
									</div>
								</form>
							</div>
							<!--  End 지출 Form -->
							
							<div class="tab-pane fade px-5" id="income" role="tabpanel">
								<!-- 수입 Form -->
								<form id="incomeForm" class="my-4">
									<!-- isShared : hidden -->
									<input type="hidden" id="isShared" value="${ sessionScope.isShared }">
									<!-- 날짜 -->
									<div class="form-group">
										<label for="incomeDate">날짜</label>
										<input type="datetime-local" id="incomeDate" name="incomeDate" class="form-control shadow-none" required>
										<%-- 대시보드 메인 - 달력에서 날짜 선택 후 + 버튼 눌렀을 때 --%>
										<c:if test="${not empty dateTime}">
											<input type="hidden" id="temp" value="${dateTime}">
											<script type="text/javascript">
												$('#incomeDate').val($('#temp').val());
												$('#temp').remove(); // 삭제
											</script>
										</c:if>
									</div>
									<!-- 태그 -->
									<div class="form-group">
										<label for="incomeTags">태그</label>
										<select id="incomeTags" name="tagNo" class="form-control" required>
											<option selected disabled value="">태그를 선택해주세요.</option>
											<option value="t51">급여</option>
											<option value="t52">보너스</option>
											<option value="t53">사업소득</option>
											<option value="t54">금융소득</option>
											<option value="t99">기타</option>
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
										<button type="submit" id="incomeSubmitBtn" class="btn btn-primary w-25 mr-3 shadow-none">등록</button>
										<button type="button" class="cancelBtn btn btn-primary w-25 shadow-none">취소</button>
									</div>
								</form>
							</div>
							<!--  End 수입 Form -->
						</div>
					</div>
				</div>
			</div>
			<!-- End of Content Wrapper -->
		</div>
		<!-- End of Page Wrapper -->
		
		<%-- ajax 제어용 --%>
		<input type="hidden" id="isEdit" value="${isEdit}"> <%-- 수정 유무 --%>
		<input type="hidden" id="condition" value="${condition}"> <%-- 수정 유무 --%>
		
		<%-- 내역 수정 --%>
		<c:if test="${isEdit}">
			<c:choose>
				<c:when test="${condition eq 'income'}">
					<%-- 내역 수정을 위한 원본 데이터 : 수입 --%>
					<div id="hiddenIncomeData">
						<input type="hidden" value="${fn:substring(income.incomeDate, 0, 16)}"> <%-- 날짜 --%>
						<input type="hidden" value="${income.tagNo}"> <%-- 태그 --%>
						<input type="hidden" value="${income.incomeSource}"> <%-- 수입원 --%>
						<input type="hidden" value="${income.incomeAmount}"> <%-- 금액 --%>
						<input type="hidden" value="${income.incomeMemo}"> <%-- 메모 --%>
						<input type="hidden" value="${income.incomeNo}"> <%-- 수입 번호 --%>
					</div>
					<%-- 원본 데이터 반영 --%>
					<script type="text/javascript">
						$('#incomeSubmitBtn').text("수정"); // submit 버튼 텍스트 내용 수정
						
						/* 탭 전환 */
						$('#navTabBox ul').children('li:first-child a').removeClass('active');
						$('#navTabBox ul').children('li:last-child a').addClass('active');
						$('#expenditureForm').parent().removeClass('active show');
						$('#incomeForm').parent().addClass('active show');
						
						/* 반영 */
						let date = $('#hiddenIncomeData').children('input').eq(0).val();
						date = date.replace(' ', 'T');
						$('#incomeDate').val(date); // 날짜
						
						$('#incomeTags').val($('#hiddenIncomeData').children('input').eq(1).val()); // 태그
						$('#incomeSource').val($('#hiddenIncomeData').children('input').eq(2).val()); // 수입원
						$('#incomeAmount').val($('#hiddenIncomeData').children('input').eq(3).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')); // 금액
						$('#incomeMemo').val($('#hiddenIncomeData').children('input').eq(4).val()); // 메모
					</script>
				</c:when>
				<c:when test="${condition eq 'expenditure'}">
					<%-- 내역 수정을 위한 원본 데이터 : 지출 --%>
					<div id="hiddenExpenditureData">
						<input type="hidden" value="${fn:substring(expenditure.expenditureDate, 0, 16)}"> <%-- 날짜 --%>
						<input type="hidden" value="${expenditure.tagNo}"> <%-- 태그 --%>
						<input type="hidden" value="${expenditure.expenditureSource}"> <%-- 상호명 --%>
						<input type="hidden" value="${expenditure.expenditureAddress}"> <%-- 주소 --%>
						<c:set var="expenditureItemNameList" value="" />
						<c:set var="expenditureItemPriceList" value="" />
						<c:forEach var="item" items="${expenditureItemList}">
							<c:set var="expenditureItemNameList" value="${expenditureItemNameList}━${item.expenditureItemName}" />
							<c:set var="expenditureItemPriceList" value="${expenditureItemPriceList}━${item.expenditureItemPrice}" />
						</c:forEach>
						<input type="hidden" value="${expenditureItemNameList}"> <%-- 상세 항목 : 이름 --%>
						<input type="hidden" value="${expenditureItemPriceList}"> <%-- 상세 항목 : 금액 --%>
						<input type="hidden" value="${fn:length(expenditureItemList)}"> <%-- 상세 항목 길이 --%>
						<input type="hidden" value="${expenditure.expenditureAmount}"> <%-- 총 합계 --%>
						<input type="hidden" value="${expenditure.expenditureMemo}"> <%-- 메모 --%>
						<input type="hidden" value="${expenditure.expenditureNo}"> <%-- 지출 번호 --%>
					</div>
					<%-- 원본 데이터 반영 --%>
					<script type="text/javascript">
						$('#expenditureSubmitBtn').text("수정"); // submit 버튼 텍스트 내용 수정
						
						/* 반영 */
						let date = $('#hiddenExpenditureData').children('input').eq(0).val();
						date = date.replace(' ', 'T');
						$('#expenditureDate').val(date); // 날짜
						
						$('#expenditureTags').val($('#hiddenExpenditureData').children('input').eq(1).val()); // 태그
						$('#expenditureSource').val($('#hiddenExpenditureData').children('input').eq(2).val()); // 상호명
						$('#expenditureAddress').val($('#hiddenExpenditureData').children('input').eq(3).val()); // 주소
						$('#expenditureTotalAmount').val($('#hiddenExpenditureData').children('input').eq(7).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')); // 총 합계
						$('#expenditureMemo').val($('#hiddenExpenditureData').children('input').eq(8).val()); // 메모
						
						let nameList = $('#hiddenExpenditureData').children('input').eq(4).val().split('━'); // 상세 항목 이름
						nameList.shift(); // 맨 앞 요소 꺼내기 (삭제)
						let priceList = $('#hiddenExpenditureData').children('input').eq(5).val().split('━'); // 상세 항목 금액
						priceList.shift(); // 맨 앞 요소 꺼내기 (삭제)
						
						/* 상세 항목 반영 */
						for (let i = 0; i < $('#hiddenExpenditureData').children('input').eq(6).val(); i++) {
							$('.expenditureItem').eq(i).val(nameList.shift());
							$('.expenditureItemAmount').eq(i).val(priceList.shift().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
						}
						
						let sum = 0;
						$('.expenditureItemAmount').each(function() {
							let itemAmount = $(this).val();
							if (itemAmount) {
								sum += parseInt(itemAmount.toString().replace(/,/g, ''));
							}
						});
						if ($('#hiddenExpenditureData').children('input').eq(6).val() != 0) {
							$('#expenditureTotalAmount').val(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
						} else {
							setTimeout(() => $('.showItem').click(), 100); // 상세 내역 접기
						}
					</script>
				</c:when>
			</c:choose>
		</c:if>
		
		<!-- 영수증 이미지 Modal-->
		<jsp:include page="/WEB-INF/views/accountBook/modal/receiptImageModal.jsp" flush="true" />
		
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top">
			<i class="fas fa-angle-up"></i>
		</a>
		
		<!-- Logout Modal-->
		<jsp:include page="/WEB-INF/views/layout/logoutModal.jsp" flush="true" />
		
		<!-- JS : Bootstrap -->
		<script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
		<script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
		<script src="<c:url value='/bootstrap/js/sb-admin-2.min.js'/>"></script>
		
		<!-- JS : Main -->
		<script src="<c:url value='/main/js/accountBook/addItemForm.js'/>"></script>
	</body>
</html>