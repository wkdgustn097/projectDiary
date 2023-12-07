package com.example.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.mapper.MemberMapper;
import com.example.diary.service.MemberService;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;




@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("/login")
	public String login(HttpSession session,Model model) {
		// 로그인 전에만
		if(session.getAttribute("loginMember") != null) {
			return "redirect:/home";
		}
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Member paramMember) {
		// service로 이동 
		Member loginMember = memberService.login(paramMember);
		if(loginMember == null) {
			// 로그인 실패
			return "redirect:/login";
		}
		// 로그인 전에만
		
		session.setAttribute("loginMember", loginMember);
		
		return "redirect:/home";
	}
	
	/*
	 * // 회원가입 폼
	 * 
	 * @GetMapping("/addMember") public String addMember() {
	 * 
	 * return "memberAdd"; }
	 */
	
	// 회원가입 액션
	@PostMapping("/addMember")
	public String addMember(Member paramMember) {
		int resultMember = memberService.addMember(paramMember);
		
		System.out.println("dd");
		
		return "redirect:/login";
	}
	
	@GetMapping("/updateMember")
	public String updateMember(HttpSession session, int memberNo, Model model) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}		
		
		model.addAttribute("memberNo", memberNo);
		
		return "updateMember";
	}
	
	@PostMapping("/updateMember")
	public String updateMember(HttpSession session, Member member) {
		int row = memberService.updateMember(member);
		
		session.invalidate();
		return "redirect:/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/login";
	}
	
	@GetMapping(value = "/deleteMember")
	public String deleteMember(HttpSession session, int memberNo, Model model) {
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		model.addAttribute("memberNo", memberNo);
		
		return "deleteMember";
	}
	
	@PostMapping(value = "/deleteMember")
	public String deleteMember(HttpSession session,Member member) {
		
		int row = memberService.deleteMember(member);
		
		session.invalidate();
		
		return "redirect:/login";
	}

}
