package com.example.diary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.diary.mapper.MemberMapper;
import com.example.diary.vo.Member;

@Service
@Transactional // 트랜잭션
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;
	
	// 로그인
	public Member login(Member paramMember) {
		Member resultMember = memberMapper.login(paramMember);
		return resultMember;
	}
	
	// 회원가입
	public int addMember(Member paramMember) {
		int resultMember = memberMapper.insertMember(paramMember);
		return resultMember;
	}
	
	public int updateMember (Member paramMember) {
		int resultUpdateMember = memberMapper.updateMember(paramMember);

		return resultUpdateMember;
	}
	
	public int deleteMember (Member paramMember) {
		int resultDeleteMember = memberMapper.deleteMember(paramMember);

		return resultDeleteMember;
	}

}
