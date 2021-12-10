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
	
}
