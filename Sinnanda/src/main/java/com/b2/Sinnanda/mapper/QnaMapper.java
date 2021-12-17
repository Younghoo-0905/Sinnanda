package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.QnaComment;

@Mapper
public interface QnaMapper {
	
	void deleteQnaCommentByMember(int qnaNo);
	
	// [이승준] QnA 답변 삭제
	void deleteQnaCommentByAdmin(QnaComment qnaComment);
	
	// [이승준] QnA 답변 삽입
	void insertQnaComment(QnaComment qnaComment);
	
	// [이승준] QnA 삭제
	void deleteQna(int qnaNo, int memberNo);
	
	// [이승준] QnA 수정
	void updateQna(Qna qna);
	
	// [이승준] QnA 삽입
	void insertQna(Qna qna);
	
	// [이승준] QnA 상세 조회
	Qna selectQnaOne(int qnaNo);
	
	// [이승준] QnA 목록 조회
		/* 매개변수 : 페이징을 위한 "qnaCategory, beginRow, rowPerPage" */
	List<Qna> selectQnaListQnaCategory(Map<String, Object> map);
	
	// [이승준] QnA의 총 갯수 조회
	int selectQnaTotalCount(String qnaCategory);
}
