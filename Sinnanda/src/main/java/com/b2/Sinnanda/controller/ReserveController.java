package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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


