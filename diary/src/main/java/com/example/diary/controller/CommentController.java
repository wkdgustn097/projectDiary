package com.example.diary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;
import com.example.diary.vo.Comment;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@GetMapping("/commentList")
	public String commentList(Model model,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		List<Comment> list = commentService.CommentList(currentPage);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		
		return "commentList";
	}
	
}
