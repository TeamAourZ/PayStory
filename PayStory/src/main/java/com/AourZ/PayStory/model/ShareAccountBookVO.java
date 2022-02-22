package com.AourZ.PayStory.model;

public class ShareAccountBookVO {
	private String shareAccountBookDate;	// 공유 가계부 생성 날짜
	private String owner;							// 소유자 (memberNo - 외래키)
	private String participant;						// 참여자 (memberNo - 외래키)
	private int accountBookNo;					// 가계부 번호

	public String getShareAccountBookDate() {
		return shareAccountBookDate;
	}

	public String getOwner() {
		return owner;
	}

	public String getParticipant() {
		return participant;
	}

	public int getAccountBookNo() {
		return accountBookNo;
	}

	public void setShareAccountBookDate(String shareAccountBookDate) {
		this.shareAccountBookDate = shareAccountBookDate;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public void setParticipant(String participant) {
		this.participant = participant;
	}

	public void setAccountBookNo(int accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

}
