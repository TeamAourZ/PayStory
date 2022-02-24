package com.AourZ.PayStory.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.AourZ.PayStory.model.BoardVO;

@Service
public interface IBoardService {
	public ArrayList<BoardVO> getList();
	public ArrayList<BoardVO> getCategoryList(String ctgNo);
	public BoardVO boardView(int boardNo);
}
