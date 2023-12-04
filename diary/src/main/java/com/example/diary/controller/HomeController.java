package com.example.diary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CalendarService;
import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	private CalendarService calendarService;
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/home")
	public String home(HttpSession session, Model model
			, @RequestParam(required = false) Integer targetYear
			, @RequestParam(required = false) Integer targetMonth
			, @RequestParam(required = false) Integer targetDay) {
		// 로그인 후에만
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		Member member = (Member)session.getAttribute("loginMember");
		String memeberId = member.getMemberId();
		
		Map<String, Object> calendarMap = calendarService.getCalendar(targetYear, targetMonth);
		model.addAttribute("calendarMap", calendarMap);
		
		List<Map<String, Object>> list = scheduleService.getScheduleListByMonth(memeberId, (int)(calendarMap.get("targetYear")),(int)(calendarMap.get("targetMonth")));
		model.addAttribute("list", list);
		
		return "home";
	}
}
