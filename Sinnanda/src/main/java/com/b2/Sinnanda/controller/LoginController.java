package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.LoginService;
import com.b2.Sinnanda.service.MemberService;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired MemberService memberService;
	@Autowired LoginService loginService;
	
	User loginUser = new User();
	
	@GetMapping("insertMemberForm") //[이원희]회원가입 페이지 이동 21.12.10
	public String showInsertForm() {
		return "insertMemberForm";
	}
	
	// [이승준] 로그인
	@GetMapping("login") // [이원희]로그인 페이지 이동 21.12.10
	public String showLogin() {
		return "login";
	}
	@PostMapping("login")
	public String actionLogin(User user, HttpServletRequest request) { // [이원희]로그인 액션 후 인덱스 페이지 이동 21.12.10
		HttpSession session = request.getSession();
		log.debug(" ├[param] user : "+user.toString());
		
		loginUser = loginService.getLoginCheckAll(user);
		if(loginUser == null) {
			return "redirect:/login";
		}
		
		session.setAttribute("loginUser", loginUser);
		
		//	[김영후] 이메일 인증여부 확인
		if(loginUser.getMember() != null) {		//	로그인 요청한 유저가 Member인 경우 실행
			int memberActive = memberService.getCertifyMember(loginUser.getMember());
			log.debug("로그인 멤버 이메일 인증 여부 : " + memberActive);
			if(memberActive == 0) {		//	active = 0 인 Member는 이메일 인증 화면으로
				return "certifyEmailForm";
			}
		}		
		return "index";	
	}
	
	@GetMapping("logout") //[이원희]로그아웃 21.12.10
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	/*
	
	
	
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
	
	//[윤경환] 관리자 로그인 페이지 이동
	@GetMapping("adminLoginForm")
	public String adminLoginForm() {
		return "adminLoginForm";
	}
	
	
	//[윤경환] 관리자 로그인 post
		@PostMapping("adminLoginForm")
		public String actionAdminLogin(Admin admin, HttpServletRequest request) {
			HttpSession session = request.getSession();
			log.debug("입력된 값 : "+admin.getAdminId()+", "+admin.getAdminPw()+"<---------adminilogin");
			log.debug("검색한 정보 : "+(loginService.getAdminLogin(admin)).toString());
			loginAdmin = loginService.getAdminLogin(admin);
			
			log.debug(loginAdmin +"+++++++++++++++"+loginAdmin);
			session.setAttribute("loginAdmin", loginAdmin);
			return "adminPage";
		}
		*/
	
}
