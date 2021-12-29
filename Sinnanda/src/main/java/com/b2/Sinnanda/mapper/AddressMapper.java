package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Address;

@Mapper
public interface AddressMapper {
	
/* 1. 조회 */
	
	// [이승준] (상세)"주소 상세" 조회
	Address selectAddressOne(Address address);
	
}
