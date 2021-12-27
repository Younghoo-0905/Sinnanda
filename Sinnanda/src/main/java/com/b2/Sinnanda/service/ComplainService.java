package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.ComplainMapper;
import com.b2.Sinnanda.vo.Complain;
import com.b2.Sinnanda.vo.ComplainComment;
import com.b2.Sinnanda.vo.HostQna;

@Transactional
@Service
public class ComplainService {	//	[김영후]
	@Autowired 
	private ComplainMapper complainMapper;
	@Autowired
	DL dl;

	
// 사업자 기능
	/* [이승준] 호스트 페이지(메인) - 답변이 없는 Complain 목록 조회 */
	// ㄴ리턴 값 : complainList, totalCount, lastPage
	public Map<String, Object> getNotCommentedComplainListForHost(int userLevel, int hostNo, String complainCategory, int beginRow, int rowPerPage) {
		dl.p("ComplainService", "getNotCommentedComplainListForHost()", "시작");
		dl.p("ComplainService", "userLevel", userLevel);
		dl.p("ComplainService", "hostNo", hostNo);
		dl.p("ComplainService", "complainCategory", complainCategory);
		dl.p("ComplainService", "beginRow", beginRow);
		dl.p("ComplainService", "rowPerPage", rowPerPage);
		
		// 0. '전체 문의' 조회인 경우 complainCategory를 null 값으로 변경하여 쿼리에서 where절이 실행되지 않도록 한다 (by 김영후)
		if(complainCategory == null || complainCategory.equals("전체")) {
			complainCategory = null;
		}
		
		// 1. 답변 없는 Complain 목록 조회를 위한 데이터 가공 (paraComplainMap : userLevel, hostNo, qnaCategory, beginRow, rowPerPage)
		Map<String, Object> paraComplainMap = new HashMap<>();
		
		paraComplainMap.put("userLevel", userLevel);
		paraComplainMap.put("hostNo", hostNo);
		paraComplainMap.put("complainCategory", complainCategory);
		paraComplainMap.put("beginRow", beginRow);
		paraComplainMap.put("rowPerPage", rowPerPage);
		
		// 2. complain 목록 조회
		List<Complain> complainList = complainMapper.selectNotCommentedComplainList(paraComplainMap);
		
		// 3. complain의 총 개수를 위한 데이터 가공(paraPagingMap : userLevel, hostNo, qnaCategory)
		Map<String, Object> paraPagingMap = new HashMap<>();
		
		paraPagingMap.put("userLevel", userLevel);
		paraPagingMap.put("hostNo", hostNo);
		paraPagingMap.put("complainCategory", complainCategory);
		
		// 4. complain 총 개수 조회
		int totalCount = complainMapper.selectNotCommentedComplainTotalCount(paraPagingMap);
		dl.p("ComplainService", "totalCount", totalCount);
		
		// 5. 페이징: lastPage 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("ComplainService", "lastPage", lastPage);
		
		// 6. 리턴 모델 가공 (returnMap : complainList, totalCount, lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("complainList", complainList);
		returnMap.put("totalCount", totalCount);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	
// 구분선	-------------------------------------------

	//	ComplainComment 등록
	public void removeComplainComment(int complainNo) {
		dl.p("ComplainService", "removeComplainComment()", "시작");
		
		complainMapper.deleteComplainComment(complainNo);
	}
	
	//	ComplainComment 등록
	public void addComplainComment(ComplainComment complainComment) {
		dl.p("ComplainService", "addComplainComment", complainComment);
		
		complainMapper.insertComplainComment(complainComment);
	}
	
	//	Complain 등록
	public void addComplain(Complain complain) {
		dl.p("ComplainService", "getComplainOne", complain);
		
		complainMapper.insertComplain(complain);
	}
	
	//	Complain 상세정보 출력
	public Complain getComplainOne(int complainNo) {
		dl.p("ComplainService", "getComplainOne()", "시작");
		dl.p("getComplainOne()", "complainNo", complainNo);
		
		Complain complain = complainMapper.selectComplainOne(complainNo);
		
		return complain;
	}
	
	/*//	ComplainList 출력
	public List<Complain> getComplainList(int hostNo, int beginRow, int rowPerPage) {
		dl.p("ComplainService", "getComplainList", hostNo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("hostNo", hostNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Complain> complainList = complainMapper.selectComplainList(map);
		
		return complainList;
	}*/
	
	/* [이승준] complain 목록 조회 by hostQnaCategory */
	public Map<String, Object> getComplainList(int userLevel, int hostNo, String complainCategory, int beginRow, int rowPerPage) {
		dl.p("ComplainService", "getComplainList()", "시작");
		dl.p("getComplainList()", "userLevel", userLevel);
		dl.p("getComplainList()", "hostNo", hostNo);
		dl.p("getComplainList()", "complainCategory", complainCategory);
		dl.p("getComplainList()", "beginRow", beginRow);
		dl.p("getComplainList()", "rowPerPage", rowPerPage);
		
		// 0. '전체' 조회인 경우 qnaCategory를 null 값으로 변경하여 쿼리에서 where절이 실행되지 않도록 한다 (by 김영후)
		if(complainCategory == null || complainCategory.equals("전체")) {
			complainCategory = null;
		}
		
		// 1. Complain 목록 조회를 위한 데이터 가공 (paraComplainMap : userLevel, hostNo, complainCategory, beginRow, rowPerPage)
		Map<String, Object> paraComplainMap = new HashMap<>();
		
		paraComplainMap.put("userLevel", userLevel);
		paraComplainMap.put("hostNo", hostNo);
		paraComplainMap.put("complainCategory", complainCategory);
		paraComplainMap.put("beginRow", beginRow);
		paraComplainMap.put("rowPerPage", rowPerPage);
		
		// 2. complain 목록 조회
		List<Complain> complainList = complainMapper.selectComplainList(paraComplainMap);
		
		// 3. complain의 총 개수를 위한 데이터 가공(paraPagingMap : userLevel, hostNo, qnaCategory)
		Map<String, Object> paraPagingMap = new HashMap<>();
		paraPagingMap.put("userLevel", userLevel);
		paraPagingMap.put("hostNo", hostNo);
		paraPagingMap.put("complainCategory", complainCategory);
		
		// 4. complain 총 개수 조회
		int totalCount = complainMapper.selectComplainTotalCount(paraPagingMap);
		dl.p("ComplainService", "totalCount", totalCount);
		
		// 5. 페이징: lastPage 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getComplainList()", "lastPage", lastPage);
		
		// 6. 리턴 모델 가공 (returnMap : complainList, totalCount, lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("complainList", complainList);
		returnMap.put("totalCount", totalCount);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
}
