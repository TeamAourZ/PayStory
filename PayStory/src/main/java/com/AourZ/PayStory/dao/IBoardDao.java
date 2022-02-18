package com.AourZ.PayStory.dao;

import java.util.List;

import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.service.IBoardService;

public interface IBoardDao extends IBoardService {
	
	public List<BoardVO> getList(BoardVO searchVO);

}
