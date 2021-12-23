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
	
	//	Not Commented Review 목록조회 (사업자 페이지) 
	List<Review> selectNotCommentedReviewList(int hostNo);
	
	//	Review 목록조회 (사업자 페이지)
	List<Review> selectReviewList(Map<String, Object> map);
}
