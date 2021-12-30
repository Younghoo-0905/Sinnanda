package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Member {
	int memberNo;
	String memberId;
	String memberPw;
	String memberName;
	int memberAge;
	String memberTel;
	String memberEmail;
	String memberCertifycode;
	int memberActive;
	int memberLevel;
	String createDate;
	String updateDate;
	
	MemberAddress memberAddress;
}
