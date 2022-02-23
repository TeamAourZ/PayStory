package com.AourZ.PayStory.model;

public class AccountBookVO {
	// accountBook Table
	private int accountBookNo;				// 가계부 번호
	private String accountBookTitle;		// 가계부 제목
	private String accountBookDescribe;	// 가계부 설명
	private String accountBookDate;		// 가계부 구분 날짜 (년-월)
	private boolean isShared;					// 가계부 구분자 (일반 / 공유)
	private String memberNo;					// 가계부 소유자
	
	// accountBookBudget Table
	private String budgetDate;	// 예산 대상 월 (년-월)
	private int budget;				// 예산

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

	public boolean getIsShared() {
		return isShared;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public String getBudgetDate() {
		return budgetDate;
	}

	public int getBudget() {
		return budget;
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

	public void setIsShared(boolean isShared) {
		this.isShared = isShared;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public void setBudgetDate(String budgetDate) {
		this.budgetDate = budgetDate;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

}
