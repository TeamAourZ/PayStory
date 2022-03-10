package com.AourZ.PayStory.model.member;

public class ShareMemberVO {
	private String memberNo;			// 회원 번호
	private String memberName;		// 회원 이름 (닉네임)
	private String memberEmail;		// 회원 이메일 아이디
	private String memberImage;	// 회원 프로필 이미지

	public String getMemberNo() {
		return memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

}
