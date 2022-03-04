package com.AourZ.PayStory.dao;

import java.util.ArrayList;
import java.util.List;

import com.AourZ.PayStory.model.board.BoardVO;
import com.AourZ.PayStory.service.IBoardService;

public interface IBoardDAO extends IBoardService {
	public ArrayList<BoardVO> getList();
	public ArrayList<BoardVO> getCategoryList(String ctgNo);
	public BoardVO boardView(int boardNo);
	public int createBoard(BoardVO vo);
	public List<BoardVO> noticeBoardList();
}
