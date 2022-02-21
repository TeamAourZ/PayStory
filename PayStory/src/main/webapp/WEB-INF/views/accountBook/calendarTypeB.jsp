<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<!-------- CSS : Custom -------->
		<link href="<c:url value='/main/css/accountBook/calendarTypeB.css' />" rel="stylesheet" type="text/css">
		
		<!-------- JS : Custom ------>
		<script src="<c:url value='/main/js/accountBook/calendarTypeB.js' />" type="text/javascript"></script>
	</head>
	<body>
		<div class="table m-0 mt-2">
			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<div class="row">
					<div class="col-sm-12">
						<table class="table mb-0">
							<thead class="daySel">
								<tr class="text-center">
									<th style="width: 14%;">SUN</th>
									<th style="width: 14%;">MON</th>
									<th style="width: 14%;">TUE</th>
									<th style="width: 14%;">WED</th>
									<th style="width: 14%;">THU</th>
									<th style="width: 14%;">FRI</th>
									<th style="width: 14%;">SAT</th>
								</tr>
							</thead>
							<tbody class="dateSel">
								<!-- js -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>