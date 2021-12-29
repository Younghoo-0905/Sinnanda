package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.mapper.PaymentMapper;
import com.b2.Sinnanda.vo.Payment;

@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	
	//	[김영후] payment 환불
	public void refundPayment(int reserveNo) {
		paymentMapper.refundPayment(reserveNo);
	}
	
	//	[김영후] payment 추가
	public void addPayment(Payment payment) {
		paymentMapper.insertPayment(payment);
	}
}
