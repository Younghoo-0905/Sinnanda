package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.HostMapper;
import com.b2.Sinnanda.vo.Host;

@Service
public class HostService {
	@Autowired
	private HostMapper hostMapper;
	@Autowired
	private DL dl;	// 조장이 만든 로그 출력 클래스
	
	
	/* [이승준] "사업자 상세+주소" 조회 */
	public Host getHostOneWithAddress(int hostNo) {
		dl.p("HostService", "getHostOneWithAddress()", "[시작]");
		dl.p("getHostOneWithAddress()", "hostNo", hostNo);
		
		// 1. "사업자 상세+주소" 조회 서비스 호출
		Host host = hostMapper.selectHostOneWithAddress(hostNo);
		dl.p("getHostOneWithAddress()", "host.hostAddress.address", host.getHostAddress().getAddress().toString());
		dl.p("getHostOneWithAddress()", "getRoadName", host.getHostAddress().getAddress().getRoadName());
		
		// 2. "주소" 모델 가공 | 시도+시군구+도로명
		String addressInfo = 
				host.getHostAddress().getAddress().getSido() + " " + 
				host.getHostAddress().getAddress().getSigungu() + " " + 
				host.getHostAddress().getAddress().getRoadName();
		
		// 3-1. '메인건물번호'가 있는 경우 -> 추가
		if(host.getHostAddress().getAddress().getMainBuildingCode() != 0) {
			addressInfo = addressInfo+" "+Integer.toString(host.getHostAddress().getAddress().getMainBuildingCode());
		}
		// 3-2. '서브거물번호'가 있는 경우 -> 추가
		if(host.getHostAddress().getAddress().getSubBuildingCode() != 0) {
			addressInfo = addressInfo+"-"+Integer.toString(host.getHostAddress().getAddress().getSubBuildingCode());
		}
		
		// 4. 반한활 모델에 주소 데이터 삽입
		host.getHostAddress().setAddressInfo(addressInfo);
		
		return host;
	}
	
	/* [이승준] Host QnA 상세 조회 */
	public Host getHostOne(int hostNo) {
		dl.p("HostService", "getHostOne()", "[시작]");
		dl.p("HostService", "hostNo", hostNo);
		
		return hostMapper.selectHostOne(hostNo);
	}
}
