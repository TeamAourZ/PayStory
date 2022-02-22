package com.AourZ.PayStory.model;

public class EditorVO {
	private String editDate;		// 수정 날짜
	private String memberNo;		// 수정자
	private int accountBookNo;	// 가계부 번호

	public String getEditDate() {
		return editDate;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public int getAccountBookNo() {
		return accountBookNo;
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

}
