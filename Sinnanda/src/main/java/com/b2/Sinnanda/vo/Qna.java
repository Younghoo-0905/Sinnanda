package com.b2.Sinnanda.vo;

import java.util.List;

import lombok.Data;

@Data
public class Qna {
	private int qnaNo;
	private int memberNo;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private String qnaSecret;
	private String createDate;
	private String updateDate;
	List<QnaComment> qnaComments;
}
