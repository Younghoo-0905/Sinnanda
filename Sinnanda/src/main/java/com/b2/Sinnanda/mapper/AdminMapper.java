package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Admin;

@Mapper
public interface AdminMapper {
	//[윤경환] 관리자회원가입
	int insertAdmin(Admin admin);
	
	
	//[윤경환] 관리자 세부정보
	Admin selectAdminOne(int adminNo);
	
	//[윤경환] 관리자 회원정보 수정으로 이동 
	Admin modifyAdmin(String adminId, String adminPw);
	
	//[윤경환] 관리자 회원정보 수정 
	int modifyAdminForm(Admin admin);

	//[윤경환] 관리자 정보 
	Admin selectAdminName(int adminNo);

}
