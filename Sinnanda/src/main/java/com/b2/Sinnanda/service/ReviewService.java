package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.ReviewMapper;
import com.b2.Sinnanda.vo.Complain;
import com.b2.Sinnanda.vo.Review;
import com.b2.Sinnanda.vo.ReviewComment;

@Service
@Transactional
public class ReviewService {		//	[김영후]
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	DL dl;
	
/* 1. 조회 */
	
	// [이승준] 답변없는 "리뷰 목록" 조회
	public Map<String, Object> getNotCommentedReviewList(int userLevel, int hostNo, int beginRow, int rowPerPage) {
		dl.p("ReviewService", "getNotCommentedReviewList()", "시작");
		dl.p("getNotCommentedReviewList()", "userLevel", userLevel);
		dl.p("getNotCommentedReviewList()", "hostNo", hostNo);
		dl.p("getNotCommentedReviewList()", "beginRow", beginRow);
		dl.p("getNotCommentedReviewList()", "rowPerPage", rowPerPage);
		
		// 1. "답변없는 리뷰 목록"을 위한 데이터 가공
		Map<String, Object> paraReviewMap = new HashMap<>();
			paraReviewMap.put("userLevel", userLevel);
			paraReviewMap.put("hostNo", hostNo);
			paraReviewMap.put("beginRow", beginRow);
			paraReviewMap.put("rowPerPage", rowPerPage);
		
		// 2. "답변없는 리뷰 목록" 조회 쿼리 실행
		List<Review> reviewList = reviewMapper.selectNotCommentedReviewList(paraReviewMap);
		
		// 3. "답변없는 리뷰 개수"를 위한 데이터 가공
		Map<String, Object> paraPagingMap = new HashMap<>();
			paraPagingMap.put("userLevel", userLevel);
			paraPagingMap.put("hostNo", hostNo);
		
		// 4. "답변없는 리뷰 개수" 조회
		int totalCount = reviewMapper.selectNotCommentedReviewTotalCount(paraPagingMap);
		dl.p("getNotCommentedReviewList()", "totalCount", totalCount);
		
		// 5. 해당 목록의 "끝 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getNotCommentedReviewList()", "lastPage", lastPage);
		
		// 6. 리턴할 모델 가공
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("reviewList", reviewList);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
		
		// 7. 리턴 : "답변없는 리뷰 목록", "답변없는 리뷰 개수", "마지막 페이지"
		return returnMap;
	}

	// [이승준] "리뷰 목록" 조회
	public Map<String, Object> getReviewList(int hostNo, int beginRow, int rowPerPage) {
		dl.p("ReviewService", "getReviewList()", "시작");
		dl.p("getReviewList()", "hostNo", hostNo);
		dl.p("getReviewList()", "beginRow", beginRow);
		dl.p("getReviewList()", "rowPerPage", rowPerPage);
		
		// 1. "리뷰 목록"을 위한 데이터 가공
		Map<String, Object> paraReviewMap = new HashMap<>();
			paraReviewMap.put("hostNo", hostNo);
			paraReviewMap.put("beginRow", beginRow);
			paraReviewMap.put("rowPerPage", rowPerPage);
		
		// 2. "리뷰 목록" 조회 쿼리 실행
		List<Review> reviewList = reviewMapper.selectReviewList(paraReviewMap);
		
		// 3. "리뷰 개수"를 위한 데이터 가공
		Map<String, Object> paraPagingMap = new HashMap<>();
			paraPagingMap.put("hostNo", hostNo);
		
		// 4. "리뷰 개수" 조회
		int totalCount = reviewMapper.selectReviewTotalCount(paraPagingMap);
		
		// 5. 해당 목록의 "끝 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getReviewList()", "lastPage", lastPage);
		
		// 6. 리턴 모델 가공 (returnMap : complainList, totalCount, lastPage)
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("reviewList", reviewList);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
		
		// 7. 리턴 : "리뷰 목록", "리뷰 개수", "마지막 페이지"
		return returnMap;
	}
		
	// [이승준] "리뷰 상세" 조회
	public Review getReviewOne(int reviewNo) {
		dl.p("ReviewService", "getReviewOne()", "시작");
		dl.p("getReviewOne()", "reviewNo", reviewNo);
		
		return reviewMapper.selectReviewOne(reviewNo);
	}
	
	
	
/* 2. 삽입 */
	
	// [이승준] "리뷰" 삽입
	public void addReview(Review review) {
		dl.p("ReviewService", "addReview()", "시작");
		dl.p("addReview()", "review", review.toString());
		
		reviewMapper.insertReview(review);
	}
	
	// [이승준] "리뷰 답변" 삽입
	public void addReviewComment(ReviewComment reviewComment) {
		dl.p("ReviewService", "addReviewComment()", "시작");
		dl.p("addReviewComment()", "reviewComment", reviewComment.toString());
		
		reviewMapper.insertReviewComment(reviewComment);
	}
	
	

/* 3. 수정 */
	
	
	
	
	
/* 4. 삭제 */
	
	// [이승준] "컴플레인 답변" 삭제
	public void removeReviewComment(int reviewNo) {
		dl.p("ReviewService", "removeReviewComment()", "시작");
		dl.p("removeReviewComment()", "reviewNo", reviewNo);
		
		reviewMapper.deleteReviewComment(reviewNo);
	}
	
	
	
}
