package com.AourZ.PayStory.model.member;

public class LoginVO {
	private String memberEmail;	// 로그인 이메일 아이디
	private String memberPwd;	// 로그인 패스워드

	public String getMemberEmail() {
		return memberEmail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

}