package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.HostMapper;
import com.b2.Sinnanda.vo.Host;

@Service
public class HostService {
	@Autowired
	private DL dl;	// 조장이 만든 로그 출력 클래스
	@Autowired
	private HostMapper hostMapper;
	
	/* [이승준] Host QnA 상세 조회 */
	public Host getHostOne(int hostNo) {
		dl.p("HostService", "getHostOne()", "[시작]");
		dl.p("HostService", "hostNo", hostNo);
		
		return hostMapper.selectHostOne(hostNo);
	}
}
