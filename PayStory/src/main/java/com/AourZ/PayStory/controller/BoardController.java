package com.AourZ.PayStory.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.AourZ.PayStory.model.board.BoardVO;
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
    @RequestMapping("/board/listCategory/{ctgNo}")
    public ArrayList<BoardVO> categorylistView(@PathVariable String ctgNo) {
    	ArrayList<BoardVO> boardList = service.getCategoryList(ctgNo);
    	return boardList;
    }

    // 게시글 작성 폼을 이동
    @RequestMapping("/board/write")
    public String write() {
    	return "/board/newBoardForm";
    }
    
    // 게시글 작성
    @ResponseBody
    @RequestMapping("/board/create")
    public int create(@RequestParam(value="boardFile", required = false) MultipartFile file,
    		@RequestParam("boardTitle") String title,
    		@RequestParam("boardCategoryNo") String ctgNo,
    		@RequestParam("boardContents") String contents,
    		HttpSession session) throws IOException {
    	
    	// 파일 업로드 및 파일 이름 지정
		String fileName = null;
		if(file != null) {
			String uploadPath = "C:/PayStory/PayStory/src/main/resources/static/file/board/";

			String originalFileName = file.getOriginalFilename();
			fileName = originalFileName;
			String filePathName = uploadPath + originalFileName;
			// String uploadFileName = session.getAttribute("memberNo") +"_"+ session.getAttribute("accountBookNo")+"_"+originalFileName;
			// String filePathName = uploadPath + uploadFileName;
			File file1 = new File(filePathName);	

			file.transferTo(file1);
		}
		
		BoardVO vo = new BoardVO();
		vo.setBoardCategoryNo(ctgNo);
		vo.setBoardContents(contents);
		vo.setBoardFile(fileName);
		vo.setBoardTitle(title);
		vo.setMemberNo((String) session.getAttribute("sid"));
		
		service.createBoard(vo);
		int boardNo = vo.getBoardNo();
        return boardNo;
    }

    // 수정폼으로 이동
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
    
    @RequestMapping("/board/boardView")
    public String boardView(Model model) {
        return "/board/boardView";
    }
    
    @RequestMapping("/board/boardUpdateForm")
    public String boardUpdateForm(Model model) {
        return "/board/list";
    }
}