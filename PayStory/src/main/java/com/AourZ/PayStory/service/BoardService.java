package com.AourZ.PayStory.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IBoardDAO;
import com.AourZ.PayStory.model.board.BoardVO;


@Service("BoardService")
public class BoardService implements IBoardService{
	
	@Autowired
	private IBoardDAO dao;

	@Override
	public ArrayList<BoardVO> getList() {
		 return dao.getList();
	}

	public ArrayList<BoardVO> getCategoryList(String ctgNo) {
		return dao.getCategoryList(ctgNo);
	}

	public BoardVO boardView(int boardNo) {
		return dao.boardView(boardNo);
	}

	public int createBoard(BoardVO vo) {
		return dao.createBoard(vo);
	}
}
