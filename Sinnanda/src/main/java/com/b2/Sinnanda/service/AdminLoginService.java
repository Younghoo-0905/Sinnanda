package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.mapper.AdminLoginMapper;
import com.b2.Sinnanda.vo.Admin;
@Service
public class AdminLoginService {

	@Autowired AdminLoginMapper adminLoginMapper;
	
	Admin loginAdmin = new Admin();
	//[윤경환] 관리자 로그인 null이면 null리턴 아니면 loginAdmin 반환
	public Admin getAdminLogin(Admin admin) {
		loginAdmin = adminLoginMapper.selectAdminLogin(admin);
		if(loginAdmin == null) {
			return null;
		}
		return loginAdmin;
		
	}
	

}
