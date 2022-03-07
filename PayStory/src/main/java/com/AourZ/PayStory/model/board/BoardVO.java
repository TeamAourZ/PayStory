package com.AourZ.PayStory.model.board;

public class BoardVO {
	private int boardNo;				// 게시글 번호
	private String boardTitle;			// 게시글 제목
	private String boardDate;			// 게시글 생성 날짜
	private int boardViews;				// 게시글 조회수
	private String boardContents;		// 게시글 내용
	private String boardFile;			// 게시글 첨부 파일
	private String memberNo;			// 게시글 게시자 회원번호
	private String memberName;			// 작성자 이름
	private String boardCategoryNo;		// 게시글 카테고리 번호
	private String boardCategoryName;	// 카테고리 명
  
	public Integer getBoardNo() {
		return boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public Integer getBoardViews() {
		return boardViews;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public String getBoardCategoryNo() {
		return boardCategoryNo;
	}

	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public void setBoardViews(Integer boardViews) {
		this.boardViews = boardViews;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public void setBoardCategoryNo(String boardCategoryNo) {
		this.boardCategoryNo = boardCategoryNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getBoardCategoryName() {
		return boardCategoryName;
	}

	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}
}