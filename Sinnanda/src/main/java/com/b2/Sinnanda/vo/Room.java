package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Room {
	int roomNo;
	int accomNo;
	String roomName;
	String roomMainImg;
	String roomDescription;
	int roomPerson;
	int roomPrice;
	String roomCheckIn;
	String roomCheckOut;
	String roomUse;
	String createDate;
	String updateDate;
}
