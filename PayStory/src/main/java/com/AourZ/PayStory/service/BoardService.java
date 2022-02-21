package com.AourZ.PayStory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IBoardDAO;
import com.AourZ.PayStory.model.BoardVO;


@Service("BoardService")
public class BoardService implements IBoardService{
	
	@Autowired
	private IBoardDAO dao;

	@Override
	public List<BoardVO> getList(BoardVO searchVO) {
		 return dao.getList(searchVO);
	}}
