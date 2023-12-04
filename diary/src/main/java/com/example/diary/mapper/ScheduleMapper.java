package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	List<Map<String, Object>> selectScheduleListByMonth(Map<String, Object> paramMap);
	
	List<Map<String, Object>> selectScheduleByDay(Map<String, Object> paramMap);
}
