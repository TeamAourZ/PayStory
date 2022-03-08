package com.AourZ.PayStory.model.accountBook;

public class MainBoardVO {
	private Integer boardNo;					// 게시글 번호
	private String boardCategoryName;	// 게시글 카테고리
	private String boardTitle;					// 게시글 제목
	private String memberName;				// 게시글 게시자

	public Integer getBoardNo() {
		return boardNo;
	}

	public String getBoardCategoryName() {
		return boardCategoryName;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}

	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

}
