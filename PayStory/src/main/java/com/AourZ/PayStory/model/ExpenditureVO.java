package com.AourZ.PayStory.model;

public class ExpenditureVO {
	private int expenditureNo;
	private String expenditureDate;
	private String expenditureImage;	
	private String expenditureSource;	// 가맹점
	private String expenditureMemo;		
	private String expenditureAddress;	// 사용처
	private int expenditureAmount;		// 지출 금액
	private String tagNo;
	private int accountBookNo;
	
	public int getExpenditureNo() {
		return expenditureNo;
	}
	public void setExpenditureNo(int expenditureNo) {
		this.expenditureNo = expenditureNo;
	}
	public String getExpenditureDate() {
		return expenditureDate;
	}
	public void setExpenditureDate(String expenditureDate) {
		this.expenditureDate = expenditureDate;
	}
	public String getExpenditureImage() {
		return expenditureImage;
	}
	public void setExpenditureImage(String expenditureImage) {
		this.expenditureImage = expenditureImage;
	}
	public String getExpenditureSource() {
		return expenditureSource;
	}
	public void setExpenditureSource(String expenditureSource) {
		this.expenditureSource = expenditureSource;
	}
	public String getExpenditureMemo() {
		return expenditureMemo;
	}
	public void setExpenditureMemo(String expenditureMemo) {
		this.expenditureMemo = expenditureMemo;
	}
	public String getExpenditureAddress() {
		return expenditureAddress;
	}
	public void setExpenditureAddress(String expenditureAddress) {
		this.expenditureAddress = expenditureAddress;
	}
	public int getExpenditureAmount() {
		return expenditureAmount;
	}
	public void setExpenditureAmount(int expenditureAmount) {
		this.expenditureAmount = expenditureAmount;
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
