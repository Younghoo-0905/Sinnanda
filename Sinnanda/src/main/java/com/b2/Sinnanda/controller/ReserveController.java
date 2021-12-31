package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.PaymentService;
import com.b2.Sinnanda.service.ReserveService;
import com.b2.Sinnanda.vo.Payment;
import com.b2.Sinnanda.vo.Reserve;
import com.b2.Sinnanda.vo.User;

@Controller
public class ReserveController {	
	@Autowired ReserveService reserveService;	
	@Autowired PaymentService paymentService;
	@Autowired DL dl;

	//	페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
	
	//	[김영후] (사업자 페이지) MyReserveOne 요청
	@GetMapping("/host/myReserveOne")
	public String getHostMyReserveOne(Model model, int reserveNo) {
		dl.p("ReserveController", "getHostMyReserveOne()", reserveNo);
		
		Reserve reserve = reserveService.getHostMyReserveOne(reserveNo);		
		model.addAttribute("reserve", reserve);
		
		return "/host/myReserveOne";
	}
	
	//	[김영후] (사업자 페이지) MyReserveList 요청
	@GetMapping("/host/myReserveList")
	public String getHostMyReserveList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String reserveUse) {
		dl.p("ReserveController", "getHostMyReserveList()", currentPage);
		dl.p("ReserveController()", "currentPage", currentPage);
		dl.p("ReserveController()", "reserveUse", reserveUse);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("ReserveController()", "loginUser", loginUser.toString());

		// 2. 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		// 3. "예약 목록" 조회 서비스 호출
		Map<String, Object> map = reserveService.getHostMyReserveList(loginUser.getHost().getHostNo(), reserveUse, beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 페이지번호를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("ReserveController()", "pageNo", pageNo);
				
		// 5. 모델 전달
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("reserveUse", reserveUse);
		model.addAttribute("reserveList", map.get("reserveList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		
		return "/host/myReserveList";
	}
	
	//	[김영후] Reserve 추가 요청
	@PostMapping("/member/addReserve")
	public String addReserve(Reserve reserve, Payment payment) {
		dl.p("ReserveController", "addReserve", reserve);
		dl.p("ReserveController", "addReserve", payment);
		
		//	reserve와 payment가 동시에 이루어지도록 프로그래밍
		
			//	reserve 테이블에 정보 추가
		reserveService.addReserve(reserve);
		
			//	payment에 참조하는 reserveNo 값 추가
		payment.setReserveNo(reserve.getReserveNo()); 
			//	payment 테이블에 정보 추가
		paymentService.addPayment(payment);
		
		return "redirect:/member/myReserveList";
	}
	
	//	[김영후]	Reserve 취소 요청
	@GetMapping("/member/cancelReserve")
	public String cancelReserve(HttpSession session, int reserveNo) {
		dl.p("ReserveController", "subReserve", reserveNo);
		
		//	결제 환불
		paymentService.refundPayment(reserveNo);
		//	예약 취소
		reserveService.cancelReserve(reserveNo);
		
		return "redirect:/member/myReserveList";
	}
}


