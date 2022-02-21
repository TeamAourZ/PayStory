/**
 * mainCalendarDetailBox.js
 */

/* 날짜 index */
function getDayNum(obj) {
	let day = new Date(nowYear, nowMonth, 1);
	day = day.getDay();
	let idx;

	if (isType == "A") {
		idx = obj.parent().parent().parent('div.infoBox').index() - day;
		console.log(obj.parent().parent().parent('div.infoBox').index());
		console.log($('.infoBox').index());
		console.log("day : " + day);
		console.log("idx : " + idx);
	} else {
		idx = obj.parent().parent().parent('td.tdDate').index() - day;
		console.log(obj.parent().parent().parent('td.tdDate').index());
		console.log("day : " + day);
		console.log("idx : " + idx);
	}

	return idx;
}

/* detailBox - 수입 상세 태그 / 지출 상세 태그 가리기 */
function resetDisplay(obj, idx, check) {
	for (let i = 0; i < obj.length; i++) {
		if (idx != i || check == false) {
			obj.eq(i).addClass('d-none');
			obj.eq(i).removeClass('viewOn')
		}
	}
}

/* detailBox 내용 */
function makeDetailInfo() {
	/* 임시 */

	/*
		table-responsive
		row m-0
	*/


	for (let i = 0; i < $('.infoBox').length; i++) {
		if ($('.infoBox').eq(i)[0].classList[1] != "border") {
			$('.infoBox').eq(i).children('div.detailBox').append(`
				<div class="incomeItemListBox position-absolute d-none">
					<div class="table table-responsive-sm mb-0">
						<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
							<div class="row m-0">
								<div class="col-sm-12">
									<i class="detailBoxClose fas fa-times position-absolute pointer-cursor"></i>
									<table class="table mb-0">
										<thead class="titleName">
											<tr class="text-center">
												<th>구분</th>
												<th>건수</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody class="incomeItem">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="expenditureItemListBox position-absolute d-none">
					<div class="table mb-0">
						<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
							<div class="row m-0">
								<div class="col-sm-12">
									<i class="detailBoxClose fas fa-times position-absolute pointer-cursor"></i>
									<table class="table mb-0">
										<thead class="titleName">
											<tr class="text-center">
												<th>구분</th>
												<th>건수</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody class="expenditureItem">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			`)

			/* 일자별 상세 태그 내용 : 임시 - 데이터에 맞게 추가해야 함*/
			/* 수입 */
			/*for (let i = 0; i < 7; i++) {
				$('.infoBox').eq(i).children('div.detailBox').children('.incomeItem').append(`
					<tr>
						<td>{@@@@}</td>
						<td>{123}</td>
						<td>{123,123,123}</td>
					</tr>
				`);
			}*/
			/* 지출 */
			/*for (let i = 0; i < 7; i++) {
				$('.infoBox').eq(i).children('div.detailBox').children('.expenditureItem').append(`
					<tr>
						<td>{@@@@}</td>
						<td>{123}</td>
						<td>{123,123,123}</td>
					</tr>
				`);
			}*/
		}
	}
}