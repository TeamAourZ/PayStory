package com.AourZ.PayStory.model.accountBook;

public class ShareBudgetVO {
	private String budgetDate;		// 예산 대상 월 (년-월)
    private Integer budgetAmount;	// 예산
    private Integer accountBookNo;	// 가계부 번호
    private String owner;				// 소유자

	public String getBudgetDate() {
		return budgetDate;
	}

	public Integer getBudgetAmount() {
		return budgetAmount;
	}

	public Integer getAccountBookNo() {
		return accountBookNo;
	}

	public String getOwner() {
		return owner;
	}

	public void setBudgetDate(String budgetDate) {
		this.budgetDate = budgetDate;
	}

	public void setBudgetAmount(Integer budgetAmount) {
		this.budgetAmount = budgetAmount;
	}

	public void setAccountBookNo(Integer accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

}
