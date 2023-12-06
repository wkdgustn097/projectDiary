package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	List<Map<String, Object>> selectScheduleListByMonth(Map<String, Object> paramMap);
	
	List<Map<String, Object>> selectScheduleByDay(Map<String, Object> paramMap);
	
	//
	List<Schedule> selectScheduleListByDate(Map<String, Integer> paramMap);
	
	Integer selectScheduleDateMaxYear();
	
	Integer selectScheduleDateMinYear();
	// ------------------------------------------------------------------
	
	// 검색 기능
	List<Schedule> selectScheduleListByWord(Map<String, Object> paramMap);
	// ------------------------------------------------------------------
	
	int insertSchedule(Map<String, Object> paramMap);
	
	int updateSchedule(Map<String, Object> paramMap);
	
	int removeSchedule(int scheduleNo);
	
	
}
