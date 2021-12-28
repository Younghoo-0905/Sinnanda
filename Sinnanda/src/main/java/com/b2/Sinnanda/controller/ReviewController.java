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
	
/* 1. 조회 */
	
	// [이승준] "리뷰 목록" 조회 | 사업자페이지
	@GetMapping("/host/myReviewList")
	public String getMyReviewList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {
		dl.p("ReviewController", "getMyReviewList() | Get", "시작");
		dl.p("getMyReviewList()", "currentPage", currentPage);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		// 3. "리뷰 목록" 조회 서비스 호출
		Map<String, Object> map = reviewService.getReviewList(loginUser.getHost().getHostNo(), beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 페이지번호의를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("getMyReviewList()", "pageNo", pageNo);
		
		// 5. 모델 전달
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("reviewList", map.get("reviewList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		
		return "/host/myReviewList";
	}
	
	// [이승준] "리뷰 상세" 조회 | 사업자페이지
	@GetMapping("/host/myReviewOne")
	public String getMyReviewOne(HttpSession session, Model model, int reviewNo) {
		dl.p("ReviewController", "getMyReviewOne() | Get", "시작");
		dl.p("getMyReviewOne()", "reviewNo", reviewNo);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. "리뷰 상세" 조회 서비스 호출
		Review review = reviewService.getReviewOne(reviewNo);
		
		// 3. 모델 전달
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("review", review);
		
		return "/host/myReviewOne";
	}
	
	
	
/* 2. 삽입 */
	
	// 리뷰 삽입 서비스 구현 필요, mapper, service 세팅 완료
	
	// [이승준] "리뷰 답변" 삽입 | 사업자페이지
	@PostMapping("/host/addReviewComment")
	public String addReviewComment(ReviewComment reviewComment) {
		dl.p("ReviewController", "addReviewComment() | Get", "시작");
		dl.p("getMyReviewOne()", "reviewComment", reviewComment.toString());
		
		// 1. "리뷰 답변" 삽입 서비스 호출
		reviewService.addReviewComment(reviewComment);
		
		return "redirect:/host/myReviewOne?reviewNo="+reviewComment.getReviewNo();
	}
	
	
	
/* 3. 수정 */
	
	
	
	
	
/* 4. 삭제 */
	
	// [이승준] "리뷰 답변" 삭제 | 사업자페이지
	@GetMapping("/host/removeReviewComment")
	public String removeReviewComment(int reviewNo) {
		dl.p("ReviewController", "removeReviewComment() | Get", "시작");
		dl.p("removeReviewComment()", "reviewNo", reviewNo);
		
		// 1. "리뷰 답변" 삭제 서비스 호출
		reviewService.removeReviewComment(reviewNo);
		
		return "redirect:/host/myReviewOne?reviewNo="+reviewNo;
	}
	
	
	
}
