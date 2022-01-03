package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Host;

@Mapper
public interface HostMapper {
	
	// [이승준] 사업자 정보 변경
	void updateHost(Host host);
	
	// [이승준] 사업자 비밀번호 변경
	void updateHostPw(Host host);
	
	// [이승준] 사업자 회원가입
	void insertHost(Host host);
	
	// [이승준] 사업자 비밀번호 확인
	int selectHostPwCheck(Host host);
	
	// [이승준] 사업자 상세+주소 조회
	Host selectHostOneWithAddress(int hostNo);
	// [이승준] Host 상세 조회
	Host selectHostOne(int hostNo);
	
	// [윤경환] 숙소 이름 가져오기 
	List<Host> selectHostAccom(int hostNo);
	
	// [윤경환] 사업자가 가지고 있는 숙소 년도에 따른 숙소 정산 
	Map<String,Object> totalAccomHostYear(int year,int hostNo,String accomName);
	
	//[윤경환] 사업자가 관리자한테 내는 수수료 
	Map<String, Object> totalDeduHostYear(int year, int hostNo, String accomName);
}
