package com.b2.Sinnanda.vo;

import lombok.Data;

@Data
public class Host {
	private int hostNo;
	private String hostId;
	private String hostPw;
	private String hostName;
	private String hostTel;
	private int hostActive;
	private int memberLevel;
	private String createDate;
	private String updateDate;

	private HostAddress hostAddress;
}
