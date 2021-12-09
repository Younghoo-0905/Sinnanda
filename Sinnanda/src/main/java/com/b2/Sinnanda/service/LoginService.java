package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.mapper.LoginMapper;
import com.b2.Sinnanda.vo.Member;

@Service
public class LoginService {
	
	@Autowired LoginMapper loginMapper;
	
	public Member loginService(Member member) {
		return loginMapper.login(member);
	}
}
