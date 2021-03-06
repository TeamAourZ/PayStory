package com.AourZ.PayStory.model.accountBook;

public class IncomeVO {
	private Integer incomeNo;		// 수입 내역 번호
	private String incomeDate;		// 수입 내역 등록 날짜
	private String incomeSource;		// 수입원
	private String incomeMemo;		// 해당 수입건 메모
	private Integer incomeAmount;	// 수입 금액
	private String tagNo;				// 수입 태그
	private Integer accountBookNo;	// 수입 내역 소유 가계부 번호

	public Integer getIncomeNo() {
		return incomeNo;
	}

	public String getIncomeDate() {
		return incomeDate;
	}

	public String getIncomeSource() {
		return incomeSource;
	}

	public String getIncomeMemo() {
		return incomeMemo;
	}

	public Integer getIncomeAmount() {
		return incomeAmount;
	}

	public String getTagNo() {
		return tagNo;
	}

	public Integer getAccountBookNo() {
		return accountBookNo;
	}

	public void setIncomeNo(Integer incomeNo) {
		this.incomeNo = incomeNo;
	}

	public void setIncomeDate(String incomeDate) {
		this.incomeDate = incomeDate;
	}

	public void setIncomeSource(String incomeSource) {
		this.incomeSource = incomeSource;
	}

	public void setIncomeMemo(String incomeMemo) {
		this.incomeMemo = incomeMemo;
	}

	public void setIncomeAmount(Integer incomeAmount) {
		this.incomeAmount = incomeAmount;
	}

	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}

	public void setAccountBookNo(Integer accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

}
