package com.AourZ.PayStory.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.AourZ.PayStory.model.BoardVO;

@Service
public interface IBoardService {
	
	List<BoardVO> getList(BoardVO searchVO);

}
