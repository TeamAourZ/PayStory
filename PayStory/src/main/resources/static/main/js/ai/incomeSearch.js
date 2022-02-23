/**
 * productSearch.js
 	상품 검색
 */
 
 $(document).ready(function(){
	$('#incomeSearchFrm').on('submit', function(){
		event.preventDefault();
		
		var formData = $(this).serialize();
		// serialize() : 폼에 입력한 값을 쿼리 스트링 방식의 데이터로 변환
		//type=prdName&keyword=노트북
		
		$.ajax({
			type:"post",
			url:"incomeSearch",
			data:formData,  
			success:function(result){   // 컨트롤러에서 반환한 prdList를 result가 받음
				//alert(result.length);
				// 반환된 결과(ArrayList<ProductVO>)를  searchResultbox에 테이블 형태로 출력
				$('#searchResultbox').empty();
				$('#searchResultbox').append('<table id="resultTable" border="1" width="600">' +
																	'<tr><th>수입 번호</th><th>수입 날짜</th><th>수입원</th>' + 
																	'<th>수입 내용</th><th>수입 금액</th><th>회원 번호</th></tr>');
				if(result == ""){
					$('#resultTable').append('<tr align="center"><td colspan="6">찾는 상품이 없습니다 </td></tr>');
				}else{
					for(var i=0; i <result.length; i++){
						$('#resultTable').append('<tr><td>' + result[i].incomeNo + '</td><td>' +
																			               result[i].incomeDate + '</td><td>' +
																			               result[i].incomeSource+ '</td><td>' +
																			               result[i].incomeMemo + '</td><td>' +
																			               result[i].incomeAmount + '</td><td>' +
					       																   result[i].memberNo + '</td></tr>');
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










