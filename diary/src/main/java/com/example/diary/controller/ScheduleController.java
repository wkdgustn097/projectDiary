package com.example.diary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.service.CalendarService;
import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private CalendarService calendarService;
	@GetMapping("/scheduleOne")
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
		
		List<Map<String, Object>> scheduleList = scheduleService.getScheduleListByDay(memeberId, (int)(calendarMap.get("targetYear")), (int)(calendarMap.get("targetMonth")), targetDay );
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("targetYear", targetYear);
		model.addAttribute("targetMonth", targetMonth);
		model.addAttribute("targetDay", targetDay);

		
		
		return "scheduleOne";
	}

}
