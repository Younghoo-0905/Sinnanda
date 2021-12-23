package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class ReviewComment {
	private int reviewNo;
	private String reviewCommentContent;
	private String commentDate;
	private String hostName;	
}
