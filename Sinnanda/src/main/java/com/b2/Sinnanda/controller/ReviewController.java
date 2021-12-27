package com.b2.Sinnanda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.ReviewService;
import com.b2.Sinnanda.vo.Review;
import com.b2.Sinnanda.vo.ReviewComment;
import com.b2.Sinnanda.vo.User;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	@Autowired
	DL dl;

	//	리스트 페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
	//	ReviewComment 등록 요청
	@PostMapping("/host/addReviewComment")
	public String addReviewComment(ReviewComment reviewComment) {
		dl.p("ReviewController", "addReviewComment", reviewComment);
		reviewService.addReviewComment(reviewComment);
		
		return "redirect:/host/notCommentedReviewList";
		
	}
	
	/*//	ReviewList 요청 ((사업자)아직 답변하지 않은 Review)
	@GetMapping("/host/notCommentedReviewList")
	public String reviewList(HttpSession session, Model model) {

		User loginUser = (User)session.getAttribute("loginUser");
		//	세션 내 사업자 정보 디버깅
		dl.p("ComplainController", "complainList", loginUser);
		
		List<Review> reviewList = reviewService.getNotCommentedReviewListForHost(loginUser.getHost().getHostNo());
		
		model.addAttribute("reviewList", reviewList);
		
		return "/host/notCommentedReviewList";
		
	}*/
	
	//	ReviewList 요청 (사업자 페이지)
	@GetMapping("host/reviewList")
	public String reviewList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {

		User loginUser = (User)session.getAttribute("loginUser");
		//	세션 내 사업자 정보 디버깅
		dl.p("ComplainController", "complainList", loginUser);
		
		//	페이징용, 출력을 시작할 행 계산식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		List<Review> reviewList = reviewService.getReviewList(loginUser.getHost().getHostNo(), beginRow, ROW_PER_PAGE);
				
		model.addAttribute("reviewList", reviewList);
		
		return "/host/reviewList";
	}
	
}
