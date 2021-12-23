package com.b2.Sinnanda.controller;

import java.util.List;

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
	@PostMapping("/host/addComplainComment")
	public String addComplainComment(ComplainComment complainComment) {
		dl.p("ComplainController", "addComplainComment", complainComment);		
		complainService.addComplainComment(complainComment);
		
		return "redirect:/host/complainOne?complainNo=" + complainComment.getComplainNo();
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
	@GetMapping("/host/complainOne")
	public String complainOne(HttpServletRequest request, Model model, int complainNo) {
		dl.p("ComplainController", "complainList", complainNo);
		
		Complain complain = complainService.getComplainOne(complainNo);
		model.addAttribute("complain", complain);
		
		return "/host/complainOne";
	}
	
	//	ComplainList 요청 (아직 답변이 없는 ComplainList)
	@GetMapping("/host/notCommentedComplainList")
	public String complainList(HttpSession session, Model model) {

		User loginUser = (User)session.getAttribute("loginUser");
		//	세션 내 사업자 정보 디버깅
		dl.p("ComplainController", "complainList", loginUser);
		
		List<Complain> complainList = complainService.getNotCommentedComplainList(loginUser.getHost().getHostNo());
		
		model.addAttribute("complainList", complainList);
		
		return "/host/notCommentedComplainList";
	}
	
	//	ComplainList 요청
	@GetMapping("/host/complainList")
	public String complainList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {

		User loginUser = (User)session.getAttribute("loginUser");
		//	세션 내 사업자 정보 디버깅
		dl.p("ComplainController", "complainList", loginUser);
		
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		List<Complain> complainList = complainService.getComplainList(loginUser.getHost().getHostNo(), beginRow, ROW_PER_PAGE);
		
		model.addAttribute("complainList", complainList);
		
		return "/host/complainList";
	}
}
