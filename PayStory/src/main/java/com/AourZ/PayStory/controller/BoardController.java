package com.AourZ.PayStory.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
    
	// 천체 목록 
    @RequestMapping("/board/listAll")
    public String alllistView(Model model) {
    	ArrayList<BoardVO> boardList = service.getList();
    	model.addAttribute("boardList", boardList);
        return "/board/listView";
    }
    
    // 카테고리별 목록
    @RequestMapping("/board/listCategory")
    public ArrayList<BoardVO> categorylistView(@RequestParam String ctgNo) {
    	ArrayList<BoardVO> boardList = service.getCategoryList(ctgNo);
    	return boardList;
    }

    // 작성
    @RequestMapping("/board/create")
    public String create() {
        return "/board/newBoardForm";
    }

    // 수정
    @RequestMapping("/board/update")
    public String update() {
    	return "/board/updateBoardForm";
    }

    // 조회
    @RequestMapping("/board/view/{boardNo}")
    public String view(@PathVariable int boardNo, Model model) {
    	BoardVO board = service.boardView(boardNo);
    	model.addAttribute("board", board);
    	return "/board/view";
    }
}