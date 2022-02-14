<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<body>
		<!-- Card Body -->
		<div id="calendarBtnBox" class="d-flex justify-content-between mt-1 mr-3 ml-3">
			<div id="prevNextBox" class="d-flex justify-content-between align-items-center">
				<i id="prevMonthBtn" class="fas fa-angle-left fa-2x m-1"></i>
				<span id="yearMonth" class="text-lg font-weight-bold mr-3 ml-3"></span>
				<i id="nextMonthBtn" class="fas fa-angle-right fa-2x m-1"></i>
			</div>
			<div id="otherBtnBox" class="d-flex flex-column align-items-end">
				<div>
					<i id="selectDayAddDataBtn" class="fas fa-plus fa-2x m-1"></i>
					<i id="todayBtn" class="far fa-calendar fa-2x m-1"></i>
				</div>
				<div>
					<i class="far fa-circle" style="color: #2768fa;"> : 수입</i>&nbsp;
					<i class="far fa-circle" style="color: #ffb500;"> : 지출</i>
				</div>
			</div>
		</div>
		<div id="dateBox" class="m-2">
			<div class="daySel mb-2 mr-1">
				<div>SUN</div>
				<div>MON</div>
				<div>TUE</div>
				<div>WED</div>
				<div>THU</div>
				<div>FRI</div>
				<div>SAT</div>
			</div>
			<div class="dateSelB">
			</div>
		</div>
	</body>
</html>