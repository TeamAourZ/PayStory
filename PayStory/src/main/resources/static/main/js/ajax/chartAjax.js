/* 페이지 로드 - 차트 */
function chartAjax(year, month) {
	let chartType = $('#chartType').val();
	
	let chartTab = "";
	
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
			"chartType": chartType,
			"chartTab": chartTab
		},
		success: function(result) {
			$('#chartBox').html(result);
		},
		error: function() {
			console.log("error");
		}
	});
}