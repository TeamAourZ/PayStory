package com.AourZ.PayStory.model;

public class ExpenditureItemVO {
	private String expenditureItemName;	// 지출 아이템 이름
	private int expenditureItemPrice;		// 지출 아이템 금액
	private int expenditureNo;				// 지출 내역 번호

	public String getExpenditureItemName() {
		return expenditureItemName;
	}

	public int getExpenditureItemPrice() {
		return expenditureItemPrice;
	}

	public int getExpenditureNo() {
		return expenditureNo;
	}

	public void setExpenditureItemName(String expenditureItemName) {
		this.expenditureItemName = expenditureItemName;
	}

	public void setExpenditureItemPrice(int expenditureItemPrice) {
		this.expenditureItemPrice = expenditureItemPrice;
	}

	public void setExpenditureNo(int expenditureNo) {
		this.expenditureNo = expenditureNo;
	}

}
