package com.AourZ.PayStory.model;

public class TagTotalVO {
	private String tagNo;	// 태그 번호
	private int tagCount;	// 태그별 건수
	private int tagSum;		// 태그별 합계

	public String getTagNo() {
		return tagNo;
	}

	public int getTagCount() {
		return tagCount;
	}

	public int getTagSum() {
		return tagSum;
	}

	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}

	public void setTagCount(int tagCount) {
		this.tagCount = tagCount;
	}

	public void setTagSum(int tagSum) {
		this.tagSum = tagSum;
	}

}
