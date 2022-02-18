package com.AourZ.PayStory;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.web.vo.BoardVO;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO>getList(BoardVO searchVO);

}
