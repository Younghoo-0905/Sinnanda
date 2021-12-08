package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired LoginService loginService;
	
	@GetMapping("login")
	public String showLogin() {
		return "login";
	}
	
	@PostMapping("login")
	public String actionLogin(HttpServletRequest request) {
		String id = (request.getParameter("userId"));
		String pw = (request.getParameter("userPw"));
		log.debug(id+pw+"<---------login");
		return "test";
	}
	
	@GetMapping("test")
	public String test() {
		return "test";
	}
	
}
