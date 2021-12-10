package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.LoginService;
import com.b2.Sinnanda.service.MemberService;
import com.b2.Sinnanda.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired MemberService memberService;	//	[김영후]
	@Autowired LoginService loginService;
	Member loginMember = new Member();
	
	@GetMapping("login") //[이원희]로그인 페이지 이동 21.12.10
	public String showLogin() {
		return "login";
	}
	
	@GetMapping("insertMemberForm") //[이원희]회원가입 페이지 이동 21.12.10
	public String showInsertForm() {
		return "insertMemberForm";
	}
	
	@GetMapping("logout") //[이원희]로그아웃 21.12.10
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	@PostMapping("login")
	public String actionLogin(Member member, HttpServletRequest request) { // [이원희]로그인 액션 후 인덱스 페이지 이동 21.12.10
		HttpSession session = request.getSession();
		log.debug("입력된 값 : "+member.getMemberId()+", "+member.getMemberPw()+"<---------login");
		log.debug("검색한 정보 : "+(loginService.getLogin(member)).toString());
		loginMember = loginService.getLogin(member);
		log.debug("00000000000000000000000000000000000000"+loginMember);
		session.setAttribute("loginMember", loginMember);
		
			//	[김영후] 이메일 인증여부 확인
		int memberActive = memberService.getCertifyMember(member);
		log.debug("로그인 멤버 활성화 여부 : " + memberActive);
		if(memberActive == 0) {		//	active = 0 인 회원은 이메일 인증 화면으로
			return "certifyEmailForm";
		}
		
		return "index";	
	}
	
	@GetMapping("test")
	public String test() {
		return "test";
	}
	
}
