package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.HostQnaMapper;
import com.b2.Sinnanda.vo.HostQna;
import com.b2.Sinnanda.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class HostQnaService {
	@Autowired
	private HostQnaMapper hostQnaMapper;
	@Autowired
	private DL dl;
	
/* 1. 조회 */
	
	// [이승준] 답변없는 "사업자문의 목록" 조회
	public Map<String, Object> getNoCommentedHostQnaList(int userLevel, int hostNo, String hostQnaCategory, int beginRow, int rowPerPage){
		dl.p("HostQnaService", "getNoCommentedHostQnaList()", "시작");
		dl.p("getNoCommentedHostQnaList()", "userLevel", userLevel);
		dl.p("getNoCommentedHostQnaList()", "hostNo", hostNo);
		dl.p("getNoCommentedHostQnaList()", "hostQnaCategory", hostQnaCategory);
		dl.p("getNoCommentedHostQnaList()", "beginRow", beginRow);
		dl.p("getNoCommentedHostQnaList()", "rowPerPage", rowPerPage);
		
		// 0. "전체"의 카테고리를 조회하는 경우, null 값으로 변경 -> 쿼리에서 WHERE절이 실행되지 않도록 한다 (by 김영후)
		if(hostQnaCategory == null || hostQnaCategory.equals("전체")) {
			hostQnaCategory = null;
		}
		
		// 1. "사업자문의 목록"을 위한 데이터 가공
		Map<String, Object> paraQnaListMap = new HashMap<>();
			paraQnaListMap.put("userLevel", userLevel);
			paraQnaListMap.put("hostNo", hostNo);	// '사업자'인 경우 hostNo이 활용 O | '관리자'인 경우 쿼리에서 활용 X
			paraQnaListMap.put("hostQnaCategory", hostQnaCategory);
			paraQnaListMap.put("beginRow", beginRow);
			paraQnaListMap.put("rowPerPage", rowPerPage);
		
		// 2. "사업자문의 목록" 조회 서비스 실행
		List<HostQna> hostQnaList = hostQnaMapper.selectNoCommentedHostQnaList(paraQnaListMap);
		
		// 3. "사업자문의 개수"를 위한 데이터 가공
		Map<String, Object> paraPagingMap = new HashMap<>();
			paraPagingMap.put("userLevel", userLevel);
			paraPagingMap.put("hostNo", hostNo);
			paraPagingMap.put("hostQnaCategory", hostQnaCategory);
		
		// 4. "사업자문의 개수" 조회
		int totalCount = hostQnaMapper.selectNoCommentedHostQnaTotalCount(paraPagingMap);
		log.debug(" ├[param] totalCount : "+totalCount);
		
		// 5. 해당 목록의 "끝 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getNoCommentedHostQnaList()", "lastPage", lastPage);
		
		// 6. 리턴할 모델 가공
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("hostQnaList", hostQnaList);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
		
		// 5. 리턴 : "답변없는 사업자문의 목록", "마지막 페이지"
		return returnMap;
	}
	
	
	// [이승준] "사업자문의 목록" 조회
	public Map<String, Object> getHostQnaList(int userLevel, int hostNo, String hostQnaCategory, int beginRow, int rowPerPage){
		log.debug("[Debug] \"START\" HostQnaService.getHostQnaListByQnaCategory()");
		log.debug(" ├[param] userLevel : "+userLevel);
		log.debug(" ├[param] hostNo : "+hostNo);
		log.debug(" ├[param] hostQnaCategory : "+hostQnaCategory);
		log.debug(" ├[param] beginRow : "+beginRow);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		// 0. '전체' 조회인 경우 qnaCategory를 null 값으로 변경하여 쿼리에서 where절이 실행되지 않도록 한다 (by 김영후)
		if(hostQnaCategory == null || hostQnaCategory.equals("전체")) {
			hostQnaCategory = null;
		}
		
		// 1. Host QnA 목록 조회를 위한 데이터 가공 (paraMap : userLevel, hostNo, qnaCategory, beginRow, rowPerPage)
		Map<String, Object> paraQnaListMap = new HashMap<>();
		
		paraQnaListMap.put("userLevel", userLevel);
		paraQnaListMap.put("hostNo", hostNo);
		paraQnaListMap.put("hostQnaCategory", hostQnaCategory);
		paraQnaListMap.put("beginRow", beginRow);
		paraQnaListMap.put("rowPerPage", rowPerPage);
		
		// 2. host QnA 목록 조회 (paraQnaListMap : (userLevel, hostNo, hostQnaCategory, beginRow, rowPerPage))
		List<HostQna> hostQnaList = hostQnaMapper.selectHostQnaList(paraQnaListMap);
		
		// 3. Host QnA의 총 개수를 위한 데이터 가공(paraPagingMap : (userLevel, hostNo, hostQnaCategory))
		Map<String, Object> paraPagingMap = new HashMap<>();
		paraPagingMap.put("userLevel", userLevel);
		paraPagingMap.put("hostNo", hostNo);
		paraPagingMap.put("hostQnaCategory", hostQnaCategory);
		
		// 4. Host QnA 총 개수 조회
		int totalCount = hostQnaMapper.selectHostQnaTotalCount(paraPagingMap);
		log.debug(" ├[param] totalCount : "+totalCount);
		
		// 5. 페이징: lastPage 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		log.debug(" ├[param] lastPage : "+lastPage);
		
		// 6. 리턴 모델 가공 (returnMap : (hostQnaList, lastPage))
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("hostQnaList", hostQnaList);
		returnMap.put("lastPage", lastPage);
		
		// 5. returnMap : (hostQnaList, lastPage) 리턴
		return returnMap;
	}
	
	// [이승준] "사업자문의 상세" 조회
	public HostQna getHostQnaOne(int hostQnaNo) {
		log.debug("[Debug] \"START\" HostQnaService.getHostQnaOne()");
		log.debug(" ├[param] hostQnaNo : "+hostQnaNo);
		
		return hostQnaMapper.selectHostQnaOne(hostQnaNo);
	}
	
	
	
/* 2. 삽입 */
	
	// [이승준] "사업자문의" 삽입
	public void addHostQna(HostQna hostQna) {
		log.debug("[Debug] \"START\" HostQnaService.addHostQna()");
		log.debug(" ├[param] hostQna : "+hostQna.toString());
		
		hostQnaMapper.insertHostQna(hostQna);
	}
	
	
	
/* 3. 수정 */
	
	// [이승준] "사업자문의" 수정
	public void modifyHostQna(HostQna hostQna) {
		log.debug("[Debug] \"START\" HostQnaService.modifyHostQna()");
		log.debug(" ├[param] hostQna : "+hostQna.toString());
		
		hostQnaMapper.updateHostQna(hostQna);
	}
	
	
	
/* 4. 삭제 */
	
	// [이승준] "사업자문의 답변" 삭제
	public void removeHostQnaComment(int hostQnaNo) {
		dl.p("HostQnaService", "removeHostQnaComment()", "시작");
		dl.p("removeHostQnaComment()", "hostQnaNo", hostQnaNo);
		
		hostQnaMapper.deleteHostQnaComment(hostQnaNo);
	}
	
	// [이승준] "사업자문의" 삭제
	public void removeHostQna(int hostQnaNo) {
		dl.p("HostQnaService", "removeHostQna()", "시작");
		dl.p("removeHostQna()", "hostQnaNo", hostQnaNo);
		
		// host Qna 조회
		HostQna hostQna = hostQnaMapper.selectHostQnaOne(hostQnaNo);
		
		// host Qna에 답변이 있는 경우
		if(hostQna.getHostQnaComments() != null) {
			// host Qna 답변 삭제
			hostQnaMapper.deleteHostQnaComment(hostQnaNo);
		}
		// host Qna 삭제
		hostQnaMapper.deleteHostQna(hostQnaNo);
	}
	
	
	
}
