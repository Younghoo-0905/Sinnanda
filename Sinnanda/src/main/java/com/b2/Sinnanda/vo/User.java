package com.b2.Sinnanda.vo;


import lombok.Data;

// [이승준] 사용자 정보를 담기위한 
@Data
public class User {
	private String UserId;
	private String UserPw;
	private int userLevel;
	
	private Member member;
	private Host host;
	private Admin admin;
}
