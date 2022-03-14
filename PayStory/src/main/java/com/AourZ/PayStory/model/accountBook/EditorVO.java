package com.AourZ.PayStory.model.accountBook;

public class EditorVO {
	private String dataDate;			// 입력된 데이터 날짜 (내역 날짜)
	private String editDate;			// 수정 날짜
	private String member;				// 수정자
	private Integer accountBookNo;	// 가계부 번호
	private Integer incomeNo;		// 수입 내역 번호
	private Integer expenditureNo;	// 지출 내역 번호

	public String getDataDate() {
		return dataDate;
	}

	public String getEditDate() {
		return editDate;
	}

	public String getMember() {
		return member;
	}

	public Integer getAccountBookNo() {
		return accountBookNo;
	}

	public Integer getIncomeNo() {
		return incomeNo;
	}

	public Integer getExpenditureNo() {
		return expenditureNo;
	}

	public void setDataDate(String dataDate) {
		this.dataDate = dataDate;
	}

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public void setAccountBookNo(Integer accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

	public void setIncomeNo(Integer incomeNo) {
		this.incomeNo = incomeNo;
	}

	public void setExpenditureNo(Integer expenditureNo) {
		this.expenditureNo = expenditureNo;
	}

}
