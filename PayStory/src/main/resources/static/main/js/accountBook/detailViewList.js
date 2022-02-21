/**
 * detailViewList.js
 */

$(function() {
	for (let i = 0; i < 7; i++) {
		$('#detailViewBox').append(`
			<div class="row dataBox w-100 pt-2 pb-2 mt-2">
				<div class="col-2 align-self-center">
					<div class="rounded-circle text-center p-0">{태그명태그명}</div>
				</div>
				<div class="col-8">
					<div class="d-flex mb-2">
						<div class="dataSource">가나다라가나다라가나다라가나다라가나다라가나다라가나다라</div>
						<div class="dataAmount">123,123,123</div>
					</div>
					<div id="detailsBox${i}" class="accordion">
						<div class="card">
							<div id="itemListCard${i}" class="card-header p-0 d-flex justify-content-between">
								<div class="side"></div>
								<h2 class="btn text-center collapsed w-100 m-0" data-toggle="collapse" data-target="#collapse${i}" aria-expanded="false" aria-controls="collapse${i}">
									Collapsible Group Item ${i}&nbsp;
								</h2>
								<div class="side text-center">
									<i class="far fa-image fa-lg pointer-cursor"></i>
								</div>
							</div>
							<div class="card-body p-0">
								<div id="collapse${i}" class="collapse" aria-labelledby="itemListCard${i}" data-parent="#detailsBox${i}">
									<div class="itemListBox mt-1">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-2 d-flex flex-column">
					<div class="text-right">
						<i class="far fa-edit fa-lg pointer-cursor"></i>
						<i class="far fa-trash-alt fa-lg pointer-cursor"></i>
					</div>
					<div>
						{예금 변동 내역}
					</div>
				</div>
			</div>
		`);
	}

	/* 상세 정보 : 임시 - 일자에 맞게 추가해야 함*/
	for (let i = 0; i < 7; i++) {
		$('.itemListBox').append(`
			<div class="item d-flex justify-content-between mb-1">
				<div class="itemName ml-5">{내용내용내용내용내용내용}</div>
				<div class="itemPrice mr-5">123,123,123</div>
			</div>
		`);
	}
	
	/* 데이터 테두리 : 임시 - 데이터에 맞게 설정해줘야 함 */
	for (let i = 0; i < $('.dataBox').length; i++) {
		if (i % 2 == 0) {
			$('.dataBox').eq(i).addClass('incomeData');
		} else {
			$('.dataBox').eq(i).addClass('expenditureData');
		}
	}
	
	/* 수입은 collapse가 없어야 함 */
});