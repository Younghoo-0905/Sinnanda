package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Review;
import com.b2.Sinnanda.vo.ReviewComment;

@Mapper
public interface ReviewMapper {		//	[김영후]
	
/* 1. 조회 */
	
	// [이승준] (목록)"답변없는 리뷰 목록" 조회
		// map : userLevel, hostNo, beginRow, rowPerPage
	List<Review> selectNotCommentedReviewList(Map<String, Object> map);
	
	// [이승준] (개수)"답변없는 리뷰 개수" 조회
		// map : userLevel, hostNo
	int selectNotCommentedReviewTotalCount(Map<String, Object> map);
	
	// [이승준] (목록)"리뷰 목록" 조회
		// map : hostNo, beginRow, rowPerPage
	List<Review> selectReviewList(Map<String, Object> map);
	
	// [이승준] (개수)"리뷰 개수" 조회
		// map : hostNo
	int selectReviewTotalCount(Map<String, Object> map);
	
	// [이승준] (상세)"리뷰 상세" 조회
	Review selectReviewOne(int reviewNo);
	
	
	
/* 2. 삽입 */
	
	// [이승준] "리뷰" 삽입
	void insertReview(Review review);
	
	// [이승준] "리뷰 답변" 삽입
	void insertReviewComment(ReviewComment reviewComment);
	
	
/* 3. 수정 */
	
	
	
	
	
	
/* 4. 삭제 */
	
	// [이승준] "리뷰 답변" 삭제
	void deleteReviewComment(int reviewNo);
	
	// [이승준] "리뷰" 삭제
	void deleteReview(int reviewNo);
	
	
	
}