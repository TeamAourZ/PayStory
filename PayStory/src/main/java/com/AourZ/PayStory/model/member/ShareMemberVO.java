<<<<<<< HEAD:PayStory/src/main/java/com/AourZ/PayStory/model/accountBook/ShareMemberVO.java
package com.AourZ.PayStory.model.accountBook;
=======
package com.AourZ.PayStory.model.member;
>>>>>>> f8fd90aff269d14c09e5fd41a1773b30bd918564:PayStory/src/main/java/com/AourZ/PayStory/model/member/ShareMemberVO.java

public class ShareMemberVO {
	private String memberName;		// 회원 이름 (닉네임)
	private String memberEmail;		// 회원 이메일 아이디
	private String memberImage;	// 회원 프로필 이미지

	public String getMemberName() {
		return memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public String getMemberImage() {
		return memberImage;
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
