package com.AourZ.PayStory.model.accountBook;

public class EditorVO {
	private String editDate;		// 수정 날짜
	private String memberNo;		// 수정자
	private int accountBookNo;	// 가계부 번호
	private int incomeNo;			// 수입 내역 번호
	private int expenditureNo;	// 지출 내역 번호

	public String getEditDate() {
		return editDate;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public int getAccountBookNo() {
		return accountBookNo;
	}

	public int getIncomeNo() {
		return incomeNo;
	}

	public int getExpenditureNo() {
		return expenditureNo;
	}

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public void setAccountBookNo(int accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

	public void setIncomeNo(int incomeNo) {
		this.incomeNo = incomeNo;
	}

	public void setExpenditureNo(int expenditureNo) {
		this.expenditureNo = expenditureNo;
	}

}
