<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<body>
		<%--
			태그별 색상 및 차트 호버 색상 리스트 작성해야 함
		 --%>
		<c:choose>
			<c:when test="${chartType eq 'm'}">
				<c:choose>
					<c:when test="${empty dataList}">
						<span>내역이 존재하지 않습니다.</span>
					</c:when>
					<c:otherwise>
						<%-- js에서 사용할 수 있도록 --%>
						<script type="text/javascript">
							var tagList = [];
							var countList = [];
							var sumList = [];
						</script>
						<input type="hidden" id="temp" value="
							<c:forEach var="data" items="${dataList}" varStatus="dataStatus">
								${data.tag}^${data.count}^${data.sum}@
							</c:forEach>
						">
						<script type="text/javascript">
							var firstSplitData = $('#temp').val().replace(/\n*\t/g,'').split('@'); // 필요에 맞게 쪼개기
							
							firstSplitData.pop(); // 마지막 공백 요소 삭제
							
							// 용도에 맞게 합치기
							for (let i = 0; i < firstSplitData.length; i++) {
								let secondSplitData = firstSplitData[i].split('^');
								tagList.push(secondSplitData[0]);
								countList.push(secondSplitData[1]);
								sumList.push(secondSplitData[2]);
							}

							// 삭제
							$('#temp').remove();
						</script>
						
						<div class="chart-pie pt-4 pb-2">
							<canvas id="chartCanvas"></canvas>
						</div>
						<div class="mt-4 text-center small">
							<c:forEach var="data" items="${dataList}" varStatus="dataStatus">
								<span class="">
									<i class="fas fa-circle color-${dataStatus.index}"></i>
									${data.tag}
								</span>
							</c:forEach>
						</div>
						
						<%-------- JS : Custom --------%>
						<script src="<c:url value='/main/js/accountBook/chart.js' />"></script>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${chartType eq 'd'}">
				<c:choose>
					<c:when test="${empty dataList[day - 1]}">
						<span>내역이 존재하지 않습니다.</span><br>
						<span>날짜를 선택해주세요.</span>
					</c:when>
					<c:otherwise>
						<%-- js에서 사용할 수 있도록 --%>
						<script type="text/javascript">
							var tagList = [];
							var countList = [];
							var sumList = [];
						</script>
						<input type="hidden" id="temp" value="
							<c:forEach var="data" items="${dataList[day - 1]}" varStatus="dataStatus">
								${data.tag}/${data.count}/${data.sum}@
							</c:forEach>
						">
						<script type="text/javascript">
							var firstSplitData = $('#temp').val().replace(/\n*\t/g,'').split('@'); // 필요에 맞게 쪼개기
							
							firstSplitData.pop(); // 마지막 공백 요소 삭제
							
							// 용도에 맞게 합치기
							for (let i = 0; i < firstSplitData.length; i++) {
								let secondSplitData = firstSplitData[i].split('/');
								tagList.push(secondSplitData[0]);
								countList.push(secondSplitData[1]);
								sumList.push(secondSplitData[2]);
							}
							
							// 삭제
							$('#temp').remove();
						</script>
						
						<div class="chart-pie pt-4 pb-2">
							<canvas id="chartCanvas"></canvas>
						</div>
						<div class="mt-4 text-center small">
							<c:forEach var="data" items="${dataList[day - 1]}" varStatus="dataStatus">
								<span class="">
									<i class="fas fa-circle color-${dataStatus.index}"></i>
									${data.tag}
								</span>
							</c:forEach>
						</div>
						
						<%-------- JS : Custom --------%>
						<script src="<c:url value='/main/js/accountBook/chart.js' />"></script>
					</c:otherwise>
				</c:choose>
			</c:when>
		</c:choose>
	</body>
</html>