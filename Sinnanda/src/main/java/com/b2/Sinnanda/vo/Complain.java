package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Complain {
	private int complainNo;
	private int paymentNo;
	private String complainCategory;
	private String complainTitle;
	private String complainContent;
	private String createDate;
	private String updateDate;
	private ComplainComment complainComment;
	private String memberName;
}
