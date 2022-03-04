package com.AourZ.PayStory.model.accountBook;

public class EditorVO {
	private String editDate;			// 수정 날짜
	private String memberNo;			// 수정자
	private Integer accountBookNo;	// 가계부 번호
	private Integer incomeNo;		// 수입 내역 번호
	private Integer expenditureNo;	// 지출 내역 번호

	public String getEditDate() {
		return editDate;
	}

	public String getMemberNo() {
		return memberNo;
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

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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
