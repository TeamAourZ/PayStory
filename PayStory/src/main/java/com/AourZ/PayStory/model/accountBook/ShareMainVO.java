package com.AourZ.PayStory.model.accountBook;

public class ShareMainVO {
	private String accountBookTitle;		// 가계부 제목
	private String ownerName;				// 회원 이름 (닉네임)
	private String ownerImage;			// 회원 프로필 이미지
	private String ownerNo;				// 회원 memberNo
	private String participantImage[];			// 참여자 이미지
	private String participantNo[];			// 참여자 memberNo
	
	private Integer accountBookNo;
	
	public String getAccountBookTitle() {
		return accountBookTitle;
	}
	public void setAccountBookTitle(String accountBookTitle) {
		this.accountBookTitle = accountBookTitle;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getOwnerImage() {
		return ownerImage;
	}
	public void setOwnerImage(String ownerImage) {
		this.ownerImage = ownerImage;
	}
	public String[] getParticipantImage() {
		return participantImage;
	}
	public void setParticipantImage(String[] participantImage) {
		this.participantImage = participantImage;
	}
	public Integer getAccountBookNo() {
		return accountBookNo;
	}
	public void setAccountBookNo(Integer accountBookNo) {
		this.accountBookNo = accountBookNo;
	}
	public String[] getParticipantNo() {
		return participantNo;
	}
	public void setParticipantNo(String participantNo[]) {
		this.participantNo = participantNo;
	}
	public String getOwnerNo() {
		return ownerNo;
	}
	public void setOwnerNo(String ownerNo) {
		this.ownerNo = ownerNo;
	}
	
}
