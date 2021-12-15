package com.b2.Sinnanda.service;

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
	public Map<String, Object> getHostQnaListByQnaCategory(String hostQnaCategory, int currentPage, int rowPerPage){
		log.debug("[Debug] \"START\" HostQnaService.getHostQnaListByQnaCategory()");
		log.debug(" ├[param] hostQnaCategory : "+hostQnaCategory);
		log.debug(" ├[param] currentPage : "+currentPage);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		return null;
	}
}
