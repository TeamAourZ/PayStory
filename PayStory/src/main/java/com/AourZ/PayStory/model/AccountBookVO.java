package com.AourZ.PayStory.model;

public class AccountBookVO {
	private int accountBookNo;				// 가계부 번호
	private String accountBookTitle;		// 가계부 제목
	private String accountBookDescribe;	// 가계부 설명
	private String accountBookDate;		// 가계부 구분 날짜 (년-월)
	private boolean isShared;					// 가계부 구분자 (일반 / 공유)
	private int budget;							// 가계부 예산
	private String memberNo;					// 가계부 소유자

	public int getAccountBookNo() {
		return accountBookNo;
	}

	public String getAccountBookTitle() {
		return accountBookTitle;
	}

	public String getAccountBookDescribe() {
		return accountBookDescribe;
	}

	public String getAccountBookDate() {
		return accountBookDate;
	}

	public boolean isShared() {
		return isShared;
	}

	public int getBudget() {
		return budget;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setAccountBookNo(int accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

	public void setAccountBookTitle(String accountBookTitle) {
		this.accountBookTitle = accountBookTitle;
	}

	public void setAccountBookDescribe(String accountBookDescribe) {
		this.accountBookDescribe = accountBookDescribe;
	}

	public void setAccountBookDate(String accountBookDate) {
		this.accountBookDate = accountBookDate;
	}

	public void setShared(boolean isShared) {
		this.isShared = isShared;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

}
