package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class AdminSales {
	private int adminSalesNo;
	private int paymentNo;
	private int commissionNo;
	private int payoutCommission;
	
	//payment에 저장 되어있는 날짜
	private String updateDate;
	
}	
