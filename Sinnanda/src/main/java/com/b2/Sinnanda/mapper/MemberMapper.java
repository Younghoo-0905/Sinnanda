package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;

@Mapper
public interface MemberMapper {
	// 마이페이지
	Member selectMyPage(int memberNo);
	
	// 회원 정보 수정
	int updateMember(Member member);
	//	회원 탈퇴
	int insertMemberOut(MemberOut memberOut);
	int deleteMember(Member member);
}
