package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class QnaComment {
	private int qnaNo;
	private int adminNo;
	private String qnaComment;
	private String createDate;
	private String updateDate;
}
