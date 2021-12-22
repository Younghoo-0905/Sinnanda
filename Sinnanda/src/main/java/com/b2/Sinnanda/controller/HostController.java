package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.HostService;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
public class HostController {
	@Autowired
	private DL dl;	// 조장이 만든 로그 출력 클래스
	@Autowired
	private HostService hostService;
	
	// [이승준] HostPage 보기
	@GetMapping("/host/hostPage")
	public String myPage() {
		dl.p("HostService", "getHostOne()", "[시작]");
		
		return "host/hostPage";
	}
	
	// [이승준] Host 정보 보기
	@GetMapping("/host/hostInfo")
	public String hostInfo(HttpSession session, Model model) {
		dl.p("HostController", "hostInfo()", "[시작]");
		
		// 1. 로그인된 세션 정보 조회
		User loginUser = (User)session.getAttribute("loginUser");
		// 1-1. 로그인된 세션 정보 디버깅
		if(loginUser != null) {
			dl.p("HostController", "loginUser", loginUser.toString());
		} else {
			dl.p("HostController", "loginUser", "null");
			return "redirect:/index";
		}
		
		// 2. 모델 추가
		model.addAttribute("loginUser", loginUser);
		
		return "host/hostInfo";
	}
}
