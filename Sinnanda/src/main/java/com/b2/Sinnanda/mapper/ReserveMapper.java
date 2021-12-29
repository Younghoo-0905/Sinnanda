package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Reserve;

@Mapper
public interface ReserveMapper {
	//	Reserve 등록
	void insertReserve(Reserve reserve);
}
