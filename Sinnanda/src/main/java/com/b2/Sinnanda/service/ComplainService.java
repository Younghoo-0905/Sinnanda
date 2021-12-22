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

@Transactional
@Service
public class ComplainService {	//	[김영후]
	@Autowired 
	private ComplainMapper complainMapper;
	@Autowired
	DL dl;
	
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
		dl.p("ComplainService", "getComplainOne", complainNo);
		
		Complain complain = complainMapper.selectComplainOne(complainNo);
		
		return complain;
	}
	
	//	NotCommentedComplainList 출력
	public List<Complain> getNotCommentedComplainList(int hostNo) {
		dl.p("ComplainService", "getNotCommentedComplainList", hostNo);		

		List<Complain> complainList = complainMapper.selectNotCommentedComplainList(hostNo);
		return complainList;
	}
	
	//	ComplainList 출력
	public List<Complain> getComplainList(int hostNo, int beginRow, int rowPerPage) {
		dl.p("ComplainService", "getComplainList", hostNo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("hostNo", hostNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Complain> complainList = complainMapper.selectComplainList(map);
		return complainList;
	}
}
