package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.HostQna;

@Mapper
public interface HostQnaMapper {
	
	// [이승준] Host QnA 상세 조회
	HostQna selectHostQnaOne(int hostQnaNo);
	
	// [이승준] Host QnA 목록 조회
		/* 매개변수 : 페이징을 위한 "hostQnaCategory, beginRow, rowPerPage" */
	List<HostQna> selectHostQnaListQnaCategory(Map<String, Object> map);
	
	// [이승준] Host QnA의 총 갯수 조회
	int selectHostQnaTotalCount();
}
