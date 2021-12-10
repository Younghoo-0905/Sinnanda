package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Admin;

@Mapper
public interface AdminLoginMapper {
	//[윤경환] 관리자 로그인 정보 조회
	public Admin selectAdminLogin(Admin admin);
	
	
}
