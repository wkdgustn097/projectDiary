package com.example.diary.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CalendarService {
	public Map<String, Object> getCalendar(Integer targetYear, Integer targetMonth){
		
		// 타겟 월의 1일
		Calendar firstDay = Calendar.getInstance();
		firstDay.set(Calendar.DATE, 1);
		
		// 넘어온 year,month가 null이 아니면 새로 들어온 값을 년 월로 바꿈
		if(targetYear != null && targetMonth != null) {
			firstDay.set(Calendar.YEAR, targetYear);
			firstDay.set(Calendar.MONTH, targetMonth);
		}
		
		// 0월에서 -1, 12월에서 +1이 되면 CalendarAPI에서 자동으로 년과 월이 변경된다.
		targetYear = firstDay.get(Calendar.YEAR);
		targetMonth = firstDay.get(Calendar.MONTH);
		
		// firstDate는 1일, lastDate는 API를 통하여 구한다.
		int lastDate = firstDay.getActualMaximum(Calendar.DATE);;
		
		// 1일과 lastDate를 이용하여 앞뒤공백(blank) 수를 구한다
		int beginBlank = firstDay.get(Calendar.DAY_OF_MONTH) - 1;
		int endBlank = 0;
		if((beginBlank + lastDate) % 7 !=0 ) {
			endBlank = 7 - ((beginBlank + lastDate) % 7) ;
		}
		
		// 전체 TD의 수
		int totalTd = beginBlank + lastDate + endBlank;
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("targetYear", targetYear);
		resultMap.put("targetMonth", targetMonth);
		resultMap.put("lastDate", lastDate);
		resultMap.put("beginBlank", beginBlank);
		resultMap.put("endBlank", endBlank);
		resultMap.put("totalTd", totalTd);
		
		System.out.println(resultMap);
		
		return resultMap;
	}
}
