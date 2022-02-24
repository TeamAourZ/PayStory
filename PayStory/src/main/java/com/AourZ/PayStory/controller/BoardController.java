package com.AourZ.PayStory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
    
    @RequestMapping("/board/list")
    public String list(Model model) {
        return "/board/list";
    }
    
    @RequestMapping("/board/create")
    public String create(Model model) {
        return "/board/create";
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