package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class AccomAddress {
	private int accomNo;
	private int addressNo;
	private String addressDetail;
	private String createDate;
	private String updateDate;
	
	private String addressInfo;	// [이승준] 합쳐진 주소를 담기위한 변수
	Address address;
}
