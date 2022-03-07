package com.AourZ.PayStory.model.accountBook;

public class ShareAccountBookVO {
	private String owner;				// 소유자 (memberNo - 외래키)
	private String participant;			// 참여자 (memberNo - 외래키)
	private Integer accountBookNo;	// 가계부 번호

	private String participant_list[];	// 참여자 리스트

	public String getOwner() {
		return owner;
	}

	public String getParticipant() {
		return participant;
	}

	public Integer getAccountBookNo() {
		return accountBookNo;
	}

	public String[] getParticipant_list() {
		return participant_list;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public void setParticipant(String participant) {
		this.participant = participant;
	}

	public void setAccountBookNo(Integer accountBookNo) {
		this.accountBookNo = accountBookNo;
	}

	public void setParticipant_list(String[] participant_list) {
		this.participant_list = participant_list;
	}

}
