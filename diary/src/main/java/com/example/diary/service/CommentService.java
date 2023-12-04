package com.example.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.CommentMapper;
import com.example.diary.vo.Comment;


@Service
@Transactional
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	// 댓글 리스트
	public List<Comment> CommentList(int currentPage){
		int rowPerPage = 4;
		int beginRow = (currentPage-1) * rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Comment> resultCommentList = commentMapper.selectCommentList(paramMap);
		
		return resultCommentList;
	}
}
