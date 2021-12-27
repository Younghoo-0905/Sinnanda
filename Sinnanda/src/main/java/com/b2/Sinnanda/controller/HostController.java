package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.ComplainService;
import com.b2.Sinnanda.service.HostQnaService;
import com.b2.Sinnanda.service.HostService;
import com.b2.Sinnanda.service.ReviewService;
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
	@Autowired
	private ComplainService complainService;
	@Autowired
	private ReviewService reviewService;
	
	// [이승준] HostPage 보기
	@GetMapping("/host/hostPage")
	public String hostPage(HttpSession session, Model model, int hostNo) {
		dl.p("HostService", "hostPage() | Get", "[시작]");
		dl.p("hostPage()", "hostNo", hostNo);
		
		// 2. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		// 2-1. 로그인 세션 디버깅
		dl.p("hostPage", "loginUser", loginUser.toString());
		
		// 방어코드
		if(loginUser.getHost().getHostNo() != hostNo) {
			return "redirect:/index";
		}
		
		// 3. 답변이 없는 Host QnA 목록, 총 개수 조회
		Map<String, Object> noCommentedHostQnaMap = hostQnaService.getNoCommentsHostQnaListForHost(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), null, 0, 10);
		
		// 4. 답변이 없는 Review 목록, 총 개수 조회
		Map<String, Object> noCommentedReviewMap = reviewService.getNotCommentedReviewListForHost(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), 0, 10);
		
		// 5. 답변이 없는 Complain 목록, 총 개수 조회
		Map<String, Object> noCommentedComplainMap = complainService.getNotCommentedComplainListForHost(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), null, 0, 10);
		
		/* 모델 설정 */
		model.addAttribute("loginUser", loginUser);
		
		model.addAttribute("hostQnaList", noCommentedHostQnaMap.get("hostQnaList"));
		model.addAttribute("hostQnaListTotalCount", noCommentedHostQnaMap.get("totalCount"));
		
		model.addAttribute("reviewList", noCommentedReviewMap.get("reviewList"));
		model.addAttribute("reviewListTotalCount", noCommentedReviewMap.get("totalCount"));
		
		model.addAttribute("complainList", noCommentedComplainMap.get("complainList"));
		model.addAttribute("complainListTotalCount", noCommentedComplainMap.get("totalCount"));
		
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
