package com.AourZ.PayStory.model.accountBook;

public class TagTotalVO {
	private String date;		// 날짜 (년 / 년-월 / 년-월-일)
	private String tag;		// 태그 번호 / 이름
	private Integer count;	// 총 건수
	private Integer sum;	// 총 금액

	public String getDate() {
		return date;
	}

	public String getTag() {
		return tag;
	}

	public Integer getCount() {
		return count;
	}

	public Integer getSum() {
		return sum;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}

}
