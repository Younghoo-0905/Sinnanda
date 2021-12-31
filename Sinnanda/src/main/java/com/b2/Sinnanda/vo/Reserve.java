package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Reserve {
	private int reserveNo;
	private	int	memberNo;
	private int roomNo;
	private String reserveDate;
	private String reserveUse;
	private String reserveInfo;
	private int reservePersonnel;
	private String reserveCancelDate;
	private String reserveCheckIn;
	private String reserveCheckOut;
	private String memberName;
	private String accomName;
	private String roomName;
	private String paymentMethod;
	private int paymentPrice;
	
	
	//[정산에 필요한 값들]
	private Room room;
}
