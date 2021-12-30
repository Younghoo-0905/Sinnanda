package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.MemberAddress;

@Mapper
public interface MemberAddressMapper {
	
	void selectMemberAddressOne(int memberNo);
	
	void insertMemberAddress(MemberAddress memberAddress);
}
