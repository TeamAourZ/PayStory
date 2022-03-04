package com.AourZ.PayStory.model.accountBook;

public class DetailViewItemVO {
	private String condition;			// 수입 / 지출 구분
	private Integer dataNo;			// 수입 / 지출 번호
	private String date;					// 수입 / 지출 등록 날짜
	private String receiptImage;		// 지출 영수증 이미지
	private String source;				// 수입 / 지출원
	private String memo;				// 수입 / 지출 내용
	private Integer amount;			// 수입 / 지출 금액
	private String tagName;			// 태그 이름
	private Integer accountBookNo;	// 가계부 번호

	public String getCondition() {
		return condition;
	}

	public Integer getDataNo() {
		return dataNo;
	}

	public String getDate() {
		return date;
	}

	public String getReceiptImage() {
		return receiptImage;
	}

	public String getSource() {
		return source;
	}

	public String getMemo() {
		return memo;
	}

	public Integer getAmount() {
		return amount;
	}

	public String getTagName() {
		return tagName;
	}

	public Integer getAccountBookNo() {
		return accountBookNo;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public void setDataNo(Integer dataNo) {
		this.dataNo = dataNo;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setReceiptImage(String receiptImage) {
		this.receiptImage = receiptImage;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public void setAccountBookNo(Integer accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

}
