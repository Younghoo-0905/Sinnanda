package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.HostQna;
import com.b2.Sinnanda.vo.Qna;

@Mapper
public interface HostQnaMapper {
	
// 관리자 기능
	// [이승준] 답변없는 Host QnA 목록 조회
	// ㄴ매개변수(map) : hostQnaCategory, currentPage, rowPerPage
	List<HostQna> selectNoCommentsHostQnaList(Map<String, Object> map);
	
	// [이승준] 답변없는 Host QnA 개수 조회
	// ㄴ매개변수(map) : hostQnaCategory
	int selectNoCommentsHostQnaTotalCount(Map<String, Object> map);
	
// 사업자 기능
		
	// [이승준] Host QnA 수정
	void updateHostQna(HostQna hostQna);
	
	// [이승준] Host QnA 삽입
	void insertHostQna(HostQna HostQna);
	
// 공통 기능
	
	// [이승준] Host QnA 상세 조회
	HostQna selectHostQnaOne(int hostQnaNo);
	
	// [이승준] Host QnA 목록 조회
	// ㄴ매개변수(map) : userLevel, hostNo, hostQnaCategory, currentPage, rowPerPage
	List<HostQna> selectHostQnaListByHostQnaCategory(Map<String, Object> map);
	
	// [이승준] Host QnA 개수 조회
	// ㄴ매개변수(map) : userLevel, hostNo, hostQnaCategory
	int selectHostQnaTotalCount(Map<String, Object> map);
}
