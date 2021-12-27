package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Review;
import com.b2.Sinnanda.vo.ReviewComment;

@Mapper
public interface ReviewMapper {		//	[김영후]
	
	//	Review Comment 등록
	void insertReviewComment(ReviewComment reviewComment);
	
	// Review 상세 조회
	Review selectReviewOne(int reviewNo);
	
	// Review 목록조회 (사업자 페이지)
	List<Review> selectReviewList(Map<String, Object> map);
	// [이승준] Review 총 개수
	int selectReviewTotalCount(Map<String, Object> map);
	
	//	Not Commented Review 목록조회 (사업자 페이지) 
	// ㄴ매개변수 : 
	List<Review> selectNotCommentedReviewList(Map<String, Object> map);
	
	// [이승준] 답변이 없는 컴플레인의 총 개수
	// ㄴ매개변수(map) : userLevel, hostNo, complainCategory, currentPage, rowPerPage
	int selectNotCommentedReviewTotalCount(Map<String, Object> map);
}
