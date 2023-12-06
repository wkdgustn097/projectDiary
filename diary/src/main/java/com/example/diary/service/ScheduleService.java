package com.example.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.ScheduleMapper;
import com.example.diary.vo.Schedule;

@Service
@Transactional
public class ScheduleService {
	@Autowired
	private ScheduleMapper scheduleMapper;
	
	public List<Map<String, Object>> getScheduleListByMonth(String memberId, int Year, int Month){
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("memberId", memberId);
		paramMap.put("Year", Year);
		paramMap.put("Month", Month+1);
		
		List<Map<String, Object>> resultScheduleList = scheduleMapper.selectScheduleListByMonth(paramMap);
		return resultScheduleList;
	}
	
	public List<Map<String, Object>> getScheduleListByDay(String memberId, int Year, int Month, int Day){
		
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("memberId", memberId);
		paramMap.put("Year", Year);
		paramMap.put("Month", Month + 1);
		paramMap.put("Day", Day);
		
		System.out.println(paramMap);
		
		List<Map<String, Object>> resultSchueduleListDay = scheduleMapper.selectScheduleByDay(paramMap);
		
		System.out.println(resultSchueduleListDay);
		
		return resultSchueduleListDay;
	}
	
	public int insertSchedule(String memberId, int Year, int Month, int Day, String emoji, String scheduleMemo){
		
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("memberId", memberId);
		paramMap.put("Year",Year);
		paramMap.put("Month", String.format("%02d",Month + 1));
		paramMap.put("Day", String.format("%02d",Day));
		paramMap.put("emoji", emoji);
		paramMap.put("scheduleMemo", scheduleMemo);
		
		System.out.println(paramMap + "<--문제");
		
		int row = scheduleMapper.insertSchedule(paramMap);
	
		return row;
	}
	
	public int updateSchedule(String scheduleMemo, int scheduleNo, String emoji) {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("scheduleMemo", scheduleMemo);
		paramMap.put("scheduleNo", scheduleNo);
		paramMap.put("emoji", emoji);
		
		int row = scheduleMapper.updateSchedule(paramMap);
		
		return row;

	}
	
	public int deleteSchedule(int scheduleNo) {
		
		int row = scheduleMapper.removeSchedule(scheduleNo);
		
		return row;
	}
	
	// 검색 기능
	public List <Schedule> getScheduleListByWord(String word, int currentPage) {
		
		int rowPerPage = 10;
		int beginRow = (currentPage-1) * rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("word", word);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Schedule> list = null;
		
		list = scheduleMapper.selectScheduleListByWord(paramMap);
		
		return list;
	}
	// ---------------------------------------------------------------
	
	public Map<String, Object> getScheduleListByDate(String year, String month, String day){
		//월 범위
		
		Integer maxYear = scheduleMapper.selectScheduleDateMaxYear();
		Integer minYear = scheduleMapper.selectScheduleDateMinYear();
		
		Map<String, Integer> maxMinMap = new HashMap<>();
		
		maxMinMap.put("maxYear", maxYear);
		maxMinMap.put("minYear", minYear);
		
		// 스케줄 리스트
		Map<String, Integer> paraMap = new HashMap<>();
		if(year.equals("")) {
			paraMap.put("Year", null);
		} else {
			paraMap.put("Year", Integer.parseInt(year));
		}
		if(month.equals("")) {
			paraMap.put("Month", null);
		} else {
			paraMap.put("Month", Integer.parseInt(month));
		}
		if(day.equals("")) {
			paraMap.put("Day", null);
		} else {
			paraMap.put("Day", Integer.parseInt(day));
		}
		
		System.out.println(paraMap);
		
		List<Schedule> list = scheduleMapper.selectScheduleListByDate(paraMap);
		
		System.out.println(list);
		
		// 반환 맵
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("maxMinMap", maxMinMap); // 년도 최소,최대값
		resultMap.put("list", list); //조건결과 리스트
		
		
		
		return resultMap;
	}
}
