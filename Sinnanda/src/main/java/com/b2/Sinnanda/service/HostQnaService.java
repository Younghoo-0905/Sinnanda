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
	
	/* [이승준] QnA 상세 조회 */
	public HostQna getHostQnaOne(int hosytQnaNo) {
		
		return hostQnaMapper.selectHostQnaOne(hosytQnaNo);
	}
	
	/* [이승준] HOst QnA 목록 조회 by Category */
	public Map<String, Object> getHostQnaListByHostQnaCategory(int hostNo, String hostQnaCategory, int currentPage, int rowPerPage){
		log.debug("[Debug] \"START\" HostQnaService.getHostQnaListByQnaCategory()");
		log.debug(" ├[param] hostNo : "+hostNo);
		log.debug(" ├[param] hostQnaCategory : "+hostQnaCategory);
		log.debug(" ├[param] currentPage : "+currentPage);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
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
		int totalCount = hostQnaMapper.selectHostQnaTotalCount();
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
