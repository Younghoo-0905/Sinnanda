package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.HostQnaService;
import com.b2.Sinnanda.vo.HostQna;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HostQnaController {
	@Autowired
	private HostQnaService hostQnaService;
	
	// [이승준] QnA 목록 페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
	
	// [이승준] Host QnA 상세 조회
	@GetMapping("/host/hostQnaOne")
	public String hostQnaOne(HttpServletRequest request, Model model, int hostQnaNo) {
		log.debug("[Debug] \"START\" HostQnaController.hostQnaOne() | Get");
		log.debug(" ├[param] hostQnaNo : "+hostQnaNo);
		
		// Host QnA 상세 조회
		HostQna hostQna = hostQnaService.getHostQnaOne(hostQnaNo);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute("hostQna", hostQna);	// 선택된 QnA 상세 정보 */
		
		return "qnaOne";
	}
	
	// [이승준] Host QnA 목록 조회
	@GetMapping("/host/hostQnaList")
	public String hostQnaList(HttpServletRequest request, Model model,
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String hostQnaCategory) {
		log.debug("[Debug] \"START\" HostQnaController.hostQnaList() | Get");
		log.debug(" ├[param] currentPage : "+currentPage);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
			return "redirect:/index";
		}
		
		// QnA 목록 조회
		Map<String, Object> map = hostQnaService.getHostQnaListByHostQnaCategory(loginUser.getHost().getHostNo(), hostQnaCategory, currentPage, ROW_PER_PAGE);
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute("hostQnaCategory", map.get("hostQnaCategory"));	// 선택된 QnA 카테고리
		model.addAttribute("hostQnaList", map.get("hostQnaList"));	// QnA 목록 정보
		model.addAttribute("lastPage", map.get("lastPage"));	// 마지막 페이지(페이징용)
		model.addAttribute("currentPage", currentPage);	// 현재 페이지
		
		return "host/hostQnaList";
	}
}
