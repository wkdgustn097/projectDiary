package com.example.diary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Comment;

@Mapper
public interface CommentMapper {
	
	List<Comment> selectCommentList(Map<String, Object> paramMap);
}
