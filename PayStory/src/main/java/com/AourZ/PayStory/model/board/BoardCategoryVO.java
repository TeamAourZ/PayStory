package com.AourZ.PayStory.model.board;

public class BoardCategoryVO {
	private String boardCategoryNo;		// 게시판 카테고리 번호
	private String boardCategoryName;	// 게시판 카테고리 이름

	public String getBoardCategoryNo() {
		return boardCategoryNo;
	}

	public String getBoardCategoryName() {
		return boardCategoryName;
	}

	public void setBoardCategoryNo(String boardCategoryNo) {
		this.boardCategoryNo = boardCategoryNo;
	}

	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}
}
