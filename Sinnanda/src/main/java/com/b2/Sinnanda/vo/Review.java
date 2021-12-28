package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Review {
	private int reviewNo;
	private int paymentNo;
	private int reserveNo;
	private String reviewContent;
	private double reviewRank;
	private String reviewRecommend;
	private String createDate;
	private String updateDate;
	private ReviewComment reviewComment;
	private String memberName;
	private String accomName;
	private String roomName;
	private int memberNo;
	private int accomNo;
}
