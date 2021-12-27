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
	
// 관리자 기능
	public Map<String, Object> getNoCommentsHostQnaListForAdmin(int userLevel, String hostQnaCategory, int beginRow, int rowPerPage){
		log.debug("[Debug] \"START\" HostQnaService.getNoCommentsHostQnaList()");
		log.debug(" ├[param] userLevel : "+userLevel);
		log.debug(" ├[param] hostQnaCategory : "+hostQnaCategory);
		log.debug(" ├[param] beginRow : "+beginRow);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		// 0. '전체 문의' 조회인 경우 qnaCategory를 null 값으로 변경하여 쿼리에서 where절이 실행되지 않도록 한다 (by 김영후)
		if(hostQnaCategory == null || hostQnaCategory.equals("전체")) {
			hostQnaCategory = null;
		}

		// 1. Host QnA 목록 조회를 위한 데이터 가공 (paraMap : userLevel, hostNo, qnaCategory, beginRow, rowPerPage)
		Map<String, Object> paraQnaListMap = new HashMap<>();
		
		paraQnaListMap.put("userLevel", userLevel);
		paraQnaListMap.put("hostQnaCategory", hostQnaCategory);
		paraQnaListMap.put("beginRow", beginRow);
		paraQnaListMap.put("rowPerPage", rowPerPage);
		
		// 2. host QnA 목록 조회 (paraQnaListMap : (hostQnaCategory, beginRow, rowPerPage))
		List<HostQna> hostQnaList = hostQnaMapper.selectNoCommentsHostQnaList(paraQnaListMap);
		
		// 3. Host QnA의 총 개수를 위한 데이터 가공(paraPagingMap : (hostQnaCategory))
		Map<String, Object> paraPagingMap = new HashMap<>();
		
		paraPagingMap.put("hostQnaCategory", hostQnaCategory);
		
		// 4. Host QnA 총 개수 조회
		int totalCount = hostQnaMapper.selectNoCommentsHostQnaTotalCount(paraPagingMap);
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
	
// 사업자 기능
	
	/* [이승준] 호스트 페이지(메인) - 답변이 없는 Host QnA 목록 조회 */
	public Map<String, Object> getNoCommentsHostQnaListForHost(int userLevel, int hostNo, String hostQnaCategory, int beginRow, int rowPerPage) {
		log.debug("[Debug] \"START\" HostQnaService.getNoCommentsHostQnaListForHost()");
		log.debug(" ├[param] userLevel : "+userLevel);
		log.debug(" ├[param] hostNo : "+hostNo);
		log.debug(" ├[param] hostQnaCategory : "+hostQnaCategory);
		log.debug(" ├[param] beginRow : "+beginRow);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		// 0. '전체 문의' 조회인 경우 qnaCategory를 null 값으로 변경하여 쿼리에서 where절이 실행되지 않도록 한다 (by 김영후)
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
		
		// 2. host QnA 목록 조회 (paraQnaListMap : (hostQnaCategory, beginRow, rowPerPage))
		List<HostQna> hostQnaList = hostQnaMapper.selectNoCommentsHostQnaList(paraQnaListMap);
		
		// 3. Host QnA의 총 개수를 위한 데이터 가공(paraPagingMap : (hostQnaCategory))
		Map<String, Object> paraPagingMap = new HashMap<>();
		paraPagingMap.put("userLevel", userLevel);
		paraPagingMap.put("hostNo", hostNo);
		paraPagingMap.put("hostQnaCategory", hostQnaCategory);
		
		// 4. Host QnA 총 개수 조회
		int totalCount = hostQnaMapper.selectNoCommentsHostQnaTotalCount(paraPagingMap);
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
		returnMap.put("totalCount", totalCount);
		returnMap.put("lastPage", lastPage);
		
		// 7. returnMap : (hostQnaList, lastPage) 리턴
		return returnMap;
	}
	
	/* [이승준] QnA 삽입 */
	public void addHostQna(HostQna hostQna) {
		log.debug("[Debug] \"START\" HostQnaService.addHostQna()");
		log.debug(" ├[param] hostQna : "+hostQna.toString());
		
		hostQnaMapper.insertHostQna(hostQna);
	}
	
// 공통 기능
	
	// [이승준] host Qna 답변 삭제
	public void removeHostQnaComment(int hostQnaNo) {
		dl.p("HostQnaService", "removeHostQnaComment()", "시작");
		dl.p("removeHostQnaComment()", "hostQnaNo", hostQnaNo);
		
		hostQnaMapper.deleteHostQnaComment(hostQnaNo);
	}
	
	// [이승준] host Qna 삭제
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
	
	
	/* [이승준] QnA 수정 */
	public void modifyHostQna(HostQna hostQna) {
		log.debug("[Debug] \"START\" HostQnaService.modifyHostQna()");
		log.debug(" ├[param] hostQna : "+hostQna.toString());
		
		hostQnaMapper.updateHostQna(hostQna);
	}
	
	/* [이승준] Host QnA 상세 조회 */
	public HostQna getHostQnaOne(int hostQnaNo) {
		log.debug("[Debug] \"START\" HostQnaService.getHostQnaOne()");
		log.debug(" ├[param] hostQnaNo : "+hostQnaNo);
		
		return hostQnaMapper.selectHostQnaOne(hostQnaNo);
	}
	
	/* [이승준] Host QnA 목록 조회 by hostQnaCategory */
	public Map<String, Object> getHostQnaListByHostQnaCategory(int userLevel, int hostNo, String hostQnaCategory, int beginRow, int rowPerPage){
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
		List<HostQna> hostQnaList = hostQnaMapper.selectHostQnaListByHostQnaCategory(paraQnaListMap);
		
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
}
