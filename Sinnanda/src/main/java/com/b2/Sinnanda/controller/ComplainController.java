package com.b2.Sinnanda.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.ComplainService;
import com.b2.Sinnanda.vo.Complain;
import com.b2.Sinnanda.vo.ComplainComment;
import com.b2.Sinnanda.vo.User;

@Controller
public class ComplainController {	//	[김영후]
	@Autowired
	ComplainService complainService;
	@Autowired
	DL dl;

	//	페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
/* 1. 조회 */
	
	// [이승준] "컴플레인 목록" 조회 | 사업자페이지
	@GetMapping("/host/myComplainList")
	public String getComplainList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String complainCategory) {
		dl.p("ComplainController", "getComplainList() | Get", "시작");
		dl.p("getComplainList()", "currentPage", currentPage);
		dl.p("getComplainList()", "complainCategory", complainCategory);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		// 3. "컴플레인 목록" 조회 서비스 호출
		Map<String, Object> map = complainService.getComplainList(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), complainCategory, beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 페이지번호의를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("complainList()", "pageNo", pageNo);
		
		// 5. 모델 전달
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("complainCategory", complainCategory);
		model.addAttribute("complainList", map.get("complainList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		
		return "/host/myComplainList";
	}
	
	// [이승준] "컴플레인 상세" 조회 | 사업자페이지
	@GetMapping("/host/myComplainOne")
	public String getComplainOne(HttpSession session, Model model, int complainNo) {
		dl.p("ComplainController", "getComplainOne() | Get", "시작");
		dl.p("getComplainOne()", "complainNo", complainNo);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. "컴플레인 상세" 조회 서비스 호출
		Complain complain = complainService.getComplainOne(complainNo);
		
		// 3. 모델 전달
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("complain", complain);
		
		return "/host/myComplainOne";
	}
	
/* 2. 삽입 */
	
	// [이승준] "컴플레인" 삽입 | 회원페이지
	@GetMapping("/member/addComplain")
	public String addComplain(HttpSession session, Model model, int paymentNo) {
		dl.p("ComplainController", "addComplain() | Get", "시작");
		dl.p("addComplain()", "paymentNo", paymentNo);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. 모델 전달
		model.addAttribute("paymentNo", paymentNo);	// "컴플레인 삽입"에 필요한 "결제번호"
		model.addAttribute("loginUser", loginUser);
		
		return "/member/addComplain";
	}
	@PostMapping("/member/addComplain")
	public String addComplain(HttpSession session, Complain complain){
		dl.p("ComplainController", "addComplain() | Post", "시작");
		dl.p("addComplain()", "complain", complain.toString());
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 2. "컴플레인" 삽입 서비스 호출
		complainService.addComplain(complain);
		
		return "/member/myPage?memberNo=" + loginUser.getMember().getMemberNo();
	}
	
	// [이승준] "컴플레인 답변" 삽입 | 사업자페이지
	@PostMapping("/host/addComplainComment")
	public String addComplainComment(ComplainComment complainComment) {
		dl.p("ComplainController", "addComplainComment() | Post", "시작");
		dl.p("addComplainComment()", "complainComment", complainComment.toString());
		
		// 1. "컴플레인 답변" 삽입 서비스 호출
		complainService.addComplainComment(complainComment);
		
		return "redirect:/host/myComplainOne?complainNo=" + complainComment.getComplainNo();
	}
	
	
	
	
	
/* 3. 수정 */
	
	
	
	
	
/* 4. 삭제 */
	
	// [이승준] "컴플레인 답변" 삭제 | 사업자페이지
	@GetMapping("/host/removeComplainComment")
	public String removeComplainComment(int complainNo) {
		dl.p("ComplainController", "removeComplainComment() | Get", "시작");
		dl.p("removeComplainComment()", "complainNo", complainNo);
		
		// 1. "컴플레인 답변" 삭제 서비스 호출
		complainService.removeComplainComment(complainNo);
		
		return "redirect:/host/myComplainOne?complainNo="+complainNo;
	}
	
	
	
}
