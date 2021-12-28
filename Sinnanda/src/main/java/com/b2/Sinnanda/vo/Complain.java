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
	
	private String memberName;
	private String accomName;
	private String roomName;
	
	private ComplainComment complainComment;
	
	private String complainCommentContent;
	private String CommentDate;
	private String hostName;
}
