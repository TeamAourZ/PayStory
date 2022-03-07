/**
 * boardView.js
 */
 
 $(function(){
	$('.updateBtn').on('click', function(){
		alert("수정페이지로 이동합니다.");
		location.href="/board/updatForm";
	});
	$('.listBtn').on('click', function(){
		alert("목록페이지로 이동합니다.");
		location.href="/board/listAll"
	})
});