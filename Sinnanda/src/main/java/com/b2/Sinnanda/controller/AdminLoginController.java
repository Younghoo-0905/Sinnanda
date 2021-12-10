package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.AdminLoginService;
import com.b2.Sinnanda.service.LoginService;
import com.b2.Sinnanda.vo.Admin;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminLoginController {

	@Autowired AdminLoginService adminLoginService;
	Admin loginAdmin = new Admin();
	
	//[윤경화]관리자 로그인 페이지 이동 
	@GetMapping("/adminLoginForm")
	public String adminLoginForm() {
		return "/adminLoginForm";
	}
	
	//[윤경환] 관리자 로그인 post
	@PostMapping("/adminLoginForm")
	public String actionAdminLogin(Admin admin, HttpServletRequest request) {
		HttpSession session = request.getSession();
		log.debug("입력된 값 : "+admin.getAdminId()+", "+admin.getAdminPw()+"<---------adminilogin");
		log.debug("검색한 정보 : "+(adminLoginService.getAdminLogin(admin)).toString());
		loginAdmin = adminLoginService.getAdminLogin(admin);
		
		log.debug("+++++++++++++++"+loginAdmin);
		session.setAttribute("loginAdmin", loginAdmin);
		return "index";
	}
	//[윤경환] amin 로그아웃 
	@GetMapping("/adminLogout")
	public String AdminLogout(HttpServletRequest request) {
	HttpSession session = request.getSession();
	session.invalidate();
	return "index";
	}
}

