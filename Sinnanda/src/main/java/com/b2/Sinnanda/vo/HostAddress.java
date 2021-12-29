package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class HostAddress {
	private int hostNo;
	private int addressNo;
	private String addressInfo;	// [이승준] 주소의 데이터를 담기 위한 변수
	private String addressDetail;
	private String createDate;
	private String updateDate;
	
	private Address address;
}
