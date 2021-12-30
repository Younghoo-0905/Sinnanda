package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.HostAddress;

@Mapper
public interface HostAddressMapper {

	void selectHostAddressOne(int hostNo);
	
	void insertHostAddress(HostAddress hostAddress);
	
}
