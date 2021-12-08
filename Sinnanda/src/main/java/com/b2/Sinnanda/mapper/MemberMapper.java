package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Member;

@Mapper
public interface MemberMapper {
	// 회원 정보 수정
	int updateMember(Member member);
}
