package com.AourZ.PayStory.model.accountBook;

public class AccountBookBudgetVO {
	private String budgetDate;	// 예산 대상 월 (년-월)
	private int budgetAmount;	// 예산
	private int accountBookNo;	// 가계부 번호

	public String getBudgetDate() {
		return budgetDate;
	}

	public int getBudgetAmount() {
		return budgetAmount;
	}

	public int getAccountBookNo() {
		return accountBookNo;
	}

	public void setBudgetDate(String budgetDate) {
		this.budgetDate = budgetDate;
	}

	public void setBudgetAmount(int budgetAmount) {
		this.budgetAmount = budgetAmount;
	}

	public void setAccountBookNo(int accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

}
