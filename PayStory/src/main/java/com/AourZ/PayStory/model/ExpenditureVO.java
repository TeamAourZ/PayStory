package com.AourZ.PayStory.model;

public class ExpenditureVO {
	private int expenditureNo;			// 지출 내역 번호
	private String expenditureDate;		// 지출 내역 등록 날짜
	private String expenditureImage;	// 영수증 이미지
	private String expenditureSource;	// 지출원
	private String expenditureMemo;	// 해당 지출건 메모
	private String expenditureAddress;	// 지출원 주소
	private int expenditureAmount;		// 지출 금액
	private String tagNo;					// 지출 태그
	private int accountBookNo;			// 지출 내역 소유 가계부 번호

	public int getExpenditureNo() {
		return expenditureNo;
	}

	public String getExpenditureDate() {
		return expenditureDate;
	}

	public String getExpenditureImage() {
		return expenditureImage;
	}

	public String getExpenditureSource() {
		return expenditureSource;
	}

	public String getExpenditureMemo() {
		return expenditureMemo;
	}

	public String getExpenditureAddress() {
		return expenditureAddress;
	}

	public int getExpenditureAmount() {
		return expenditureAmount;
	}

	public String getTagNo() {
		return tagNo;
	}

	public int getAccountBookNo() {
		return accountBookNo;
	}

	public void setExpenditureNo(int expenditureNo) {
		this.expenditureNo = expenditureNo;
	}

	public void setExpenditureDate(String expenditureDate) {
		this.expenditureDate = expenditureDate;
	}

	public void setExpenditureImage(String expenditureImage) {
		this.expenditureImage = expenditureImage;
	}

	public void setExpenditureSource(String expenditureSource) {
		this.expenditureSource = expenditureSource;
	}

	public void setExpenditureMemo(String expenditureMemo) {
		this.expenditureMemo = expenditureMemo;
	}

	public void setExpenditureAddress(String expenditureAddress) {
		this.expenditureAddress = expenditureAddress;
	}

	public void setExpenditureAmount(int expenditureAmount) {
		this.expenditureAmount = expenditureAmount;
	}

	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}

	public void setAccountBookNo(int accountBookNo) {
		this.accountBookNo = accountBookNo;
	}
}
