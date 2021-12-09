package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.mapper.MemberMapper;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;

@Service
@Transactional
public class MemberService {
	
	@Autowired MemberMapper memberMapper;
	
	// 회원 정보 수정
	public void modifyMember(Member member) {
		memberMapper.updateMember(member);
	}
	
	//	회원 탈퇴
	public void removeMember(Member member, MemberOut memberOut) {
		memberMapper.deleteMember(member);
		memberMapper.insertMemberOut(memberOut);
	}	

}
