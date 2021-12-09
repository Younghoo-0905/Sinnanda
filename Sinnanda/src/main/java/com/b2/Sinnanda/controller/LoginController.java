package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	Member loginMember = new Member();
	
	@GetMapping("login") //로그인 페이지
	public String showLogin() {
		return "login";
	}
	
	@GetMapping("insertUserForm") // 회원가입 페이지
	public String showInsertForm() {
		return "insertMemberForm";
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	@PostMapping("login")
	public String actionLogin(Member member, HttpServletRequest request) { // 로그인 액션 후 인덱스 페이지 이동
		HttpSession session = request.getSession();
		log.debug("입력된 값 : "+member.getMemberId()+", "+member.getMemberPw()+"<---------login");
		log.debug("검색한 정보 : "+(loginService.loginService(member)).toString());
		loginMember = loginService.loginService(member);
		log.debug("00000000000000000000000000000000000000"+loginMember);
		session.setAttribute("loginMember", loginMember);
		return "index";	
	}
	
	@GetMapping("test")
	public String test() {
		return "test";
	}
	
}
