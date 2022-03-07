// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var ctx = document.getElementById("chartCanvas");

console.log(sumList);

var myPieChart = new Chart(ctx, {
	type: 'doughnut',
	data: {
		labels: tagList,
		datasets: [{
			data: sumList,
			backgroundColor: ['#4e73df', '#6f42c1', '#e83e8c', '#e74a3b', '#fd7e14', '#f6c23e', '#20c9a6', '#36b9cc', '#5a5c69', '#1cc88a'],
			hoverBackgroundColor: ['#4e73df', '#6f42c1', '#e83e8c', '#e74a3b', '#fd7e14', '#f6c23e', '#20c9a6', '#36b9cc', '#5a5c69', '#1cc88a'],
			hoverBorderColor: "rgba(234, 236, 244, 1)",
		}],
	},
	options: {
		maintainAspectRatio: false,
		tooltips: {
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			borderColor: '#dddfeb',
			borderWidth: 1,
			xPadding: 15,
			yPadding: 15,
			displayColors: false,
			caretPadding: 10,
		},
		legend: {
			display: false
		},
		cutoutPercentage: 70,
	},
});
