package com.AourZ.PayStory.model;

public class MemberVO {
    private String memberNo;
    private String memberName;
	private String memberEmail;
	private String memberPwd;
	private String memberImage;
	private int memberAuth;

	public MemberVO() { }

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	public int getMemberAuth() {
		return memberAuth;
	}

	public void setMemberAuth(int memberAuth) {
		this.memberAuth = memberAuth;
	}
	
}
