package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Coupon {
	private int couponNo;
	private int accomNo;
	private String couponName;
	private String couponExpireDate;
	private double couponDiscount;
	private String createDate;
	private String updateDate;
}
