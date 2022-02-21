package com.AourZ.PayStory.model;

public class AccountVO {
	private String accountBookNo;
	private String accountBookTitle;
	private String accountBookDescribe;
	private String accountBookDate;
	private boolean isShared;
	private int budget;
	private String memberNo;
	
	public String getAccountBookNo() {
		return accountBookNo;
	}
	public void setAccountBookNo(String accountBookNo) {
		this.accountBookNo = accountBookNo;
	}
	public String getAccountBookTitle() {
		return accountBookTitle;
	}
	public void setAccountBookTitle(String accountBookTitle) {
		this.accountBookTitle = accountBookTitle;
	}
	public String getAccountBookDescribe() {
		return accountBookDescribe;
	}
	public void setAccountBookDescribe(String accountBookDescribe) {
		this.accountBookDescribe = accountBookDescribe;
	}
	public String getAccountBookDate() {
		return accountBookDate;
	}
	public void setAccountBookDate(String accountBookDate) {
		this.accountBookDate = accountBookDate;
	}
	public boolean isShared() {
		return isShared;
	}
	public void setShared(boolean isShared) {
		this.isShared = isShared;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
			
	
}


