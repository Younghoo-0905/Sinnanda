package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Qna;

@Mapper
public interface QnaMapper {
	// [이승준] QnA 목록 조회
	/* 매개변수 : 페이징을 위한 "beginRow, rowPerPage" */
	List<Qna> selectQnaList(Map<String, Object> map);
	
	// [이승준] QnA 갯수 조회
	int selectQnaTotalCount();
}
