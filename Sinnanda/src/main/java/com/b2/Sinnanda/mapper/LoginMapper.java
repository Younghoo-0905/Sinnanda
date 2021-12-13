package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Member;

@Mapper
public interface LoginMapper {
	//[이원희] 로그인 정보 조회 쿼리 21.12.10
	public Member selectlogin(Member member); 
	
	//[윤경환] 관리자 로그인 정보 조회
	public Admin selectAdminLogin(Admin admin);
}
