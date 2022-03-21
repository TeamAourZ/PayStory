<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<script src="<c:url value='/main/js/accountBook/modal/dateSelectModal.js' />" type="text/javascript"></script>
	</head>
	<body>
		<div class="modal fade" id="dateSelectModal" tabindex="-1" role="dialog" aria-labelledby="dateSelectModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 id="dateSelectModalLabel" class="modal-title font-weight-bold text-primary text-lg">달력 이동</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body d-flex flex-column flex-gap-1">
						<span id="selectDate" class="text-lg font-weight-bold pointer-cursor"></span>
						<div class="row">
							<div class="col-12">
								<div id="dateSelectBox" class="tab-content" id="nav-tabContent">
									<%-- 년 --%>
									<div id="yearScrollSpy" class="d-none">
										<a id="move" href="#nowYear"></a>
									</div>
									<div id="modalYearBox" class="grid-gap-2 text-center tab-pane fade active show" role="tabpanel"
										data-spy="scroll" data-target="#yearScrollSpy" data-offset="0">
										<script type="text/javascript">
											let year = "";
											let condition = 27;
											for (let i = nowYear - condition; i < nowYear + condition; i++) {
												year += '<div class="modalYear border-color-white pointer-cursor">' + i + '</div>';
											}
											$('#modalYearBox').append(year);
										</script>
									</div>
									
									<%-- 월 --%>
									<div id="modalMonthBox" class="grid-gap-2 text-center tab-pane fade d-none" role="tabpanel" >
										<c:forEach begin="1" end="12" step="1" varStatus="monthStatus">
											<div class="modalMonth border-color-white pointer-cursor">${monthStatus.current}</div>
										</c:forEach>
									</div>
									
									<%-- 일 --%>
									<div id="modalDayBox" class="grid-gap-2 text-center tab-pane fade d-none" role="tabpanel">
										<script type="text/javascript">
											let day = "";
											for (let i = 1; i <= lastDate; i++) {
												day += '<div class="modalDay border-color-white pointer-cursor">' + i + '</div>';
											}
											$('#modalDayBox').append(day);
										</script>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="dateMoveBtn" class="btn btn-danger disabled" disabled="true" data-dismiss="modal">이동</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(function() {
				/* 년월 클릭 시 */
				$('#yearMonth').on('click', () => {
					/* 현재 년도 스크롤 이동 */
					setTimeout(() => $('#move').get(0).click(), 200);
				});
			});
		</script>
	</body>
</html>