package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.MemberAddress;

@Mapper
public interface MemberAddressMapper {
	
	// [이승준] "회원주소 상세" 조회
	void selectMemberAddressOne(int memberNo);
	
	// [이승준] "회원주소" 삽입
	void insertMemberAddress(MemberAddress memberAddress);
	
	// [이승준] "회원주소" 수정
	void updateMemberAddress(MemberAddress memberAddress);
}
