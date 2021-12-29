package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.AddressMapper;
import com.b2.Sinnanda.vo.Address;

@Service
@Transactional
public class AddressService {
	@Autowired
	private AddressMapper addressMapper;
	@Autowired
	private DL dl;
	
/* 1. 조회 */
	
	// [이승준] "주소 상세" 조회
	public Address getAddressOne(String beforeAddress) {
		dl.p("AddressService", "getAddressOne()", "시작");
		dl.p("getAddressOne()", "beforeAddress", beforeAddress);
		
		// String의 주소를 배열로 분리
		String[] addressArr = new String[5];
		addressArr = beforeAddress.split(" ");
		
		for(int i=0; i<addressArr.length; i++) {
			dl.p("getAddressOne()", "addressArr"+i, addressArr[i]);
		}
		
		// 시도, 시군구, 도로명 파라미터 설정
		Address paraAddress = new Address();
			paraAddress.setSido(addressArr[0]);
			paraAddress.setSigungu(addressArr[1]);
			paraAddress.setRoadName(addressArr[2]);
		
		// 지번이 있는 경우, 지번 설정
		if(addressArr.length >= 4) {
			String jibuns[] = new String[2];
			
			// 메인, 서브 지번 나누고
			jibuns = addressArr[3].split("-");
			
			dl.p("getAddressOne()", "jibuns.length", jibuns.length);
			
			for(int i=0; i<jibuns.length; i++) {
				dl.p("getAddressOne()", "jibuns"+i, jibuns[i]);
			}
			
			// 메인지번 파라미터 설정
			paraAddress.setMainBuildingCode(Integer.parseInt(jibuns[0]));
			
			// 서브지번이 있는 경우
			if(jibuns.length == 2) {
				// 서브지번 파라미터 설정
				paraAddress.setSubBuildingCode(Integer.parseInt(jibuns[1]));
			}
		}
		
		// 위에서 설정한 파라미터들을 이용해서 해당되는 주소 조회
		Address returnAddress = addressMapper.selectAddressOne(paraAddress);
		
		return returnAddress;
	}
}
