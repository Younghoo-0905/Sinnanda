package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Accom;

@Mapper
public interface AccomMapper {
	
	// [이승준] (상세)"숙소 상세+주소" 조회
	Accom selectAccomOneWithAddress(int accomNo);
	
	// [이승준] (목록)"사업자 소유의 숙소 목록" 조회
	List<Accom> selectAccomListByHost(Map<String, Object> map);
	
	// [이승준] (개수)"사업자 소유의 숙소 개수" 조회
	int selectAccomTotalCountByHost(int hostNo);
}
