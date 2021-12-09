package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.LoginService;
import com.b2.Sinnanda.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired LoginService loginService;
	
	@GetMapping("login")
	public String showLogin() {
		return "login";
	}
	
	@GetMapping("insertUserForm")
	public String showInsertForm() {
		return "insertUserForm";
	}
	
	@PostMapping("login")
	public String actionLogin(HttpServletRequest request) {
		Member member = new Member();
		member.setMemberId(request.getParameter("userId"));
		member.setMemberPw(request.getParameter("userPw"));
		
		log.debug("입력된 값 : "+member.getMemberId()+", "+member.getMemberPw()+"<---------login");
		
		member = loginService.loginService(member);
		
		log.debug("검색한 정보 : "+member.toString());
		
		return "test";
	}
	
	@GetMapping("test")
	public String test() {
		return "test";
	}
	
}
