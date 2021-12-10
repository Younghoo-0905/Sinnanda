package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Admin;

@Mapper
public interface AdminMapper {
	//[윤경환] 관리자회원가입
	int insertAdmin(Admin admin);
}
