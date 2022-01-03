package com.b2.Sinnanda.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.AddressMapper;
import com.b2.Sinnanda.mapper.HostAddressMapper;
import com.b2.Sinnanda.mapper.HostMapper;
import com.b2.Sinnanda.vo.Address;
import com.b2.Sinnanda.vo.Host;

@Service
@Transactional
public class HostService {
	@Autowired
	private HostMapper hostMapper;
	@Autowired
	private AddressMapper addressMapper;
	@Autowired
	private HostAddressMapper hostAddressMapper;
	@Autowired
	private DL dl;	// 조장이 만든 로그 출력 클래스
	
	// [이승준] 사업자 정보들 수정
	public void modifyHost(Host host) {
		// 1. "사업자정보" 수정
		hostMapper.updateHost(host);
		
		// 2. '주소번호' 조회
		// 2-1. 입력받은 긴 주소를 분리
		String[] addressArr = new String[5];
		addressArr = host.getHostAddress().getAddressInfo().split(" ");
		
		// 2. 시도, 시군구, 도로명 파라미터 설정
		Address paraAddress = new Address();
			paraAddress.setSido(addressArr[0]);
			paraAddress.setSigungu(addressArr[1]);
			paraAddress.setRoadName(addressArr[2]);
		
		// 3. 지번이 있는 경우, 지번 파라미터 설정
		if(addressArr.length >= 4) {
			String jibuns[] = new String[2];
			
			// 3-1. 지번 분리
			jibuns = addressArr[3].split("-");
			dl.p("getAddressOne()", "jibuns.length", jibuns.length);
			
			// 3-2. 메인지번 파라미터 설정
			paraAddress.setMainBuildingCode(Integer.parseInt(jibuns[0]));
			
			// 3-3. 서브지번이 있는 경우, 파라미터 설정
			if(jibuns.length == 2) {
				paraAddress.setSubBuildingCode(Integer.parseInt(jibuns[1]));
			}
		}

		// 4. 입력받은 주소에 해당되는 '주소번호' 조회
		Address returnAddress = addressMapper.selectAddressOne(paraAddress);
		
		// 5. "사업자주소"를 삽입하기 위한 가공
		host.getHostAddress().setHostNo(host.getHostNo());
		host.getHostAddress().setAddressNo(returnAddress.getAddressNo());
		
		// 6. "사업자주소" 삽입
		hostAddressMapper.updateHostAddress(host.getHostAddress());
	}
	
	// [이승준] 사업자 비밀번호 수정
	public void modifyHostPw(int hostNo, String hostPw) {
		
		Host host = new Host();
			host.setHostNo(hostNo);
			host.setHostPw(hostPw);
		
		hostMapper.updateHostPw(host);
	}
	
	// [이승준] 사업자 비밀번호 확인
	public int getHostPwCheck(int hostNo, String hostPw) {
		
		Host host = new Host();
			host.setHostNo(hostNo);
			host.setHostPw(hostPw);
		
		return hostMapper.selectHostPwCheck(host);
	}
	
	// [이승준] 사업자 회원가입
	public void addHost(Host host) {
		hostMapper.insertHost(host);
		
		// 1. 입력받은 긴 주소를 분리
		String[] addressArr = new String[5];
		addressArr = host.getHostAddress().getAddressInfo().split(" ");
		
		// 2. 시도, 시군구, 도로명 파라미터 설정
		Address paraAddress = new Address();
			paraAddress.setSido(addressArr[0]);
			paraAddress.setSigungu(addressArr[1]);
			paraAddress.setRoadName(addressArr[2]);
		
		// 3. 지번이 있는 경우, 지번 파라미터 설정
		if(addressArr.length >= 4) {
			String jibuns[] = new String[2];
			
			// 3-1. 지번 분리
			jibuns = addressArr[3].split("-");
			dl.p("getAddressOne()", "jibuns.length", jibuns.length);
			
			// 3-2. 메인지번 파라미터 설정
			paraAddress.setMainBuildingCode(Integer.parseInt(jibuns[0]));
			
			// 3-3. 서브지번이 있는 경우, 파라미터 설정
			if(jibuns.length == 2) {
				paraAddress.setSubBuildingCode(Integer.parseInt(jibuns[1]));
			}
		}
		
		// 4. 입력받은 주소에 해당되는 주소번호 조회
		Address returnAddress = addressMapper.selectAddressOne(paraAddress);
		
		// 5. 회원주소를 삽입하기 위한 가공
		host.getHostAddress().setHostNo(host.getHostNo());
		host.getHostAddress().setAddressNo(returnAddress.getAddressNo());
		
		// 6. 회원주소 삽입
		hostAddressMapper.insertHostAddress(host.getHostAddress());
	}
	
	
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
	//[윤경환] 정산전에 사업자에 관한 숙소 내용 
	public List<Host> getselectHostAccom(int hostNo) {
		List<Host> accomHost = hostMapper.selectHostAccom(hostNo); 
		return accomHost;
	}
	//[윤경환] 숙소에 따른 수익 
	public Map<String,Object> getTotalAccomHostYear(int year, int hostNo, String accomName){
		//전체를 조회할때 모든 숙소가 나올 수 있게 조치 
		if(accomName == null || accomName.equals("전체")) {
			accomName = null;
			}
		
		Map<String, Object> map = hostMapper.totalAccomHostYear(year, hostNo, accomName);		
		return map;	
	}
	
	//[윤경환] 숙소에따른 수수료 
	public Map<String, Object> getTotalDeduHostYear(int year, int hostNo, String accomName){
		if(accomName == null || accomName.equals("전체")) {
			accomName = null;
			}
		Map<String, Object> map = hostMapper.totalDeduHostYear(year, hostNo, accomName);		
		return map;	
	}

}
