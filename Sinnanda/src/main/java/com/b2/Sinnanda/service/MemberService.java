package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.mapper.MemberMapper;
import com.b2.Sinnanda.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired MemberMapper memberMapper;
	
	// 회원 정보 수정
	public void modifyMember(Member member) {
		memberMapper.updateMember(member);
	}
}
