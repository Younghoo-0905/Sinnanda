package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.QnaMapper;
import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.QnaComment;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class QnaService {
	@Autowired
	private QnaMapper qnaMapper;
	@Autowired
	private DL dl;
	
/* 1. 조회 */
	
	// [이승준] "회원문의 목록" 조회
	public Map<String, Object> getQnaList(String qnaCategory, int beginRow, int rowPerPage){
		dl.p("QnaService", "getQnaList()", "시작");
		dl.p("getQnaList()", "qnaCategory", qnaCategory);
		dl.p("getQnaList()", "beginRow", beginRow);
		dl.p("getQnaList()", "rowPerPage", rowPerPage);
		
		// 0. "전체"의 카테고리를 조회하는 경우, null 값으로 변경 -> 쿼리에서 WHERE절이 실행되지 않도록 한다 (by 김영후)
		if(qnaCategory == null || qnaCategory.equals("전체")) {
			qnaCategory = null;
		}
		
		// 1. "회원문의 목록"을 위한 데이터 가공
		Map<String, Object> paraQnaListMap = new HashMap<>();
			paraQnaListMap.put("qnaCategory", qnaCategory);
			paraQnaListMap.put("beginRow", beginRow);
			paraQnaListMap.put("rowPerPage", rowPerPage);
		
		// 2. "회원문의 목록" 조회 쿼리 실행
		List<Qna> qnaList = qnaMapper.selectQnaList(paraQnaListMap);
		
		// 3. "회원문의 개수" 조회
		int totalCount = qnaMapper.selectQnaTotalCount(qnaCategory);
		dl.p("getQnaList()", "totalCount", totalCount);
		
		// 4. 해당 목록의 "끝 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		// 4-1. 나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("getQnaList()", "lastPage", lastPage);
		
		// 5. 리턴할 모델 가공
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("qnaList", qnaList);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
		
		// 6. 리턴 : "회원문의 목록", "회원문의 개수", "마지막 페이지"
		return returnMap;
	}
	
	// [이승준] "회원문의 상세" 조회
	public Qna getQnaOne(int qnaNo) {
		dl.p("QnaService", "getQnaOne()", "시작");
		dl.p("getQnaOne()", "qnaNo", qnaNo);
		
		return qnaMapper.selectQnaOne(qnaNo);
	}
	//[윤경환] 관리자 답변이 없는 화원 QNA
	public Map<String,Object> getAdminQnaList(int beginRow, int rowPerPage){
		Map<String, Object> paraQnaListMap = new HashMap<>();
		paraQnaListMap.put("beginRow", beginRow);
		paraQnaListMap.put("rowPerPage", rowPerPage);
		
		List<Qna> adminQnaList = qnaMapper.selectAdminQnaList(paraQnaListMap);
		dl.p("getAdminQnaList", "AdminQnaList", adminQnaList);
		
		int totalCount = qnaMapper.selectAdminQnaTotalCount();
		dl.p("getAdminQnaList()", "totalCount", totalCount);
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("adminQnaList", adminQnaList);
		returnMap.put("totalCount", totalCount);
		
		
		return returnMap;
		
	}
	
	
	
/* 2. 삽입 */
	
	// [이승준] "회원문의" 삽입
	public void addQna(Qna qna) {
		dl.p("QnaService", "addQna()", "시작");
		dl.p("addQna()", "qna", qna.toString());
		
		// 0. '비밀문의'로 설정되지 않은 경우 -> '일반문의'로 취급
		if(qna.getQnaSecret() == null || qna.getQnaSecret().equals("off")) {
			qna.setQnaSecret("일반문의");
		} else {
			qna.setQnaSecret("비밀문의");
		}
		
		// 1. "회원문의" 삽입
		qnaMapper.insertQna(qna);
	}
	
	// [이승준] "회원문의 답변" 삽입
	public void addQnaComment(QnaComment qnaComment) {
		dl.p("QnaService", "addQnaComment()", "시작");
		dl.p("addQnaComment()", "qnaComment", qnaComment.toString());
		
		qnaMapper.insertQnaComment(qnaComment);
	}
	
	
	
/* 3. 수정 */
	
	// [이승준] "회원문의" 수정
	public void modifyQna(Qna qna) {
		dl.p("QnaService", "modifyQna()", "시작");
		dl.p("modifyQna()", "qna", qna.toString());
		
		// 0. '비밀문의'로 설정되지 않은 경우 -> '일반문의'로 취급
		if(qna.getQnaSecret() == null || qna.getQnaSecret().equals("off")) {
			qna.setQnaSecret("일반문의");
		} else {
			qna.setQnaSecret("비밀문의");
		}
		
		// 1. "회원문의" 수정
		qnaMapper.updateQna(qna);
	}
	
	
	
/* 4. 삭제 */
	
	// [이승준] "회원문의 답변" 삭제
	public void removeQnaComment(int qnaNo) {
		dl.p("QnaService", "removeQnaComment()", "시작");
		dl.p("removeQnaComment()", "qnaNo", qnaNo);
		
		qnaMapper.deleteQnaComment(qnaNo);
	}
	
	// [이승준] "회원문의" 삭제
	public void removeQna(int qnaNo) {
		dl.p("QnaService", "removeQna()", "시작");
		dl.p("removeQna()", "qnaNo", qnaNo);
		
		// 1. 답변의 유무를 위해, "회원문의 상세" 조회
		Qna qna = qnaMapper.selectQnaOne(qnaNo);
		
		// 2. "회원문의"에 "답변"이 있는 경우
		if(qna.getQnaComments() != null) {
			// 2-1. "회원문의 답변" 삭제
			qnaMapper.deleteQnaComment(qnaNo);
		}
		
		// 3. "회원문의" 삭제
		qnaMapper.deleteQna(qnaNo);
	}
	
	
	
}
