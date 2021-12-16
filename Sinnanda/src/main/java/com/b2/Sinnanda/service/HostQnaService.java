package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.mapper.HostQnaMapper;
import com.b2.Sinnanda.vo.HostQna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class HostQnaService {
	@Autowired
	private HostQnaMapper hostQnaMapper;
	
	/* [이승준] Host QnA 상세 조회 */
	public HostQna getHostQnaOne(int hostQnaNo) {
		log.debug(" ├[param] hosytQnaNo : "+hostQnaNo);
		
		return hostQnaMapper.selectHostQnaOne(hostQnaNo);
	}
	
	/* [이승준] Host QnA 목록 조회 by hostQnaCategory */
	public Map<String, Object> getHostQnaListByHostQnaCategory(int hostNo, String hostQnaCategory, int currentPage, int rowPerPage){
		log.debug("[Debug] \"START\" HostQnaService.getHostQnaListByQnaCategory()");
		log.debug(" ├[param] hostNo : "+hostNo);
		log.debug(" ├[param] hostQnaCategory : "+hostQnaCategory);
		log.debug(" ├[param] currentPage : "+currentPage);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		//	'전체' 조회인 경우 qnaCategory를 null 값으로 변경하여 쿼리에서 where절이 실행되지 않도록 한다
		if(hostQnaCategory == null || hostQnaCategory.equals("전체")) {
			hostQnaCategory = null;
		}
		
		// 1. 매개변수 가공 (paraMap <-- qnaCategory, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("hostNo", hostNo);
		paraMap.put("hostQnaCategory", hostQnaCategory);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		// 2. qna 리스트 조회
		List<HostQna> hostQnaList = hostQnaMapper.selectHostQnaListByHostQnaCategory(paraMap);
		
		// 3. 리턴 값 가공 (return : qna & lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = hostQnaMapper.selectHostQnaTotalCountAll(2, hostNo, hostQnaCategory);
		log.debug(" ├[param] totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		log.debug(" ├[param] lastPage : "+lastPage);
		returnMap.put("hostQnaList", hostQnaList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
}
