/* 페이지 로드 - 차트 */
function chartAjax(year, month, day) {
	let lastDate = new Date(year, month + 1, 0).getDate(); // 달의 마지막 날

	let chartType = $('#chartType').val(); // 차트 종류 (월별 : m / 일별 : d)

	let chartTab = ""; // 선택된 차트

	if ($('#chartTab1').hasClass('selected')) {
		chartTab = "income";
	} else if ($('#chartTab2').hasClass('selected')) {
		chartTab = "expenditure";
	}

	$.ajax({
		type: 'post',
		url: "/accountBook/chart",
		data: {
			"year": year,
			"month": month + 1,
			"day": day,
			"lastDate": lastDate,
			"chartType": chartType,
			"chartTab": chartTab
		},
		success: function(result) {
			$('#chartBox').html(result);

			if (chartTab == "income") {
				$('#chartTab1').addClass('selected');
				$('#chartTab2').removeClass('selected');
			} else {
				$('#chartTab1').removeClass('selected');
				$('#chartTab2').addClass('selected');
			}
		},
		error: function() {
			console.log("error");
		}
	});
}