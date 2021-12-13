package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.mapper.LoginMapper;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class LoginService {
	
	@Autowired LoginMapper loginMapper;
	User loginUser = new User();
	
	// [이승준] 통합 로그인 
	public User getLoginCheckAll(User user) {
		log.debug("[Debug] \"START\" LoginService.getLoginCheckAll()");
		log.debug(" ├[param] user : "+user.toString());
		
		loginUser = loginMapper.selectLoginCheckAll(user);
		log.debug(" ├[param] userLevel : "+loginUser.getUserLevel());
		
		// 회원인 경우
		if(loginUser.getUserLevel() == 1) {
			log.info(" ├[info] 회원 로그인");
			Member member = new Member();
			
			member.setMemberId(loginUser.getUserId());
			member.setMemberPw(loginUser.getUserPw());
			
			member = loginMapper.selectMemberLogin(member);
			log.debug(" ├[param] member : "+member.toString());
			loginUser.setMember(member);
		// 사업자인 경우
		} else if(loginUser.getUserLevel() == 2) {
			log.info(" ├[info] 사업자 로그인");
			
		// 관리자인 경우
		} else if(loginUser.getUserLevel() == 3) {
			log.info(" ├[info] 관리자 로그인");
			Admin admin = new Admin();
			
			admin.setAdminId(loginUser.getUserId());
			admin.setAdminPw(loginUser.getUserPw());
			
			admin = loginMapper.selectAdminLogin(admin);
			log.debug(" ├[param] admin : "+admin.toString());
			loginUser.setAdmin(admin);
		}
		
		return loginUser;
	}
}
