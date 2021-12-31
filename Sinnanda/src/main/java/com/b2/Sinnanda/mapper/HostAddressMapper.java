package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.HostAddress;

@Mapper
public interface HostAddressMapper {
	
	// [이승준] 사업자 주소 수정
	void updateHostAddress(HostAddress hostAddress);
	
	// [이승준] 사업자 주소 조회
	void selectHostAddressOne(int hostNo);
	
	// [이승준] 사업자 주소 삽입
	void insertHostAddress(HostAddress hostAddress);
	
}
