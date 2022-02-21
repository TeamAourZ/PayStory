/**
 * mainCalendarAjax.js
 */

/* 페이지 로드 : 달력 */
function loadAjax(jspName) {
	$.ajax({
		url: "/accountBook/" + jspName,
		success: function(result) {
			$('#calendarDateBox').html(result);

			/* 달력 B 스크롤바 생성 */
			if (getWidth() < 620) {
				$('table').eq(0).addClass('table-responsive');
			}

			if (isType == "A") {
				makeCalendarTypeA(nowYear, nowMonth);
			} else {
				makeCalendarTypeB(nowYear, nowMonth);
			}
			checkToday();
		},
		error: function() {
			console.log("error");
		}
	})
}