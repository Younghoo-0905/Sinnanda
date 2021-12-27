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
	
	//	Review Comment 등록
	public void addReviewComment(ReviewComment reviewComment) {
		dl.p("ReviewService", "addReviewComment()", "시작");
		dl.p("addReviewComment()", "reviewComment", reviewComment);
		
		reviewMapper.insertReviewComment(reviewComment);
	}
	
	// [이승준] 리뷰 답변 삭제
	public void removeReviewComment(int reviewNo) {
		dl.p("ReviewService", "removeReviewComment()", "시작");
		dl.p("removeReviewComment()", "reviewNo", reviewNo);
		
		reviewMapper.deleteReviewComment(reviewNo);
	}
	
	// [이승준] 리뷰 상세 조회
	public Review getReviewOne(int reviewNo) {
		dl.p("ReviewService", "getReviewOne()", "시작");
		dl.p("getReviewOne()", "reviewNo", reviewNo);
		
		Review review = reviewMapper.selectReviewOne(reviewNo);
		
		return review;
	}
	
	/* [이승준] 호스트 페이지(메인) - 답변이 없는 Complain 목록 조회 */
	// ㄴ리턴 값 : complainList, totalCount, lastPage
	public Map<String, Object> getNotCommentedReviewListForHost(int userLevel, int hostNo, int currentPage, int rowPerPage) {
		dl.p("ReviewService", "getNotCommentedReviewListForHost()", "시작");
		dl.p("getNotCommentedReviewListForHost()", "userLevel", userLevel);
		dl.p("getNotCommentedReviewListForHost()", "hostNo", hostNo);
		dl.p("getNotCommentedReviewListForHost()", "currentPage", currentPage);
		dl.p("getNotCommentedReviewListForHost()", "rowPerPage", rowPerPage);
		
		// 1. 답변 없는 Review 목록 조회를 위한 데이터 가공 (paraComplainMap : userLevel, hostNo, currentPage, rowPerPage)
		Map<String, Object> paraReviewMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraReviewMap.put("userLevel", userLevel);
		paraReviewMap.put("hostNo", hostNo);
		paraReviewMap.put("beginRow", beginRow);
		paraReviewMap.put("rowPerPage", rowPerPage);
		
		// 2. complain 목록 조회
		List<Review> reviewList = reviewMapper.selectNotCommentedReviewList(paraReviewMap);
		
		// 3. complain의 총 개수를 위한 데이터 가공(paraPagingMap : userLevel, hostNo, qnaCategory)
		Map<String, Object> paraPagingMap = new HashMap<>();
		paraPagingMap.put("userLevel", userLevel);
		paraPagingMap.put("hostNo", hostNo);
		
		// 4. complain 총 개수 조회
		int totalCount = reviewMapper.selectNotCommentedReviewTotalCount(paraPagingMap);
		dl.p("getNotCommentedReviewListForHost()", "totalCount", totalCount);
		
		// 5. 페이징: lastPage 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 5-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getNotCommentedReviewListForHost()", "lastPage", lastPage);
		
		// 6. 리턴 모델 가공 (returnMap : reviewList, totalCount, lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("reviewList", reviewList);
		returnMap.put("totalCount", totalCount);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	//	ReviewList 출력
	public Map<String, Object> getReviewList(int hostNo, int beginRow, int rowPerPage) {
		dl.p("ReviewService", "getReviewList()", "시작");
		dl.p("getReviewList()", "hostNo", hostNo);
		dl.p("getReviewList()", "beginRow", beginRow);
		dl.p("getReviewList()", "rowPerPage", rowPerPage);
		
		// 리뷰 목록 조회를 위한 데이터 가공
		Map<String, Object> paraReviewMap = new HashMap<>();
		paraReviewMap.put("hostNo", hostNo);
		paraReviewMap.put("beginRow", beginRow);
		paraReviewMap.put("rowPerPage", rowPerPage);
		
		// *리뷰 목록 조회
		List<Review> reviewList = reviewMapper.selectReviewList(paraReviewMap);
		
		// 리뷰의 총 개수를 위한 데이터 가공
		Map<String, Object> paraPagingMap = new HashMap<>();
		paraPagingMap.put("hostNo", hostNo);
		
		// *리뷰의 총 개수 조회
		int totalCount = reviewMapper.selectReviewTotalCount(paraPagingMap);
		
		// 페이징: lastPage 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getReviewList()", "lastPage", lastPage);
		
		// 6. 리턴 모델 가공 (returnMap : complainList, totalCount, lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("reviewList", reviewList);
		returnMap.put("totalCount", totalCount);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
}
