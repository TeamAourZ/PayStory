package com.AourZ.PayStory.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.AourZ.PayStory.model.FileUtils;
import com.AourZ.PayStory.model.board.BoardVO;
import com.AourZ.PayStory.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	// 카테고리 번호 to 카테고리 이름 메서드
	String replaceCategory(String categoryNo) {
		String categoryName = service.selectBoardCategoryName(categoryNo);

		return categoryName;
	}
	
	// 회원 번호 to 회원 이름 메서드
	String replaceMember(String memberNo) {
		String memberName = service.selectMemberName(memberNo);
		return memberName;
	}

	// 천체 목록
	@RequestMapping("/board/listAll")
	public String alllistView(Model model) {
		ArrayList<BoardVO> boardList = service.getList();
		
		for (BoardVO board : boardList) {
			String boardCategoryName = replaceCategory(board.getBoardCategoryNo()); // 카테고리 번호 to 카테고리 이름
			String memberName = replaceMember(board.getMemberNo()); // 회원 번호 to 회원 이름

			board.setBoardCategoryName(boardCategoryName);
			board.setMemberName(memberName);
		}
		
		model.addAttribute("noticeBoardList",service.noticeBoardList()); // 공지사항리스트
		model.addAttribute("boardList", boardList);
		return "/board/listView";
	}

	// 카테고리별 목록
	@RequestMapping("/board/listCategory/{ctgNo}")
	public String categorylistView(@PathVariable String ctgNo, Model model) {
		ArrayList<BoardVO> boardList = service.getCategoryList(ctgNo);
		
		for (BoardVO board : boardList) {
			String boardCategoryName = replaceCategory(board.getBoardCategoryNo()); // 카테고리 번호 to 카테고리 이름
			String memberName = replaceMember(board.getMemberNo()); // 회원 번호 to 회원 이름

			board.setBoardCategoryName(boardCategoryName);
			board.setMemberName(memberName);
		}
		
		model.addAttribute("noticeBoardList",service.noticeBoardList()); // 공지사항리스트
		model.addAttribute("boardList", boardList);
		return "/board/listView";
	}

	// 게시글 작성 폼을 이동
	@RequestMapping("/board/write")
	public String write() {
		return "/board/newBoardForm";
	}

	// 게시글 작성
	@ResponseBody
	@RequestMapping("/board/create")
	public int create(@RequestParam(value = "file", required = false) MultipartFile file,
					  BoardVO vo,
					  HttpSession session) throws IOException {

		// 파일 업로드 및 파일 이름 지정
		if(file != null) { 
			String fileName = FileUtils.uploadBoardFile(file, session);
			vo.setBoardFile(fileName);
		};
		
		vo.setMemberNo((String) session.getAttribute("memberNo"));
						
		service.createBoard(vo); 
		int boardNo = vo.getBoardNo();
		 
		return boardNo;
	}

	// 조회수 추가
	@ResponseBody
	@RequestMapping("/board/updateViews")
	public int updateViews(@RequestParam HashMap<String, Object> map) {
		int result = service.updateViews(map);
		return result;
	}
	
	// 조회
	@RequestMapping("/board/view/{boardNo}")
	public String view(@PathVariable int boardNo, Model model) {
		BoardVO board = service.boardView(boardNo);
		String boardCategoryName = replaceCategory(board.getBoardCategoryNo()); // 카테고리 번호 to 카테고리 이름
		String memberName = replaceMember(board.getMemberNo()); // 회원 번호 to 회원 이름
		
		board.setBoardCategoryName(boardCategoryName);
		board.setMemberName(memberName);
		
		model.addAttribute("board", board);
		return "/board/boardView";
	}
	
	// 게시글 수정 폼으로 이동
	@RequestMapping("/board/updateForm/{boardNo}")
	public String updateForm(@PathVariable int boardNo, Model model) {
		BoardVO board = service.boardView(boardNo);
		String memberName = replaceMember(board.getMemberNo()); // 회원 번호 to 회원 이름
		board.setMemberName(memberName);
		
		model.addAttribute("board", board);
		return "/board/updateBoardForm";
	}

	// 수정
	@ResponseBody
	@RequestMapping("/board/update")
	public int update(@RequestParam(value = "file", required = false) MultipartFile file,
					  @RequestParam(value = "boardFileInDB", required = false) String fileNameDB,
					  BoardVO vo,
					  HttpSession session) throws IOException {

		String memberNo = (String) session.getAttribute("memberNo");
		
		// 파일 업로드 및 파일 이름 지정
		if(file != null) { 
			String fileName = FileUtils.uploadBoardFile(file, session);
			vo.setBoardFile(fileName);
		};
		
		// 서버에서 삭제
		if(fileNameDB != null) {
			FileUtils.removeBoardFile(memberNo, fileNameDB);
		}
						
		int result = service.updateBoard(vo); 
		 
		return result;
	}
	
	// 삭제
	@RequestMapping("/board/delete/{boardNo}")
	public String delete(@PathVariable int boardNo) {
		service.deleteBoard(boardNo);
		return "redirect:/board/listAll";
	}
}