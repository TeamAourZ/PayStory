package com.AourZ.PayStory.model;

public class TagTotalVO {
	private String date;	// 날짜 (년 / 년-월 / 년-월-일)
	private String tag;	// 태그 번호 / 이름
	private int count;		// 총 건수
	private int sum;		// 총 금액

	public String getDate() {
		return date;
	}

	public String getTag() {
		return tag;
	}

	public int getCount() {
		return count;
	}

	public int getSum() {
		return sum;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

}
