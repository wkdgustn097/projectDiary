package com.example.diary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.CommentMapper;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Notice;


@Service
@Transactional
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	// 댓글 리스트
	public List<Comment> CommentList(int currentPage,Notice notice){
		int rowPerPage = 4;
		int beginRow = (currentPage-1) * rowPerPage;
		
		System.out.println(notice.getNoticeNo() + "뭐가 문제야 베이비");
		
		int noticeNo = notice.getNoticeNo();
		
		
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("noticeNo", noticeNo);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		System.out.println(paramMap.toString() + "???");
		
		
		List<Comment> resultCommentList = commentMapper.selectCommentList(paramMap);
	
		System.out.println(resultCommentList);
		
		return resultCommentList;
	}
	
	public int commentLastpage(int currentPage, Notice notice) {
		int noticeNo = notice.getNoticeNo();
		
		int rowPerPage = 4;
		int total = commentMapper.commentLastpage(noticeNo);
		int lastPage = total/rowPerPage;
		if(total % rowPerPage != 0) {
			lastPage = lastPage + 1;
		}
		return lastPage;
	}
	
	public int addComment(Comment comment) {
		
		int row = commentMapper.insertComment(comment);
		return row;
	}
	
	public int updateComment(Comment comment) {
		
		int row = commentMapper.updateComment(comment);
		return row;
	}
	
	public int removeComment(Comment comment) {
		
		int row = commentMapper.removeComment(comment);
		return row;
	}
}
