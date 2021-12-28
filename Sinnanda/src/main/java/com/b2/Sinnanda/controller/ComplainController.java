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
	
	// [이승준] "컴플레인 목록" | 관리자페이지
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
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("complainList", map.get("complainList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		
		return "/host/myComplainList";
	}
	
	//	ComplainOne 요청
	@GetMapping("/host/myComplainOne")
	public String getComplainOne(HttpSession session, Model model, int complainNo) {
		dl.p("ComplainController", "complainOne()", complainNo);
		
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainOne()", "loginUser", loginUser.toString());
		
		Complain complain = complainService.getComplainOne(complainNo);
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("complain", complain);
		
		return "/host/myComplainOne";
	}
	
/* 2. 삽입 */
	
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
	
	//	addComplainComment 요청
	@PostMapping("/host/addComplainComment")
	public String addComplainComment(ComplainComment complainComment) {
		dl.p("ComplainController", "addComplainComment()", "시작");
		dl.p("addComplainComment()", "complainComment", complainComment.toString());
		
		complainService.addComplainComment(complainComment);
		
		return "redirect:/host/myComplainOne?complainNo=" + complainComment.getComplainNo();
	}
	
	
	
	
	
/* 3. 수정 */
	
	
	
	
	
/* 4. 삭제 */
	
		//	addComplainComment 요청
	@GetMapping("/host/removeComplainComment")
	public String removeComplainComment(int complainNo) {
		dl.p("ComplainController", "addComplainComment() | Get", "시작");
		dl.p("addComplainComment()", "complainNo", complainNo);
		
		complainService.removeComplainComment(complainNo);
		
		return "redirect:/host/myComplainOne?complainNo="+complainNo;
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

}
