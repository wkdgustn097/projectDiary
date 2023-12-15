package com.example.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.NoticeMapper;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;


@Service
@Transactional
public class NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	
	public List<Notice> noticeList(int currentPage){
		// mapper
		int rowPerPage = 4;
		int beginRow = (currentPage-1) * rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Notice> resultNoticeList = noticeMapper.selectNotice(paramMap);
		
		return resultNoticeList;
	}
	
	public int noticeLastpage(int currentPage) {
		int rowPerPage = 4;
		int total = noticeMapper.noticeLastpage();
		int lastPage = total/rowPerPage;
		if(total % rowPerPage != 0) {
			lastPage = lastPage + 1;
		}
		return lastPage;
	}
	
	public Notice noticeOne(Notice notice) {
		
		Notice resultNotice = noticeMapper.selectNoticeOne(notice);
		
		return resultNotice;
	}
	
	public int noticeInsert(Notice notice, HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		notice.setMemberId(member.getMemberId());
		
		int row = noticeMapper.insertNotice(notice);
		
		return row;
	}
	
	public int noticeUpdate(Notice notice) {
		
		int row = noticeMapper.updateNotice(notice);
		
		return row;
	}
	
	public int noticeDelete(Notice notice) {
		
		int row = noticeMapper.deleteNotice(notice);
		
		return row;
	}

}
