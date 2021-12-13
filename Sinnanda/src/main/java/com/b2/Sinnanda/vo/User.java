package com.b2.Sinnanda.vo;


import lombok.Data;

// [이승준] 상황에 따른 사용자 정보를 담기위한 vo
@Data
public class User {
	private String userId;
	private String userPw;
	private int userLevel;
	
	private Member member;
	private Host host;
	private Admin admin;
}
