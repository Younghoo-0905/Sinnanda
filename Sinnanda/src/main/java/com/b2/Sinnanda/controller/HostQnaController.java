package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.HostQnaService;
import com.b2.Sinnanda.vo.HostQna;
import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host/*")
public class HostQnaController {
	@Autowired
	private HostQnaService hostQnaService;
	
	// [이승준] QnA 목록 페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
	
	// [이승준] Host QnA 상세 조회
	@GetMapping("/hostQnaOne")
	public String hostQnaOne(HttpServletRequest request, Model model, int hostQnaNo) {
		log.debug("[Debug] \"START\" HostQnaController.hostQnaOne() | Get");
		log.debug(" ├[param] hostQnaNo : "+hostQnaNo);
		
		// Host QnA 상세 조회
		HostQna hostQna = hostQnaService.getHostQnaOne(hostQnaNo);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		// 작성한 사업자 이거나 관리자만 접근 가능
		if((hostQna.getHostQnaNo() != loginUser.getHost().getHostNo()) || (loginUser.getUserLevel() != 3)) {
			
		}
		
		/*
		// 작성한 사업자 또는 관리자 외에는 접근 방지
		if(hostQna.getHostQnaNo() == loginUser.getHost().getHostNo()) {
			log.debug(" ├[param] 글 작성한 hostNo : "+hostQna.getHostQnaNo());
			log.debug(" ├[param] 현재 세션 hostNo : "+loginUser.getHost().getHostNo());
			
			// Host QnA 작성자와 현재 접근하려는 사람이 맞는지 확인
			if(loginUser.getUserLevel() != 3) {
				if(qna.getMemberNo() != loginUser.getMember().getMemberNo()) {
					return "redirect:/qnaList";
				}
			}
		}
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute(hostQnaNo);	// 선택된 QnA 상세 정보 */
		
		return "qnaOne";
	}
	
	// [이승준] Host QnA 목록 조회
	@GetMapping("/hostQnaList")
	public String hostQnaList(HttpServletRequest request, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String hostQnaCategory) {
		log.debug("[Debug] \"START\" HostQnaController.hostQnaList() | Get");
		log.debug(" ├[param] currentPage : "+currentPage);
		
		// QnA 목록 조회
		Map<String, Object> map = hostQnaService.getHostQnaListByQnaCategory(hostQnaCategory, currentPage, ROW_PER_PAGE);
		
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
		model.addAttribute("qnaCategory", map.get("qnaCategory"));	// 선택된 QnA 카테고리
		model.addAttribute("qnaList", map.get("qnaList"));	// QnA 목록 정보
		model.addAttribute("lastPage", map.get("lastPage"));	// 마지막 페이지(페이징용)
		model.addAttribute("currentPage", currentPage);	// 현재 페이지
		
		return "hostQnaList";
	}
}
