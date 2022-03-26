/**
 * chatbot.js
 */
 
 $(function(){
	// 웰컴 메시지를 받기 위해서 message 입력받기 전에
	// 빈 값으로 서버에 전송하고 웰컴 메시지를 받기 위해
	// $.ajax()를 별도의 함수로 분리해서 호출
	callAjax(); //매시지 입력하지 않고 호출해서 빈값 전송 -> open event -> 웰컴 메시지 출력
	

	/////////////////////////////////////////////////////////
	// 음성으로 질문하기
	
	//(1) 녹음 기능
	const record = document.getElementById("record");
    const stop = document.getElementById("stop");
    const soundClips = document.getElementById("sound-clips");

    const audioCtx = new(window.AudioContext || window.webkitAudioContext)(); // 오디오 컨텍스트 정의

    if (navigator.mediaDevices) {
        var constraints = {
            audio: true
        }
         let chunks = [];

        navigator.mediaDevices.getUserMedia(constraints)
            .then(stream => {
                const  mediaRecorder = new MediaRecorder(stream);
          
                record.onclick = () => {
                    mediaRecorder.start();
			console.log("qweqwe");
                    record.style.background = "";
                    record.style.color = "black";
                }

                stop.onclick = () => {//정지 버튼 클릭 시
                    mediaRecorder.stop();//녹음 정지                       
                    record.style.background = "";
                    record.style.color = "";
                }
                
                mediaRecorder.onstop = e => {                        
                    
                    const clipName = "voiceMsg";
					//태그 3개 생성
                    const clipContainer = document.createElement('article');                     
                    const audio = document.createElement('audio');
                    const a = document.createElement('a');
					                       
                    clipContainer.appendChild(a);
                    soundClips.appendChild(clipContainer);
					
                    //chunks에 저장된 녹음 데이터를 audio 양식으로 설정
                    //audio.controls = true;
                    const blob = new Blob(chunks, {
                        'type': 'audio/mp3 codecs=opus'
                    }) ;
                    chunks = [];
                    const audioURL = URL.createObjectURL(blob);
                   // audio.src = audioURL;                       
                   //blob:http://localhost:8011/6377d19d-2ca8-49b1-a37f-068d602ceb60    
                    a.href=audioURL;                    
                    a.download = clipName;                      
                   //a.innerHTML = "DOWN"
					a.click(); // 다운로드 폴더에 저장하도록 클릭 이벤트 발생			
					
                    fileUpload(blob, clipName);
                   
                }//mediaRecorder.onstop

                //녹음 시작시킨 상태가 되면 chunks에 녹음 데이터를 저장하라 
                mediaRecorder.ondataavailable = e => {
                    chunks.push(e.data)
                }
                
                
            })
            .catch(err => {
                console.log('The following error occurred: ' + err)
            })
    }
    
        
	
	// chatbot 아이콘 눌렀을 때 파일 업로드
	$("#uploadFile").on('change',function(e){
		e.preventDefault();

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
				$('#chatBox').append('<div class="msgBox send"><span id="in"><img src="' + 
										e.target.result + '" width="250px" height="250px">' +
										'</span></div><br>');
			}
			render.readAsDataURL(f);
		});
	});

	$(document).on('click', '.msgBox img', function(e){
    	$(".modal_chatbotImg").fadeIn();
    	$('.modal_chatbotContent').html('<span><img src="' + 
							 $(this).attr("src") + '" width="250px" height="250px"></span><br>');
	});
	
	$(".modal_chatbotContent").on("click", function(){
	    $(this).parents(".modal_chatbotImg").fadeOut();
	});
	
	// (2) 파일 업로드 기능
    // 서버에 업로드
    function fileUpload(blob, clipName){	    
	
		var formData = new FormData();
		formData.append('uploadFile', blob, clipName+".mp3");
					  
    	//녹음된 mp3파일 전송하고 반환된 텍스트(result)를 챗봇 서버에 전달
    	$.ajax({    		
			type:"post",	
			enctype: 'multipart/form-data',
			url: "clovaSTT", //통신할 url		
			data: formData, //전송할 데이타	: 파일명 :voiceMsg.mp3
			processData: false,
    		contentType: false,
			success: function(result) {
				$('#chatBox').append('<div class="msgBox send"><span id="in"><span>' + 
											  result + '</span></span></div><br>'); 
			
				// 챗봇에게 전달
			    $('#message').val(result);
				callAjax(); 
				$('#message').val('');	
			},
			error: function(e) {
				alert("에러가 발생했습니다 : " + e);
			}
		});
	
    }		
	
	
	/////////////////////////////////////////////////////////
	
	
	// 챗봇에게 질문하고 응답받기 - 텍스트 응답
	// message 입력하고 전송 버튼 눌렀을 때
	
	$('#chatForm_chat').on('submit', function(event){
		event.preventDefault();
		
		// 메시지 입력하지 않고 [전송] 버튼 누른 경우 (웰컴 메시지 출력되지 않도록)
		if ($('#message').val() == ""){
			alert("질문을 입력하세요");
			return false;
		}
		
		/* chatBox에 보낸 메시지 추가 */
		if($('#message').val() != ""){
			$('#chatBox').append('<div class="msgBox send"><span id="in">' + 
												$('#message').val() + '</span></div><br>');
		}
		
		callAjax(); // 입력된 값 전송
		
		/* 입력란 비우기*/
		$('#message').val('');
	});	// submit 끝
	
	// $.ajax()를 별도의 함수로 분리
	function callAjax(){
		$.ajax({
            type:"post",            
            url:"chatbotImgLink",
            data:{message : $('#message').val()},
            dataType :'json',
            success:function (result){
				//JSON 형식 그대로 반환 받음
				var bubbles = result.bubbles;
				for(var b in bubbles){
					if(bubbles[b].type == 'text'){ // 기본 답변인 경우
						/* chatBox에 받은 메시지 추가 */
							$('#chatBox').append('<div class="msgBox receive"><span id="in">PayStory 챗봇<br><br>' + 
															   bubbles[b].data.description +'</span></div><br><br>'); 
															   
						// 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출									   
						callAjaxTTS(bubbles[b].data.description);		
					}	else if(bubbles[b].type == 'template'){//이미지 답변 또는 멀티링크 답변 시작
						if(bubbles[b].data.cover.type=="image"){//이미지 이면
							$("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
																		 "' alt='이미지 없음'>");
							if(bubbles[b].data.contentTable == null){
								$("#chatBox").append
								("<a href='"+bubbles[b].data.cover.data.action.data.url+"' target='_blank'>" + 
										bubbles[b].data.cover.data.action.data.url+ "</a><br>");							
							} else {
								$("#chatBox").append("<p>" + bubbles[b].data.cover.data.description+ "</p>");	
								// 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출									   
								callAjaxTTS(bubbles[b].data.cover.data.description);										
							}
						} 	else if(bubbles[b].data.cover.type=="text"){//멀티링크 답변이면
							$("#chatBox").append("<p>" + bubbles[b].data.cover.data.description+ "</p>");
							// 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출									   
							callAjaxTTS(bubbles[b].data.cover.data.description);	
						}
						
						// 이미지 / 멀티링크 답변 공통 (contentTable 포함)
						for(var ct in bubbles[b].data.contentTable){
							var ct_data = bubbles[ct].data.contentTable[ct];
							for(var ct_d in ct_data){
								$("#chatBox").append
								("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank'>" + 
									ct_data[ct_d].data.data.action.data.url+ "</a><br>");
						    }
					    }// contentTable for문 끝
				    }//template 끝			
				}//bubbles for문 종료
				
				// 스크롤해서 올리기										   
				$("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));	
						
            },
            error:function(data){
               alert("오류가 발생했습니다.");				
            }
       });
	}
	
	
	function callAjaxTTS(result){
		$.ajax({
            type:"post",            
            url:"chatbotTTS",
            data:{message : result},
            dataType :'text',
            success:function (result){ //음성 파일 이름 받음
				/* chatBox에 받은 음성 메시지 플레이 */
				$('audio').prop("src", '/voice/'+ result)[0].play();
				$('audio').hide();
            },
            error:function(data){
               alert("에러 발생");				
            }
       });
	}
	
	// 금액 천단위 콤마 생성
	function withComma(num){
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	/* OCR */
	$('#uploadFile').on('change', function(){
		const formData = new FormData();
  		formData.append("receiptImage", $(this)[0].files[0]);
  		
		$.ajax({
			type:"post",	
			enctype: 'multipart/form-data',
			url: "/OCR", 	
			data: formData,
			processData: false,
    		contentType: false,
			success: function(result) {
				var openNewWindow = window.open("about:blank");
				// 날짜 
				let dateTime = result.expenditureDate;
				// 주소
				let address = result.expenditureAddress;
				// 사용처 
				let source = result.expenditureSource;
				// 총 금액 : 콤마
				let totalAmount = withComma(result.expenditureAmount);
				// 아이템 List
				let itemList = result.itemList;
				// 영수증 이미지
				let image = result.expenditureImage;
				// 데이터 문자열 변환
				let data = ""
				// 값 입력
				let receiveChat = '<div class="msgBox receive"><span id="in">PayStory 챗봇' + '<br>AI 인식 결과입니다.<br><br>' +
								  '<table border="1" class="text-center"><tr><th>사용처</th><td colspan="2">'+source+'</td></tr>'+
								  '<tr><th>주소</th><td colspan="2">'+address+'</td></tr>'+
								  '<tr><th>사용 날짜</th><td colspan="2">'+dateTime+'</td></tr>';
									
				if(itemList){
					receiveChat += '<tr><th rowspan='+(itemList.length+1)+'>상세 항목</th><th>내용</th><th>금액</th>';
					for(let i=0; i<itemList.length; i++){
						receiveChat += '<tr><td>'+itemList[i].expenditureItemName+
											 '</td><td class="text-right">'+withComma(itemList[i].expenditureItemPrice)+'원</td></tr>';
						
						// data 추가
						for (key in itemList[i]) {
							data += key + "=" + itemList[i][key] + ",";
						}
					}
					receiveChat += '</tr>';
				}
				
				receiveChat += '<tr><th>총 지출 금액</th><td colspan="2">'+ totalAmount + '원</td><tr></table>'+
							   '<br><br> 가계부 등록 페이지로 이동합니다. </span></span></div>';
				
				
				
		        $('#chatBox').append(receiveChat);
				
				if(data !== ""){
					openNewWindow.location.href = "/accountBook/add/chat/" + dateTime + "/" + source + "/" + address + "/" + totalAmount + "/" + data + "/" + image;
				}else {
					openNewWindow.location.href = "/accountBook/add/chat/" + dateTime + "/" + source + "/" + address + "/" + totalAmount + "/" + image;					
				}
				
				
			},
			error: function(err){
				console.log(err);
			}
		});
	});
});







