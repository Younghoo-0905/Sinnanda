package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.mapper.AccomMapper;
import com.b2.Sinnanda.vo.Accom;

@Service
public class SearchAccomService {
	@Autowired AccomMapper accomMapper;
	Accom getAccom = new Accom();
	
	public Accom getAccomList(Accom accom) {
		
		//[이원희] 숙소명 검색 결과가 없으면 null 있으면 숙소 정보 반환
		getAccom = accomMapper.selectAccomList(accom);
		if(getAccom == null) {
			return null;
		}
		return getAccom;
	}
}
