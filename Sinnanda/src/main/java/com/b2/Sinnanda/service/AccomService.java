package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.AccomCategoryMapper;
import com.b2.Sinnanda.mapper.AccomMapper;
import com.b2.Sinnanda.mapper.RoomMapper;
import com.b2.Sinnanda.vo.Accom;

@Service
@Transactional
public class AccomService {
	@Autowired
	private AccomMapper accomMapper;
	@Autowired
	private AccomCategoryMapper accomCategoryMapper;
	@Autowired
	private RoomMapper roomMapper;
	@Autowired
	private DL dl;
	
	
	// [이승준] "숙소 상세" 조회
	public Map<String, Object> getAccomOne(int accomNo, int beginRow, int rowPerPage) {
		dl.p("AccomService", "getAccomOne()", "[시작]");
		dl.p("getAccomOne()", "accomNo", accomNo);
		
		// 1. "숙소 상세+주소" 조회 서비스 호출
		Accom accom = accomMapper.selectAccomOneWithAddress(accomNo);
		dl.p("getAccomOne()", "accom", accom);
		
		// 2. "주소" 모델 가공 | 시도+시군구+도로명
		String addressInfo = 
				accom.getAccomAddress().getAddress().getSido() + " " + 
				accom.getAccomAddress().getAddress().getSigungu() + " " + 
				accom.getAccomAddress().getAddress().getRoadName();
		
		// 3-1. '메인건물번호'가 있는 경우 -> 추가
		if(accom.getAccomAddress().getAddress().getMainBuildingCode() != 0) {
			addressInfo = addressInfo+" "+Integer.toString(accom.getAccomAddress().getAddress().getMainBuildingCode());
		}
		// 3-2. '서브거물번호'가 있는 경우 -> 추가
		if(accom.getAccomAddress().getAddress().getSubBuildingCode() != 0) {
			addressInfo = addressInfo+"-"+Integer.toString(accom.getAccomAddress().getAddress().getSubBuildingCode());
		}
		
		// 4. 반한활 모델에 주소 데이터 삽입
		accom.getAccomAddress().setAddressInfo(addressInfo);
		
		// 5. "숙소의 카테고리 목록" 조회
		accom.getAccomCategoryInven().setAccomCategories(accomCategoryMapper.selectAccomCategoryList(accomNo));
		
		// 6. "객실 목록" 조회를 위한 데이터 가공
		Map<String, Object> paramRoomListMap = new HashMap<>();
			paramRoomListMap.put("accomNo", accomNo);
			paramRoomListMap.put("beginRow", beginRow);
			paramRoomListMap.put("rowPerPage", rowPerPage);
		
		// 7. "객실 목록" 조회 쿼리 호출
		accom.setRooms(roomMapper.selectRoomList(paramRoomListMap));
		
		// 8. "객실 개수" 조회 쿼리 호출
		int totalCount = roomMapper.selectRoomTotalCount(accomNo);
		
		// 9. 해당 목록의 "끝 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 9-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getAccomOne()", "lastPage", lastPage);
		
		// 10. 리턴할 모델 가공
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("accom", accom);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
		
		/* 11. 리턴
		 * 		"숙소 상세+주소"
		 * 		"숙소의 카테고리 목록"
		 * 		"객실의 목록"
		 * 		"객실의 개수"
		 * 		"마지막 페이지" */
		return returnMap;
	}
	
	// [이승준] "사업자 소유의 숙소 목록" 조회
	public Map<String, Object> getAccomListByHost(int hostNo, int beginRow, int rowPerPage){
		dl.p("AccomService", "getAccomListByHost()", "[시작]");
		dl.p("getAccomListByHost()", "hostNo", hostNo);
		dl.p("getAccomListByHost()", "beginRow", beginRow);
		dl.p("getAccomListByHost()", "rowPerPage", rowPerPage);
		
		// 1. "사업자 소유의 숙소 목록"을 위한 데이터 가공
		Map<String, Object> paraHAccomistMap = new HashMap<>();
			paraHAccomistMap.put("hostNo", hostNo);
			paraHAccomistMap.put("beginRow", beginRow);
			paraHAccomistMap.put("rowPerPage", rowPerPage);
		
		// 2. "사업자 소유의 숙소 목록" 조회 쿼리 실행
		List<Accom> accomList = accomMapper.selectAccomListByHost(paraHAccomistMap);
		
		// 3. "사업자 소유의 숙소 개수" 조회
		int totalCount = accomMapper.selectAccomTotalCountByHost(hostNo);
		dl.p("getAccomListByHost()", "totalCount", totalCount);
		
		// 4. 해당 목록의 "끝 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 4-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getAccomListByHost()", "lastPage", lastPage);
		
		// 5. 리턴할 모델 가공
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("accomList", accomList);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
		
		// 7. 리턴 : "사업자 소유의 숙소 목록", "사업자 소유의 숙소 개수", "마지막 페이지"
		return returnMap;
	}
}
