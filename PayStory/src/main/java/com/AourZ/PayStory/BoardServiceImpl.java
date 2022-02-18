package com.AourZ.PayStory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.service.BoardService;
import com.spring.web.vo.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getList(BoardVO searchVO) {
		 return mapper.getList(searchVO);
	}}
