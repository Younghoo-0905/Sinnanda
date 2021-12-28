package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.SearchAccomMapper;
import com.b2.Sinnanda.vo.Accom;
import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SearchAccomService {
	@Autowired SearchAccomMapper accomMapper;
	@Autowired DL dl;
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
	
	public Map<String, Object> getAccomListByName(Accom accomName, int person, int currentPage, int rowPerPage, List<String>accomCategory1, List<Integer> accomRate){
		log.debug("[Debug] \"START\" SearchAccomService.getAccomListByName()");
		log.debug(" ├[param] accomName : "+accomName);
		log.debug(" ├[param] currentPage : "+currentPage);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		// 1. 매개변수 가공 (paraMap <-- accomName, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("accomName", accomName.getAccomName());
		paraMap.put("accomCategory1", accomCategory1);
		paraMap.put("accomCategoryName", accomName.getAccomCategoryName());
		paraMap.put("person", person);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		if(accomRate.contains(2)) {
			
		}
		
		if(accomRate.contains(2)) {
			
		}
		
		if(accomRate.contains(2)) {
			
		}
		
		if(accomRate.contains(2)) {
			
		}
		
		if(accomRate.contains(2)) {
			
		}

		
		// 2. 숙소 리스트 조회
		List<Accom> accomList = accomMapper.selectAccomListByName(paraMap);
		
		// 3. 리턴 값 가공 (return : accom & lastPage)
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int lastPage = 0;
		int totalCount = accomMapper.selectAccomTotalCount(paraMap);
		log.debug(" ├[param] totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		// 4. 별점 값 저장
		List<Double> accomRankList = accomMapper.selectAccomRank(paraMap);
		
		log.debug(" ├[param] lastPage : "+lastPage);
		log.debug(" ├[param] accomList : "+accomList);
		log.debug(" ├[param] accomRankList : "+accomRankList);
		
		returnMap.put("accomList", accomList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("accomRankList", accomRankList);
		
		return returnMap;
	}
	
	// [이원희]숙소 정보 불러오기
	public Map<String, Object> getAccomOne(int accomNo){
		Accom accom = accomMapper.selectAccomOne(accomNo); // 숙소정보
		List<Room> roomList = accomMapper.selectAccomOneByRoom(accomNo);
		
		log.debug(" ├[param] accom : "+accom);
		log.debug(" ├[param] accom : "+roomList);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("accom", accom);
		returnMap.put("roomList", roomList);
		
		return returnMap;
	}
	
	//[이원희]객실 정보 불러오기
	public Room getRoomOne(int roomNo){
		
		Room room = accomMapper.selectRoomOne(roomNo);// 객실 정보
		dl.p("SearchAccomService", "getRoomOne(int roomNo)", room); //디버깅
		return room;
		
		
	}
}
