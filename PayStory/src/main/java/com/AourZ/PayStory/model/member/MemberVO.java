package com.AourZ.PayStory.model.member;

public class MemberVO {
	private String memberNo;					// 회원 번호
	private String memberName;				// 회원 이름 (닉네임)
	private String memberEmail;				// 회원 이메일 아이디
	private String memberPwd;				// 회원 패스워드
	private String memberImage;			// 회원 프로필 이미지
	private Integer memberAuth;			// 회원 인증 유무
	private Integer memberRank;			// 회원 권한 레벨
	private String memberJoinDate;			// 회원 가입 날짜
	private String memberSanctionTime;	// 회원 제재 기간 (계정 정지)


	public String getMemberNo() {
		return memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public Integer getMemberAuth() {
		return memberAuth;
	}

	public Integer getMemberRank() {
		return memberRank;
	}

	public String getMemberJoinDate() {
		return memberJoinDate;
	}

	public String getMemberSanctionTime() {
		return memberSanctionTime;
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

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	public void setMemberAuth(Integer memberAuth) {
		this.memberAuth = memberAuth;
	}

	public void setMemberRank(Integer memberRank) {
		this.memberRank = memberRank;
	}

	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}

	public void setMemberSanctionTime(String memberSanctionTime) {
		this.memberSanctionTime = memberSanctionTime;
	}


}
