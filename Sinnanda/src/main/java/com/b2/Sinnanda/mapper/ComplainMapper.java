package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Complain;
import com.b2.Sinnanda.vo.ComplainComment;

//	[김영후]
@Mapper
public interface ComplainMapper {
	
/* 1. 조회 */
	
	// [이승준] (목록)"답변없는 컴플레인 목록" 조회
		// map : userLevel, hostNo, complainCategory, currentPage, rowPerPage
	List<Complain> selectNotCommentedComplainList(Map<String, Object> map);
	
	// [이승준] (개수)"답변없는 컴플레인 개수" 조회
		// map : userLevel, hostNo, complainCategory
	int selectNotCommentedComplainTotalCount(Map<String, Object> map);
	
	// [이승준] (목록)"컴플레인 목록" 조회
		// map : userLevel, hostNo, complainCategory
	List<Complain> selectComplainList(Map<String, Object> map);
	
	// [이승준] (개수)"컴플레인 개수" 조회
		// map : userLevel, hostNo, complainCategory
	int selectComplainTotalCount(Map<String, Object> map);
	
	// [이승준] (상세)"컴플레인 상세" 조회
	Complain selectComplainOne(int complainNo);
	
	
	
/* 2. 삽입 */
	
	// [이승준] "컴플레인" 삽입
	void insertComplain(Complain complain);
	
	// [이승준] "컴플레인 답변" 삽입
	void insertComplainComment(ComplainComment complainComment);
	
	
	
/* 3. 수정 */
	
	// [이승준] "컴플레인" 수정
	void updateComplain(Complain complain);
	
	
	
/* 4. 삭제 */
	
	// [이승준] "컴플레인 답변" 삭제
	void deleteComplainComment(int complainNo);
	
	// [이승준] "컴플레인" 삭제
	void deleteComplain(Complain complain);
	
	
	
}
