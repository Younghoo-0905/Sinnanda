package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Accom;
import com.b2.Sinnanda.vo.Admin;
@Mapper
public interface AccomMapper {
	//[이원희] 숙소이름 검색
	Accom selectAccomList(Accom accom);
	
}
