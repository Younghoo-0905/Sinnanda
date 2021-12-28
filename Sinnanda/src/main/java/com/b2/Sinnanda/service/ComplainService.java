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

/* 1. 조회 */
	
	// [이승준] 답변없는 "컴플레인 목록" 조회
	public Map<String, Object> getNotCommentedComplainList(int userLevel, int hostNo, String complainCategory, int beginRow, int rowPerPage) {
		dl.p("ComplainService", "getNotCommentedComplainList()", "시작");
		dl.p("ComplainService", "userLevel", userLevel);
		dl.p("ComplainService", "hostNo", hostNo);
		dl.p("ComplainService", "complainCategory", complainCategory);
		dl.p("ComplainService", "beginRow", beginRow);
		dl.p("ComplainService", "rowPerPage", rowPerPage);
		
		// 0. "전체"의 카테고리를 조회하는 경우, null 값으로 변경 -> 쿼리에서 WHERE절이 실행되지 않도록 한다 (by 김영후)
		if(complainCategory == null || complainCategory.equals("전체")) {
			complainCategory = null;
		}
		
		// 1. "답변없는 컴플레인 목록"을 위한 데이터 가공
		Map<String, Object> paraComplainMap = new HashMap<>();
			paraComplainMap.put("userLevel", userLevel);
			paraComplainMap.put("hostNo", hostNo);
			paraComplainMap.put("complainCategory", complainCategory);
			paraComplainMap.put("beginRow", beginRow);
			paraComplainMap.put("rowPerPage", rowPerPage);
		
		// 2. "답변없는 컴플레인 목록" 조회 쿼리 실행
		List<Complain> complainList = complainMapper.selectNotCommentedComplainList(paraComplainMap);
		
		// 3. "답변없는 컴플레인 개수"를 위한 데이터 가공
		Map<String, Object> paraPagingMap = new HashMap<>();
			paraPagingMap.put("userLevel", userLevel);
			paraPagingMap.put("hostNo", hostNo);
			paraPagingMap.put("complainCategory", complainCategory);
		
		// 4. "답변없는 컴플레인 개수" 조회
		int totalCount = complainMapper.selectNotCommentedComplainTotalCount(paraPagingMap);
		dl.p("ComplainService", "totalCount", totalCount);
		
		// 5. 해당 목록의 "끝 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("ComplainService", "lastPage", lastPage);
		
		// 6. 리턴할 모델 가공
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("complainList", complainList);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
		
		// 7. 리턴 : "답변없는 컴플레인 목록", "답변없는 컴플레인 개수", "마지막 페이지"
		return returnMap;
	}
	
	// [이승준] "컴플레인 목록" 조회
	public Map<String, Object> getComplainList(int userLevel, int hostNo, String complainCategory, int beginRow, int rowPerPage) {
		dl.p("ComplainService", "getComplainList()", "시작");
		dl.p("getComplainList()", "userLevel", userLevel);
		dl.p("getComplainList()", "hostNo", hostNo);
		dl.p("getComplainList()", "complainCategory", complainCategory);
		dl.p("getComplainList()", "beginRow", beginRow);
		dl.p("getComplainList()", "rowPerPage", rowPerPage);
		
		// 0. "전체"의 카테고리를 조회하는 경우, null 값으로 변경 -> 쿼리에서 WHERE절이 실행되지 않도록 한다 (by 김영후)
		if(complainCategory == null || complainCategory.equals("전체")) {
			complainCategory = null;
		}
		
		// 1. "컴플레인 목록"을 위한 데이터 가공
		Map<String, Object> paraComplainMap = new HashMap<>();
			paraComplainMap.put("userLevel", userLevel);
			paraComplainMap.put("hostNo", hostNo);
			paraComplainMap.put("complainCategory", complainCategory);
			paraComplainMap.put("beginRow", beginRow);
			paraComplainMap.put("rowPerPage", rowPerPage);
		
		// 2. "컴플레인 목록" 조회 쿼리 실행
		List<Complain> complainList = complainMapper.selectComplainList(paraComplainMap);
		
		// 3. "컴플레인 개수"를 위한 데이터 가공
		Map<String, Object> paraPagingMap = new HashMap<>();
			paraPagingMap.put("userLevel", userLevel);
			paraPagingMap.put("hostNo", hostNo);
			paraPagingMap.put("complainCategory", complainCategory);
		
		// 4. "컴플레인 개수" 조회
		int totalCount = complainMapper.selectComplainTotalCount(paraPagingMap);
		dl.p("ComplainService", "totalCount", totalCount);
		
		// 5. 해당 목록의 "끝 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getComplainList()", "lastPage", lastPage);
		
		// 6. 리턴할 모델 가공
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("complainList", complainList);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
			
		// 7. 리턴 : "컴플레인 목록", "컴플레인 개수", "마지막 페이지"
		return returnMap;
	}

	// [이승준] "컴플레인 상세" 조회
	public Complain getComplainOne(int complainNo) {
		dl.p("ComplainService", "getComplainOne()", "시작");
		dl.p("getComplainOne()", "complainNo", complainNo);
		
		return complainMapper.selectComplainOne(complainNo);
	}
	
	
	
/* 2. 삽입 */	
	
	// [이승준] "컴플레인" 삽입
	public void addComplain(Complain complain) {
		dl.p("ComplainService", "addComplain()", "시작");
		dl.p("addComplain)_", "complain", complain.toString());
		
		complainMapper.insertComplain(complain);
	}
	
	// [이승준] "컴플레인 답변" 삽입
	public void addComplainComment(ComplainComment complainComment) {
		dl.p("ComplainService", "addComplainComment()", "시작");
		dl.p("addComplainComment()", "addComplainComment", complainComment.toString());
		
		complainMapper.insertComplainComment(complainComment);
	}
	
	
	
/* 3. 수정 */
	
	
	
	
	
/* 4. 삭제 */
	
	// [이승준] "컴플레인 답변" 삭제
	public void removeComplainComment(int complainNo) {
		dl.p("ComplainService", "removeComplainComment()", "시작");
		dl.p("removeComplainComment()", "complainNo", complainNo);
		
		complainMapper.deleteComplainComment(complainNo);
	}
	
	
	
}
