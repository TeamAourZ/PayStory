/**
 * detailViewList.js
 */

/*


sb-admin-2.css btn-link 추가 및 변경
arrow 추가


*/

$(function() {
	/* 임시 */
	for (let i = 0; i < 1; i++) {
		$('#detailViewBox').append(`
			<div class="row w-100 pt-1">
				<div class="col-2 align-self-center">
					<div class="rounded-circle text-center p-0">{태그명태}</div>
				</div>
				<div class="col-8">
					<div class="d-flex">
						<div class="dataSource">가나다라가나다라가나다라가나다라가나다라가나다라가나다라</div>
						<div class="dataAmount">123,123,123</div>
					</div>
					<div class="accordion" id="dataSourceItems${i}">
						<div class="card">
							<div class="card-header p-0 d-flex justify-content-between" id="itemList${i}">
								<div class="side"></div>
								<h2 class="btn btn-link-e btn-block text-center collapsed m-0" type="button" data-toggle="collapse" data-target="#collapse${i}" aria-expanded="false" aria-controls="collapseThree">
									Collapsible Group Item ${i}
								</h2>
								<div class="side text-center">
									<i class="far fa-image"></i>
								</div>
							</div>
							<div id="collapse${i}" class="collapse" aria-labelledby="itemList${i}" data-parent="#dataSourceItems${i}">
								<div class="card-body p-0">
									<div class="itemList">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-2 d-flex flex-column">
					<div class="text-right">
						<i class="far fa-edit"></i>
						<i class="far fa-trash-alt"></i>
					</div>
					<div>
						{예금 변동 내역}
					</div>
				</div>
			</div>
		`);
	}

	/* 임시 */
	for (let i = 0; i < 7; i++) {
		$('.itemList').append(`
			<div class="item d-flex justify-content-between">
				<div class="itemName ml-5">{내용내용내용내용내용내용}</div>
				<div class="itemPrice mr-5">123,123,123</div>
			</div>
		`);
	}
});