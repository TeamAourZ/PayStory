/**
 * newBoardForm.js
 */
 $(document).ready(function(){
	/***** 엔터키 submit 안 되게 OK *****/
	$(document).on('keydown', function(e){
		if(e.keyCode == 13) e.preventDefault();
	});
	
	/* Submit - 게시글 */
	$('#newBoardForm').on('submit', function(e){
		e.preventDefault();
		
		const formData = new FormData();
		formData.append('boardTitle',  $('.title').val());
		formData.append('boardCategoryNo',  $('#categoryNo option:selected').val());
		formData.append('boardFile',  $('#uploadFile')[0].files[0] || null);
		formData.append('boardContents',  $('.content').val());

		$.ajax({
			type:"post",
			enctype: 'multipart/form-data',	
			url: "/board/create", 	
			data: formData, 
			processData: false,
    		contentType: false,
			success: function(result) {
				if(result != 0){
					alert("게시글을 정상적으로 등록했습니다.\n게시판 목록 페이지로 이동합니다.");
					location.href = "/board/listAll";
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	});
	
	/*$(".uploadResult").on("click", "button", function(e){
		
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type: type},
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
			},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				alert(result);
				targetLi.remove();
			}
		});

	});*/		

	/*function showUploadResult(uploadResultArr) {
		
		if (!uploadResultArr || uploadResultArr.length == 0) {return;}
		
		var uploadUL = $(".uploadResult ul");
		var str="";
		
		$(uploadResultArr).each(function(i,obj) {
		    if (obj.image) {
		        var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		        str += "<li data-path='"+obj.uploadPath+"'";
		        str += " data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"'data-type='"+obj.image+"'";
		        str += " ><div>";
		        str += "<span> " + obj.fileName + " </span>";
		        str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
		        str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		        str += "<img src='/display?fileName=" + fileCallPath + "'>";
		        str += "</div>";
		        str += "</li>";
		    } else {
		        var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
		        var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
		        str += "<li data-path='"+obj.uploadPath+"'";
		        str += " data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"'data-type='"+obj.image+"'";
		        str += " ><div>";
		        str += "<span> " + obj.fileName + " </span>";
		        str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
		        str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		        str += "<img src='/resources/img/attachment.png'></a>";
		        str += "</div>";
		        str += "</li>";
		    }
		});
		
		uploadUL.append(str);
	}*/	
	
	// 업로드 파일 확장자 필터링
	/*var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");  //정규식
	var maxSize = 5242880;  //5MB
	
	function checkExtension(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}*/
		
	/*var formObj = $("#newBoardForm");
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
		
	    var str = "";
	    $(".uploadResult ul li").each(function(i,obj){
	        var jobj = $(obj);
	        console.dir(jobj);
	        
	        str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
	    });
	    formObj.append(str).submit();

	});*/	

	/*var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";*/
	
	$("#uploadFile").change(function(e){
		// 파일 이름 표시
		let fileName = $(this).val();
		console.log(fileName)
	  	$(".custom-file-label").text(fileName.substring(12));
		
		/*var formData = new FormData();  //폼 태그에 대응되는 객체
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		// formData 에 file 추가
		for (var i = 0; i < files.length; i++) {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
			},
			data: formData,
			type: 'POST',
			dataType: 'json',  
			success: function(result){
				console.log(result); 
				showUploadResult(result);
			}
		});*/
	});	
});