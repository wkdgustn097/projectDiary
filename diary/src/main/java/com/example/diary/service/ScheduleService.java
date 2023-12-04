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
}
