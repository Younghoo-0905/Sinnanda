package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Host;

@Mapper
public interface HostMapper {
	// [이승준] Host 상세 조회
	Host selectHostOne(int hostNo);
}
