package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class HostQna {
	private int hostQnaNo;
	private int hostNo;
	private String hostQnaCategory;
	private String hostQnaState;
	private String hostQnaTitle;
	private String hostQnaContent;
	private String hostQnaUploadFile;
	private String createDate;
	private String updateDate;
	
	HostQnaComment hostQnaComments;	// [이승준] Qna에 대한 1개의 답변
	private String hostName;	// [이승준] Host QnA를 작성한 host의 이름을 저장하기 위한 변수, Host 테이블의 데이터
	private String adminName;	// [이승준] Host QnA에 답변한 admin의 이름을 저장하기 위한 변수, Admin 테이블의 데이터
}
