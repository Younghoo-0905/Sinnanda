package com.b2.Sinnanda.controller;

import java.util.List;
import java.util.Map;

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
		
		return "redirect:/host/myReviewOne?reviewNo="+reviewComment.getReviewNo();
		
	}
	
	@GetMapping("/host/removeReviewComment")
	public String removeReviewComment(int reviewNo) {
		dl.p("ReviewController", "removeReviewComment() | Get", "시작");
		dl.p("removeReviewComment()", "reviewNo", reviewNo);
		
		reviewService.removeReviewComment(reviewNo);
		
		return "redirect:/host/myReviewOne?reviewNo="+reviewNo;
	}
	
	@GetMapping("/host/myReviewOne")
	public String getMyReviewOne(HttpSession session, Model model, int reviewNo) {
		dl.p("ReviewController", "getMyReviewOne() | Get", "시작");
		dl.p("getMyReviewOne()", "reviewNo", reviewNo);
		
		// 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainOne()", "loginUser", loginUser.toString());
		
		Review review = reviewService.getReviewOne(reviewNo);
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("review", review);
		
		return "/host/myReviewOne";
	}
	
	//	ReviewList 요청 (사업자 페이지)
	@GetMapping("/host/myReviewList")
	public String getMyReviewList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {
		dl.p("ReviewController", "myReviewList() | Get", "시작");
		
		// 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		//	페이징용, 출력을 시작할 행 계산식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		// 리뷰 목록 조회
		Map<String, Object> map = reviewService.getReviewList(loginUser.getHost().getHostNo(), beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 page 번호를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("complainList()", "pageNo", pageNo);
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("reviewList", map.get("reviewList"));
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNo", pageNo);
		
		return "/host/myReviewList";
	}
	
}
