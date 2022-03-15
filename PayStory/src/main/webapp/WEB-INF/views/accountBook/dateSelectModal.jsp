<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			var curYear = '<%= session.getAttribute("curYear") %>';
			var curMontLastDate = '<%= session.getAttribute("curMontLastDate") %>';
		</script>
	</head>
	<body>
		<div class="modal fade" id="dateSelectModal" tabindex="-1" role="dialog" aria-labelledby="editHistoryModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="dateSelectModalLabel">달력 이동</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body d-flex flex-column flex-gap-2">
						<div class="row">
							<div class="col-12">
								<span id="selectDate">year</span>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div id="dateSelectBox" class="tab-content" id="nav-tabContent">
									<%-- 년 --%>
									<div id="modalYearBox" class="grid-gap-2 text-center tab-pane fade" role="tabpanel">
										<%-- <c:forEach begin="${year - 60}" end="${year + 60}" step="1" varStatus="yearStatus">
											<div class="modalYear">${yearStatus.current}</div>
										</c:forEach> --%>
										<script type="text/javascript">
											curYear = curYear * 1;
											let year = "";
											for (let i = curYear - 60; i < curYear + 60; i++) {
												year += '<div class="modalYear border-color-white pointer-cursor d-none">' + i + '</div>';
											}
											$('#modalYearBox').append(year);
										</script>
									</div>
									
									<%-- 월 --%>
									<div id="modalMonthBox" class="grid-gap-2 text-center tab-pane fade" role="tabpanel" >
										<c:forEach begin="1" end="12" step="1" varStatus="monthStatus">
											<div class="modalMonth border-color-white pointer-cursor d-none">${monthStatus.current}</div>
										</c:forEach>
									</div>
									
									<%-- 일 --%>
									<div id="modalDayBox" class="grid-gap-2 text-center tab-pane fade active show" role="tabpanel">
										<%-- <c:forEach begin="1" end="${lastDate}" step="1" varStatus="dayStatus">
											<div class="modalDay">${dayStatus.current}</div>
										</c:forEach> --%>
										<script type="text/javascript">
											let day = "";
											for (let i = 1; i <= curMontLastDate * 1; i++) {
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
						<button type="button" class="btn btn-primary disabled">이동</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>