package com.example.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.CommentService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;

	@GetMapping("/addComment")
	public String addComment(HttpSession session, int noticeNo, Model model) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		model.addAttribute("noticeNo", noticeNo);
	
		return "addComment";
	}
	
	@PostMapping("/addComment")
	public String addComment(HttpSession session,Comment comment) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		Member member = (Member)(session.getAttribute("loginMember"));
		
		comment.setMemberId(member.getMemberId());
		if(comment.getIsSecret() == null) {
			comment.setIsSecret("false");
		}
		
		commentService.addComment(comment);
		
		return "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
	}
	
	@GetMapping("/updateComment")
	public String updateComment(HttpSession session,String writer, Model model, int commentNo, int noticeNo) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		model.addAttribute("commentNo", commentNo);
		model.addAttribute("writer", writer);
		model.addAttribute("noticeNo", noticeNo);
	
		return "updateComment";
	}
	
	@PostMapping("/updateComment")
	public String updateComment(HttpSession session,Comment comment,String writer) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		Member member = (Member)(session.getAttribute("loginMember"));
		
		System.out.println(writer);
		System.out.println(member.getMemberId());
		
		if(!(member.getMemberId().equals(writer))) {
			return "redirect:/home";
		}
		
		comment.setMemberId(member.getMemberId());

		commentService.updateComment(comment);
		
		return "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
	}
	
	@GetMapping("/removeComment")
	public String removeComment(HttpSession session,String writer,Comment comment) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		Member member = (Member)(session.getAttribute("loginMember"));

		if(!(member.getMemberId().equals(writer))) {
			return "redirect:/home";
		}
		
		commentService.removeComment(comment);
	
		return "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
	}
}
