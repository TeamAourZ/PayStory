/**
 * addFormAjax.js
 *  - OCR AI, form submit 관련
 */
 $(function(){
	
	/* OCR */
	$('#uploadReceipt').on('change', function(){
		const formData = new FormData();
  		formData.append("expenditureImage", $(this)[0].files[0]);
  		
		$.ajax({
			type:"post",	
			enctype: 'multipart/form-data',
			url: "/OCR", 	
			data: formData, 
			processData: false,
    		contentType: false,
			success: function(result) {
				let source = result.expenditureSource;
				let amount = result.expenditureAmount;
				let date = result.expenditureDate;
				let address = result.expenditureAddress;
				
				$('#expenditureSource').val(source);
				$('#expenditureTotalAmount').val(amount);
				$('#date').val(date);
				$('#address').val(address);
				
			},
			error: function(err){
				console.log(err);
			}
		});
	});
	
	/* Submit */
	$('#expenditureForm').on('submit', function(e){
		e.preventDefault();
		let formData = new FormData($(this)[0]);
		consoel.log(formData);
		
		$.ajax({
			type:"post",	
			enctype: 'multipart/form-data',
			url: "/", 	
			data: formData, 
			processData: false,
    		contentType: false,
			success: function(result) {
				
			},
			error: function(err){
				console.log(err);
			}
		});
	});
	
	$('#incomeForm').on('submit', function(e){
		e.preventDefault();
		let formData = new FormData($(this)[0]);
		consoel.log(formData);
		
		$.ajax({
			type:"post",	
			enctype: 'multipart/form-data',
			url: "/", 	
			data: formData, 
			processData: false,
    		contentType: false,
			success: function(result) {
				
			},
			error: function(err){
				console.log(err);
			}
		});
	});
});