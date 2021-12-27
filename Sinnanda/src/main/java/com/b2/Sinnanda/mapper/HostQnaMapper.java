package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.HostQna;
import com.b2.Sinnanda.vo.Qna;

@Mapper
public interface HostQnaMapper {
	
/* 1. 조회 */
	
	// [이승준] (목록)"답변없는 사업자문의 목록" 조회
		// map : userLevel ,hostNo, hostQnaCategory, currentPage, rowPerPage
	List<HostQna> selectNoCommentedHostQnaList(Map<String, Object> map);
	
	// [이승준] (개수)"답변없는 사업자문의 개수" 조회
		// map : userLevel, hostNo, hostQnaCategory
	int selectNoCommentedHostQnaTotalCount(Map<String, Object> map);
	
	// [이승준] (목록)"사업자문의 목록" 조회
		// map : userLevel, hostNo, hostQnaCategory, currentPage, rowPerPage
	List<HostQna> selectHostQnaList(Map<String, Object> map);
	
	// [이승준] (개수)"사업자문의 개수" 조회
		// map : userLevel, hostNo, hostQnaCategory
	int selectHostQnaTotalCount(Map<String, Object> map);
	
	// [이승준] (상세)"사업자문의 상세" 조회
	HostQna selectHostQnaOne(int hostQnaNo);
	
	
	
/* 2. 삽입 */
	
	// [이승준] "사업자문의" 삽입
	void insertHostQna(HostQna HostQna);
	
	
	
/* 3. 수정 */
	
	// [이승준] "사업자문의" 수정
	void updateHostQna(HostQna hostQna);
	
	
	
/* 4. 삭제 */
	
	// [이승준] "사업자문의 답변" 삭제
	void deleteHostQnaComment(int hostQnaNo);
	
	// [이승준] "사업자문의" 삭제
	void deleteHostQna(int hostQnaNo);
	
	
}
