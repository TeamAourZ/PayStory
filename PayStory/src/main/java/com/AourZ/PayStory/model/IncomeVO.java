package com.AourZ.PayStory.model;

public class IncomeVO {
	private int incomeNo;
	private String incomeDate;
	private String incomeSource;
	private String incomeMemo;
	private int incomeAmount;
	private String tagNo;
	private int accountBookNo;

	public int getIncomeNo() {
		return incomeNo;
	}
	public void setIncomeNo(int incomeNo) {
		this.incomeNo = incomeNo;
	}
	public String getIncomeDate() {
		return incomeDate;
	}
	public void setIncomeDate(String incomeDate) {
		this.incomeDate = incomeDate;
	}
	public String getIncomeSource() {
		return incomeSource;
	}
	public void setIncomeSource(String incomeSource) {
		this.incomeSource = incomeSource;
	}
	public String getIncomeMemo() {
		return incomeMemo;
	}
	public void setIncomeMemo(String incomeMemo) {
		this.incomeMemo = incomeMemo;
	}
	public int getIncomeAmount() {
		return incomeAmount;
	}
	public void setIncomeAmount(int incomeAmount) {
		this.incomeAmount = incomeAmount;
	}
	public String getTagNo() {
		return tagNo;
	}
	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}
	public int getAccountBookNo() {
		return accountBookNo;
	}
	public void setAccountBookNo(int accountBookNo) {
		this.accountBookNo = accountBookNo;
	}
}
