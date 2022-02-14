/**
 * productSearch.js
 	상품 검색
 */
 
 $(document).ready(function(){
	$('#btn btn-outline-secondary').on('click', function(){
		
		var formData = $(this).serialize();
		// serialize() : 폼에 입력한 값을 쿼리 스트링 방식의 데이터로 변환
		//type=prdName&keyword=노트북
		
		$.ajax({
			type:"post",
			url:"productSearch",
			data:formData,  
			success:function(result){   // 컨트롤러에서 반환한 prdList를 result가 받음
				//alert(result.length);
				// 반환된 결과(ArrayList<ProductVO>)를  searchResultbox에 테이블 형태로 출력
				$('#searchResultbox').empty();
				$('#searchResultbox').append('<table id="resultTable" border="1" width="600">' +
																	'<tr><th>상품번호</th><th>상품명</th><th>가격</th>' + 
																	'<th>제조사</th><th>재고</th><th>사진</th></tr>');
				if(result == ""){
					$('#resultTable').append('<tr align="center"><td colspan="6">찾는 상품이 없습니다 </td></tr>');
				}else{
					for(var i=0; i <result.length; i++){
						$('#resultTable').append('<tr><td>' + result[i].prdNo + '</td><td>' +
																			               result[i].prdName + '</td><td>' +
																			               result[i].prdPrice+ '</td><td>' +
																			               result[i].prdCompany + '</td><td>' +
																			               result[i].prdStock + '</td><td>' +
					       '<img src="/images/' + result[i].prdNo + '.jpg" width="30" height="20"></td></tr>');
					}
				}
				
				$('#searchResultbox').append('</table>');
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});	
});










