package com.AourZ.PayStory.service;

import java.util.List;

import com.spring.web.vo.BoardVO;

public interface BoardService {
	
	List<BoardVO> getList(BoardVO searchVO);

}
