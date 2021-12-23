package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.ReviewMapper;
import com.b2.Sinnanda.vo.Review;
import com.b2.Sinnanda.vo.ReviewComment;

@Service
@Transactional
public class ReviewService {		//	[김영후]
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	DL dl;
	
	//	Review Comment 등록
	public void addReviewComment(ReviewComment reviewComment) {
		dl.p("ReviewService", "getReviewList", reviewComment);
		
		reviewMapper.insertReviewComment(reviewComment);
	}
	
	//	NotCommented ReviewList 출력
	public List<Review> getNotCommentedReviewList(int hostNo) {
		dl.p("ReviewService", "getReviewList", hostNo);
		
		List<Review> reviewList = reviewMapper.selectNotCommentedReviewList(hostNo);
		
		return reviewList;
	}
	
	//	ReviewList 출력
	public List<Review> getReviewList(int hostNo, int beginRow, int rowPerPage) {
		dl.p("ReviewService", "getReviewList", hostNo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("hostNo", hostNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Review> reviewList = reviewMapper.selectReviewList(map);
		
		return reviewList;
	}
}
