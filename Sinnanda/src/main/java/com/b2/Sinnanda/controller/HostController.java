package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.HostQnaService;
import com.b2.Sinnanda.service.HostService;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
public class HostController {
	@Autowired
	private DL dl;	// 조장이 만든 로그 출력 클래스
	@Autowired
	private HostService hostService;
	@Autowired
	private HostQnaService hostQnaService;
	
	// [이승준] HostPage 보기
	@GetMapping("/host/hostPage")
	public String hostPage(HttpSession session, Model model) {
		dl.p("HostService", "hostPage()", "[시작]");
		
		// 2. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		// 2-1. 로그인 세션 디버깅
		if(loginUser != null) {
			dl.p("hostPage", "loginUser", loginUser.toString());
		} else {
			dl.p("hostPage", "loginUser", "Null");
			return "redirect:/index";
		}
		
		// 답변이 없는 host QnA 조회
		Map<String, Object> map = hostQnaService.getNoCommentsHostQnaList(loginUser.getUserLevel(), null, 1, 10);
		
		
		/* 모델 설정 */
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("hostQnaList", map.get("hostQnaList"));
		
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
