package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Payment {
	private int paymentNo;
	private int reserveNo;
	private String paymentMethod;
	private String paymentCouponUse;
	private int paymentPrice;
	private String paymentRefund;
	private String createDate;
	private String updateDate;
	
	
	
	private int hostNo;
	private String accomName;
		

}
