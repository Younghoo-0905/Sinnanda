package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	// [이승준] QnA 답변 삭제
	public void removeQnaComment(User loginUser, int qnaNo) {
		log.debug("[Debug] \"START\" QnaService.removeQnaComment()");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		log.debug(" ├[param] loginUser : "+loginUser.toString());
		
		QnaComment qnaComment = new QnaComment();
		qnaComment.setAdminNo(loginUser.getAdmin().getAdminNo());
		qnaComment.setQnaNo(qnaNo);
		
		qnaMapper.deleteQnaComment(qnaComment);
	}
	
	// [이승준] QnA 답변 삽입
	public void addQnaComment(QnaComment qnaComment) {
		log.debug("[Debug] \"START\" QnaService.addQnaComment()");
		log.debug(" ├[param] qnaComment : "+qnaComment.toString());
		
		qnaMapper.insertQnaComment(qnaComment);
	}
	
	/* [이승준] QnA 삭제 */
	public void removeQna(int qnaNo, int memberNo) {
		log.debug("[Debug] \"START\" QnaService.removeQna()");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		log.debug(" ├[param] memberNo : "+memberNo);
		
		qnaMapper.deleteQna(qnaNo, memberNo);
	}
	
	/* [이승준] QnA 수정 */
	public void modifyQna(Qna qna) {
		log.debug("[Debug] \"START\" QnaService.modifyQna()");
		log.debug(" ├[param] qna : "+qna.toString());
		
		// 비밀글 설정을 하지 않은 경우, 일반문의로 취급
		if(qna.getQnaSecret() == null || qna.getQnaSecret().equals("off")) {
			qna.setQnaSecret("일반문의");
		} else {
			qna.setQnaSecret("비밀문의");
		}
		
		qnaMapper.updateQna(qna);
	}
	
	/* [이승준] QnA 삽입 */
	public void addQna(Qna qna) {
		log.debug("[Debug] \"START\" QnaService.addQna()");
		log.debug(" ├[param] qna : "+qna.toString());
		
		// 비밀글 설정을 하지 않은 경우, 일반문의로 취급
		if(qna.getQnaSecret().equals("off")) {
			qna.setQnaSecret("일반문의");
		} else {
			qna.setQnaSecret("비밀문의");
		}
		
		qnaMapper.insertQna(qna);
	}
	
	/* [이승준] QnA 상세 조회 */
	public Qna getQnaOne(int qnaNo) {
		log.debug("[Debug] \"START\" QnaService.getQnaOne()");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		
		return qnaMapper.selectQnaOne(qnaNo);
	}
	
	/* [이승준] QnA 목록 조회 by Category */
	public Map<String, Object> getQnaListByQnaCategory(String qnaCategory, int beginRow, int rowPerPage){
		
		//	'전체' 조회인 경우 qnaCategory를 null 값으로 변경하여 쿼리에서 where절이 실행되지 않도록 한다
		if(qnaCategory == null || qnaCategory.equals("전체")) {
			qnaCategory = null;
		}
		
		log.debug("[Debug] \"START\" QnaService.getQnaList()");
		log.debug(" ├[param] qnaCategory : "+qnaCategory);
		log.debug(" ├[param] beginRow : "+beginRow);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		// 1. 매개변수 가공 (paraMap <-- qnaCategory, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("qnaCategory", qnaCategory);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		// 2. qna 리스트 조회
		List<Qna> qnaList = qnaMapper.selectQnaListQnaCategory(paraMap);
		
		// 3. 리턴 값 가공 (return : qna & lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = qnaMapper.selectQnaTotalCount(qnaCategory);
		log.debug(" ├[param] totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		log.debug(" ├[param] lastPage : "+lastPage);
		returnMap.put("qnaList", qnaList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
}
