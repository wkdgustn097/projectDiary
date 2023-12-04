package com.example.diary.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.diary.vo.Member;

@Mapper
public interface MemberMapper {
	// 로그인
	Member login(Member member);
	
	// 회원가입
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int deleteMember(Member member);
	
}
