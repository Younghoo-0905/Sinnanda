package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Review {
	//[이원희] 리뷰 테이블 vo
	int reviewNo;
	int paymentNo;
	String reviewContent;
	double reviewRank;
	String reviewRecommend;
	String createDate;
	String updateDate;
	private int memberNo;
	private String memberName;
	private String accomName;
	private String roomName;
}
