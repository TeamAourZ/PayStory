/**
 * sideMenu.js
 */
 $(function(){
	/***** 수입/ 지출 버튼 클릭 *****/
	$('#dashBoard').on('click', function(){
		let isShared = $('#isShared').val();
		
		if(isShared == 0){
			location.href = "/accountBook/myMain";
		}else{
			location.href = "/accountBook/shareMain";
		}
	});
	
	/***** 수입/ 지출 버튼 클릭 *****/
	$('#addItemBtn').on('click', function(){
		const date = new Date();

		let year = date.getFullYear();
		let month = date.getMonth() + 1; 
		let day = date.getDate(); 
		let hours = date.getHours();
		let minutes = date.getMinutes();
		
		month = month < 10 ? "0" + month : month;
		day = day < 10 ? "0" + day : day;
		hours = hours < 10 ? "0" + hours : hours;
		minutes = minutes < 10 ? "0" + minutes : minutes;
		
		let dateTime = year + "-" + month + "-" + day + "T" + hours + ":" + minutes;
		
		location.href = "/accountBook/add/" + dateTime; // 내역 입력 페이지 이동
	});
});