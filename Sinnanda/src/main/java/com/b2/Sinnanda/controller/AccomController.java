package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.AccomService;
import com.b2.Sinnanda.vo.Accom;
import com.b2.Sinnanda.vo.Host;
import com.b2.Sinnanda.vo.User;

@Controller
public class AccomController {
	@Autowired
	private AccomService accomService;
	@Autowired
	private DL dl;
	
	//	페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
/* 1. 조회 */
	
	// [이승준] "숙소 상세+주소" 조회
	@GetMapping("host/myAccomOne")
	public String getAccomOne(HttpSession session, Model model, int accomNo, 
			@RequestParam(defaultValue = "1") int currentPage) {
		dl.p("AccomController", "getAccomOne() | Get", "[시작]");
		dl.p("getAccomOne()", "accomNo", accomNo);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("getAccomOne()", "loginUser", loginUser);
		
		// 2. 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		// 3. "사업자 상세" 조회 서비스 호출
		Map<String, Object> map = accomService.getAccomOne(accomNo, beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 페이지번호의를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		
		// 4. 모델 전달
		model.addAttribute("accom", map.get("accom"));
		model.addAttribute("roomListTotalCount", map.get("totalCount"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("pageNo", pageNo);
		
		return "host/myAccomOne";
	}
	
	
	// [이승준] "사업자 소유의 숙소 목록" 조회 | 사업자페이지
	@GetMapping("host/myAccomList")
	public String getAccomListByHost(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {
		dl.p("AccomController", "getAccomListByHost() | Get", "[시작]");
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("getAccomListByHost()", "loginUser", loginUser);
		
		// 2. 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		// 3. "사업자 소유의 숙소 목록" 조회 서비스 호출
		Map<String, Object> map = accomService.getAccomListByHost(loginUser.getHost().getHostNo(), beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 페이지번호의를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("getAccomListByHost()", "pageNo", pageNo);
		
		// 5. 모델 전달
		model.addAttribute("accomList", map.get("accomList"));
		model.addAttribute("accomListTotalCount", map.get("totalCount"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("pageNo", pageNo);
		
		return "host/myAccomList";
	}
}
