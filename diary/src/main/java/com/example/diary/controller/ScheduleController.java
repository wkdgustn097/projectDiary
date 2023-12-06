package com.example.diary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CalendarService;
import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;
import com.example.diary.vo.Schedule;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private CalendarService calendarService;
	
	
	@GetMapping("/scheduleOne")
	public String scheduleOne(HttpSession session, Model model
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
	
	@PostMapping("/scheduleOne")
	public String scheduleOne(HttpSession session, Model model, int Year, int Month, int Day,String emoji, String scheduleMemo) {
		// 로그인 후에만
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		Member member = (Member)session.getAttribute("loginMember");
		String memberId = member.getMemberId();
		
		scheduleService.insertSchedule(memberId, Year, Month, Day, emoji, scheduleMemo);
		
		return "redirect:/home";
	}
	
	@GetMapping("/scheduleUpdate")
	public String schedulUpdate(HttpSession session, int scheduleNo, Model model) {
		// 로그인 후에만
		if(session.getAttribute("loginMember") == null) {
			return "redirect:/login";
		}
		
		model.addAttribute("scheduleNo", scheduleNo);
		
		return "scheduleUpdate";
	}
	
	
	@PostMapping("/scheduleUpdate")
	public String schedulUpdate(String scheduleMemo, int scheduleNo, String emoji) {
		
		scheduleService.updateSchedule(scheduleMemo, scheduleNo, emoji);
		
		return "redirect:/home";
	}
	
	@GetMapping("/scheduleRemove")
	public String scheduleRemove(int scheduleNo) {
		
		scheduleService.deleteSchedule(scheduleNo);
		
		return "redirect:/home";
	}
	
	// 검색 기능
	@GetMapping("/scheduleListByWord")
	public String scheduleListByWord(Model model,
			@RequestParam(name = "word", defaultValue = "") String word,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		List<Schedule> list = scheduleService.getScheduleListByWord(word, currentPage);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		
		return "scheduleListByWord";
	}
	//------------------------------------------------------------
	
	@GetMapping("/scheduleListByDate")
	public String scheduleListByDate(
			@RequestParam(defaultValue = "") String year,
			@RequestParam(defaultValue = "") String month,
			@RequestParam(defaultValue = "") String day,
			Model model) {
		
		Map<String, Object> resultMap = scheduleService.getScheduleListByDate(year, month, day);
		
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("maxMinMap", resultMap.get("maxMinMap"));
				
		return "scheduleListByDate";
		
	}

}
