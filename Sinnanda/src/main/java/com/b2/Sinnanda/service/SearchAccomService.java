package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.mapper.AccomMapper;
import com.b2.Sinnanda.vo.Accom;
import com.b2.Sinnanda.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	/* [이원희] 숙소 목록 조회 by accomName */
	public Map<String, Object> getAccomListByName(Accom accomName, int currentPage, int rowPerPage){
		log.debug("[Debug] \"START\" SearchAccomService.getAccomListByName()");
		log.debug(" ├[param] accomName : "+accomName);
		log.debug(" ├[param] currentPage : "+currentPage);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		// 1. 매개변수 가공 (paraMap <-- accomName, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("accomName", accomName.getAccomName());
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		// 2. 숙소 리스트 조회
		List<Accom> accomList = accomMapper.selectAccomListByName(paraMap);
		
		// 3. 리턴 값 가공 (return : accom & lastPage)
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int lastPage = 0;
		int totalCount = accomMapper.selectAccomTotalCount(accomName.getAccomName());
		log.debug(" ├[param] totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		log.debug(" ├[param] lastPage : "+lastPage);
		log.debug(" ├[param] accomList : "+accomList);
		returnMap.put("accomList", accomList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
}
