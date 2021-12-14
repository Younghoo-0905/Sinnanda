package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.mapper.AdminMapper;
import com.b2.Sinnanda.vo.Admin;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
	//[윤경환] 관리자회원가입
	public void addAdmin(Admin admin) {
		log.debug("<----------"+admin);
		adminMapper.insertAdmin(admin);
		
	}
	//[윤경환]관리자 상세 조회
	public Admin getAdminOne(int adminNo) {
		log.debug("adminNo++++++++++++"+adminNo);
		return adminMapper.selectAdminOne(adminNo);
		
	}
	
	//[윤경환] 관리자 수정 전 로그인 
	public Admin getModifyAdmin(String adminId, String adminPw) {
		log.debug("adminId++++++++++++"+adminId);
		log.debug("adminPw++++++++++++"+adminPw);
		
		return adminMapper.modifyAdmin(adminId, adminPw);
	}
	
	//[윤경환] 관리자 수정 
	public void getModifyAdminForm(Admin admin) {
		log.debug("Admin <--------------"+ admin);
		adminMapper.modifyAdminForm(admin);
	}
	
	public Admin getSelectAdminName(int adminNo) {
		log.debug("Admin <--------------"+ adminNo);
		return adminMapper.selectAdminName(adminNo);
	}

}
