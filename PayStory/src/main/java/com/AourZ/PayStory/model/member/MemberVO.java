package com.AourZ.PayStory.model.member;

public class MemberVO {
	private String memberNo;			// 회원 번호
	private String memberName;		// 회원 이름 (닉네임)
	private String memberEmail;		// 회원 이메일 아이디
	private String memberPwd;		// 회원 패스워드
	private String memberImage;	// 회원 프로필 이미지
	private int memberAuth;			// 회원 인증 유무
	private String memberJoinDate;	// 회원 가입 날짜
	private int memberRank;			// 회원 권한 확인
	private String memberSanctionTime; // 정지시간부여
	
	
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
	public String getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public int getMemberRank() {
		return memberRank;
	}
	public void setMemberRank(int memberRank) {
		this.memberRank = memberRank;
	}
	public String getMemberSanctionTime() {
		return memberSanctionTime;
	}
	public void setMemberSanctionTime(String memberSanctionTime) {
		this.memberSanctionTime = memberSanctionTime;
	}

	
}
