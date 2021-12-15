package com.b2.Sinnanda.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;
import com.b2.Sinnanda.vo.Qna;

@Mapper
public interface MemberMapper {
	// [유동진] 마이페이지
	Member selectMyPage(int memberNo);
		
	// [유동진] 회원 정보 수정
	int updateMember(Member member);
	
	// [유동진] 회원 비밀번호 변경전 현재 비밀번호 확인
	Member selectMemberPw(String memberPw);
	
	// [유동진] 회원 비밀번호 변경
	int updateMemberPw(Member member);
		
	//	[김영후] 회원 가입
	int insertMember(Member member);
	
	//	[김영후] 회원 이메일 인증		21.12.10
	int certifyMember(Member member);
	int certifyMemberUpdate(Member member);
	int selectCertifyMember(Member member);
	
	//	[김영후] 회원 탈퇴
	int insertMemberOut(MemberOut memberOut);
	int deleteMember(Member member);
	
	//	[김영후] 회원 가입 시 ID 중복체크
	int checkId(String memberId);
}
