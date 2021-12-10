package com.b2.Sinnanda.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;

@Mapper
public interface MemberMapper {
	// [유동진] 마이페이지
	int selectMyPage(int memberNo);
		
	// [유동진] 회원 정보 수정
	int updateMember(Member member);
	
	//	[김영후] 회원 가입
	int insertMember(Member member);
	
	//	[김영후] 회원 이메일 인증
	int certifyMember(Member member);
	int certifyMemberUpdate(Member member);
	
	//	[김영후] 회원 탈퇴
	int insertMemberOut(MemberOut memberOut);
	int deleteMember(Member member);
	
	//	[김영후] 회원 가입 시 ID 중복체크
	int checkId(String memberId);
}
