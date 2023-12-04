package com.example.diary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;
import com.example.diary.service.NoticeService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private CommentService commentService;

	
	@GetMapping(value = "/noticeList")
	public String noticeList(Model model,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		List<Notice> list = noticeService.noticeList(currentPage);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		
		return "noticeList";
	}
	
	@GetMapping(value = "/noticeOne")
	public String selectNoticeOne(Notice notice, Model model,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		System.out.println(notice.getNoticeNo());
		
		List<Comment> list = commentService.CommentList(currentPage);		
		Notice resultNotice = noticeService.noticeOne(notice);
		
		model.addAttribute("resultNotice", resultNotice);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		
		return "noticeOne";
	}
	
	@GetMapping(value = "/addNotice")
	public String addNotice(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member.getMemberLevel() == 0) {
			return "redirect:/noticeList";
		}
		
		return "addNoticeList";
	}
	
	@PostMapping(value = "/addNotice")
	public String addNotice(Notice notice, Model model, HttpSession session) {
		
		int row = noticeService.noticeInsert(notice, session);
		
		// mapper 호출
		return "redirect:/noticeList";
	}
	
	@GetMapping(value = "/updateNotice")
	public String updateNotice(HttpSession session, int noticeNo, Model model) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member.getMemberLevel() == 0) {
			return "redirect:/noticeList";
		}
		
		model.addAttribute("noticeNo", noticeNo);
		
		return "updateNotice";
	}
	
	@PostMapping(value = "/updateNotice")
	public String updateNotice(HttpSession session, Notice notice) {
		int row = noticeService.noticeUpdate(notice);
		
		return "redirect:/noticeList";
	}
	
	@GetMapping(value = "/deleteNotice")
	public String deleteNotice(HttpSession session, int noticeNo, Model model) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member.getMemberLevel() == 0) {
			return "redirect:/noticeList";
		}
		
		model.addAttribute("noticeNo", noticeNo);
		
		return "deleteNotice";
	}
	
	@PostMapping(value = "/deleteNotice")
	public String deleteNotice(Notice notice) {
		System.out.println(notice.getNoticeNo());
		
		int row = noticeService.noticeDelete(notice);
		
		return "redirect:/noticeList";
	}
}