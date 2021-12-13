package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.mapper.LoginMapper;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Member;

@Service
public class LoginService {
	
	@Autowired LoginMapper loginMapper;
	Member loginMember = new Member();
	Admin loginAdmin = new Admin();
	
	public Member getLogin(Member member) {
		
		//[이원희]로그인 결과가 없으면 null 있으면 멤버 반환 21.12.10
		loginMember = loginMapper.selectlogin(member);
		if(loginMember == null) {
			return null;
		}
		return loginMember;
	}
	
	//[윤경환] 관리자 로그인 null이면 null리턴 아니면 loginAdmin 반환
		public Admin getAdminLogin(Admin admin) {
			loginAdmin = loginMapper.selectAdminLogin(admin);
			if(loginAdmin == null) {
				return null;
			}
			return loginAdmin;
			
		}
}
