package com.AourZ.PayStory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.AourZ.PayStory.service.BoardService;
import com.spring.web.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService BoardService;
    
    @RequestMapping(value = "/board/list", method = RequestMethod.GET)
    public String list(@ModelAttribute("searchVO") BoardVO searchVO, Model model) {
    	
    	List<BoardVO> boardList = BoardService.getList(searchVO);
		
		model.addAttribute("boardList",boardList);
        
        return "/board/list";
    }
 
}