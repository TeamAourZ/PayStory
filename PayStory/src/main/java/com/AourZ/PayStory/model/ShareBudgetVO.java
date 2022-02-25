package com.AourZ.PayStory.model;

public class ShareBudgetVO {
	
	private String budgetDate;    // 예산 대상 월 (년-월)
    private int budgetAmount;    // 예산
    private int accountBookNo;    // 가계부 번호
    private String owner;
    
    public String getBudgetDate() {
		return budgetDate;
	}
	public void setBudgetDate(String budgetDate) {
		this.budgetDate = budgetDate;
	}
	public int getBudgetAmount() {
		return budgetAmount;
	}
	public void setBudgetAmount(int budgetAmount) {
		this.budgetAmount = budgetAmount;
	}
	public int getAccountBookNo() {
		return accountBookNo;
	}
	public void setAccountBookNo(int accountBookNo) {
		this.accountBookNo = accountBookNo;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
    
    
}


