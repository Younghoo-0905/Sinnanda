package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Payment;

@Mapper
public interface PaymentMapper {
	
	//	[김영후] 결제 환불
	void refundPayment(int reserveNo);
	
	//	[김영후] 결제 추가
	void insertPayment(Payment payment);

}
