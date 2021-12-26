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
	
	//	addComplainComment 요청
	@GetMapping("/host/removeComplainComment")
	public String removeComplainComment(int complainNo) {
		dl.p("ComplainController", "addComplainComment() | Get", "시작");
		dl.p("addComplainComment()", "complainNo", complainNo);
		
		complainService.removeComplainComment(complainNo);
		
		return "redirect:/host/myComplainOne?complainNo="+complainNo;
	}
	
	
	//	addComplainComment 요청
	@PostMapping("/host/addComplainComment")
	public String addComplainComment(ComplainComment complainComment) {
		dl.p("ComplainController", "addComplainComment()", "시작");
		dl.p("addComplainComment()", "complainComment", complainComment.toString());
		
		complainService.addComplainComment(complainComment);
		
		return "redirect:/host/myComplainOne?complainNo=" + complainComment.getComplainNo();
	}
	
	//	addComplain 요청
	@GetMapping("/member/addComplain")
	public String addComplain(Model model, int paymentNo) {
		dl.p("ComplainController", "addComplain", paymentNo);		
		model.addAttribute("paymentNo", paymentNo);
		
		return "/member/addComplain";
	}
	@PostMapping("/member/addComplain")
	public String addComplain(HttpSession session, Complain complain){
		dl.p("ComplainController", "addComplain", complain);
		
		User loginUser = (User)session.getAttribute("loginUser");
		complainService.addComplain(complain);
		
		return "/member/myPage?memberNo=" + loginUser.getMember().getMemberNo();
	}
	
	//	ComplainOne 요청
	@GetMapping("/host/myComplainOne")
	public String complainOne(HttpSession session, Model model, int complainNo) {
		dl.p("ComplainController", "complainOne()", complainNo);
		
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainOne()", "loginUser", loginUser.toString());
		
		Complain complain = complainService.getComplainOne(complainNo);
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("complain", complain);
		
		return "/host/myComplainOne";
	}
	
/*	//	ComplainList 요청 (아직 답변이 없는 ComplainList)
	@GetMapping("/host/notCommentedComplainList")
	public String complainList(HttpSession session, Model model) {

		User loginUser = (User)session.getAttribute("loginUser");
		//	세션 내 사업자 정보 디버깅
		dl.p("ComplainController", "complainList", loginUser);
		
		//List<Complain> complainList = complainService.getNotCommentedComplainList(loginUser.getHost().getHostNo());
		
		//model.addAttribute("complainList", complainList);
		
		return "/host/notCommentedComplainList";
	}*/
	
	//	ComplainList 요청
	@GetMapping("/host/myComplainList")
	public String complainList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String complainCategory) {
		dl.p("ComplainController", "complainList() | Get", "시작");
		
		// 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 로그인 세션 디버깅
		if(loginUser != null) {
			dl.p("complainList()", "loginUser", loginUser.toString());
		}
		
		// 출력을 시작하는 행 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1); 
		
		// complain 목록 조회
		Map<String, Object> map = complainService.getComplainList(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), complainCategory, currentPage, ROW_PER_PAGE);
		
		// 4. 10개의 page 번호를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("complainList()", "pageNo", pageNo);
		
		// 모델 추가
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("complainCategory", complainCategory);
		model.addAttribute("complainList", map.get("complainList"));
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNo", pageNo);
		
		return "/host/myComplainList";
	}
}
