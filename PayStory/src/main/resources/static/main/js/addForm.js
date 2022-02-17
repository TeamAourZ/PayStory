/**
 * addForm.js
 */
 
 $(function(){
	// 엔터키 눌렀을 때 submit 안 되도록
	$(document).on('keydown', function(e){
		if(e.keycode == 13) e.preventDefault();
	})
	
	// 파일 업로드
	$("#uploadReceipt").on('change',function(e){
		// 파일 이름 표시
		let fileName = $(this).val();
	  	$(".custom-file-label").text(fileName.substring(12));
	  	
	  	// 이미지 영역에 미리보기
	  	let file = e.target.files;
	  	let fileArr = Array.prototype.slice.call(file);
	  	
	  	fileArr.forEach(function(f){
			if(!f.type.match('image.*')) {
				alert("이미지 파일만 가능합니다.");
				return;
			}
			
			let render = new FileReader();
			render.onload = function(e){
				$('#receiptImg').attr('src', e.target.result);
				$('#receiptImg').css({
					'width':'100%',
					'height':'100%'
				});
			}
			render.readAsDataURL(f);
		});
	});
	
	// 아이템 추가 버튼 클릭
	$('.addItem').on('click', function(e){
		e.preventDefault();
		addItem();
	});
	
	// 아이템 추가
	function addItem(){
		let itemHTML = '<div class="col-xl-7"><label for="expenditureItem">내용</label>'+
				   '<input type="text" class="form-control form-control-sm shadow-none" id="expenditureItem" required>'+'</div>';
		let priceHTML = '<div class="col-xl-4"><label for="expenditureItemAmount">금액</label>'+
					  '<input type="text" class="form-control form-control-sm shadow-none" id="expenditureItemAmount" required>'+'</div>';
		let removeBtn = '<div class="col-xl-1"><button class="removeItem btn shadow-none p-0"><i class="fas fa-minus-circle"></i></button></div>';
		let addItem = '<div class="item form-group form-row">'+itemHTML+priceHTML+removeBtn+'</div></div>';

		$('#itemWrap').append(addItem);
	} 
	
	// 아이템 삭제 버튼 클릭
	$(document).on('click', '.removeItem', function(e){
		e.preventDefault();
		// 아이템이 한개면 삭제후 바로 새로 생성
		if($('.item').length == 1){
			$(this).parent().parent().remove(); 
			addItem();
		}
		$(this).parent().parent().remove();
	});
	
	// 메모 글자수 제한
	$('.memoBox').on('keyup', function(e){ 
		let content = $(this).val(); 
		// 글자수 세기 
		if (content.length == 0 || content == '') { 
			$('.textCount').text('0'); 
		} else { 
			$('.textCount').text(content.length); 
		} 
		
		// 글자수 제한 
		if (content.length > 100) { 
			// 100자 부터는 타이핑 되지 않도록 
			$(this).val($(this).val().substring(0, 100)); 
			// 100자 넘으면 알림창 뜨도록 
			alert('글자수는 100자까지 입력 가능합니다.'); 
		} 
	});
});