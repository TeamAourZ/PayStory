package com.AourZ.PayStory.model;

public class ExpenditureItemVO {
	private String expenditureItemName;			// 지출 아이템 이름
	private Integer expenditureItemPrice;		// 지출 아이템 금액
	private Integer expenditureNo;				// 지출 내역 번호
	
	public String getExpenditureItemName() {
		return expenditureItemName;
	}
	public void setExpenditureItemName(String expenditureItemName) {
		this.expenditureItemName = expenditureItemName;
	}
	public Integer getExpenditureItemPrice() {
		return expenditureItemPrice;
	}
	public void setExpenditureItemPrice(Integer expenditureItemPrice) {
		this.expenditureItemPrice = expenditureItemPrice;
	}
	public Integer getExpenditureNo() {
		return expenditureNo;
	}
	public void setExpenditureNo(Integer expenditureNo) {
		this.expenditureNo = expenditureNo;
	}
}
