package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Host;

@Mapper
public interface HostMapper {
	
	void insertHost(Host host);
	
	Host selectHostOneWithAddress(int hostNo);
	// [이승준] Host 상세 조회
	Host selectHostOne(int hostNo);
	
	// [윤경환] 숙소 이름 가져오기 
	List<Host> selectHostAccom(int hostNo);
	
	// [윤경환] 사업자가 가지고 있는 숙소 년도에 따른 숙소 정산 
	Map<String,Object> TotalAccomHostYear(int year,int hostNo,String accomName);
}
