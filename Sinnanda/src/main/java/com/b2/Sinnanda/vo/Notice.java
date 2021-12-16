package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private int adminNo;
	private String noticeCategory;
	private String noticeTitle;
	private String noticeContent;
	private String noticePin;
	private String createDate;
	private String updateDate;
	private String adminName;
}
