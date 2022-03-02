/* 페이지 로드 - 달력 */
function calendarAjax(calendarType, year, month) {
	let firstDay = new Date(year, month, 1).getDay(); // 달의 시작 요일 번호
	let lastDate = new Date(year, month + 1, 0).getDate(); // 달의 마지막 날
	let lastDay = new Date(year, month + 1, 0).getDay(); // 달의 마지막 요일 번호

	let week = (firstDay + lastDate + (6 - lastDay)) / 7;

	$.ajax({
		type: 'post',
		url: "/accountBook/calendar",
		data: {
			"calendarType": calendarType,
			"year": year,
			"month": month + 1,
			"firstDay": firstDay,
			"lastDate": lastDate,
			"lastDay": lastDay,
			"week": week - 1
		},
		success: function(result) {
			$('#calendarDateBox').html(result); // 달력 변경

			$('#yearMonth').text(`${year}년 ${month + 1}월`); // 년-월 텍스트 변경

			dayColor(year, month); // 요일별 색상 지정

			checkToday(); // 오늘 날짜
		},
		error: function() {
			console.log("error");
		}
	});
}