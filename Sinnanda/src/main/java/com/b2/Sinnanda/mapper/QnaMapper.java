package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.QnaComment;

@Mapper
public interface QnaMapper {
	
/* 1. 조회 */
	
	// [이승준] (목록)"회원문의 목록" 조회
		// map : qnaCategory, beginRow, rowPerPage
	List<Qna> selectQnaList(Map<String, Object> map);
	
	// [이승준] (개수)"회원문의 개수" 조회
	int selectQnaTotalCount(String qnaCategory);
	
	// [이승준] (상세)"회원문의 상세" 조회
	Qna selectQnaOne(int qnaNo);
	
	//[윤경환] 관리자 답변이 없는 회원 Qna
	List<Qna> selectAdminQnaList(Map<String,Object> map);
	
	//[윤경환] 관리자 답변이 없는 회원 Qna 수
	int selectAdminQnaTotalCount();
	
	
/* 2. 삽입 */
	
	// [이승준] "회원문의" 삽입
	void insertQna(Qna qna);
	
	// [이승준] "회원문의 답변" 삽입
	void insertQnaComment(QnaComment qnaComment);
	
	
	
/* 3. 수정 */
	
	// [이승준] "회원문의" 수정
	void updateQna(Qna qna);
	
	
	
/* 4. 삭제 */
	
	// [이승준] "회원문의 답변" 삭제
	void deleteQnaComment(int qnaNo);
	
	// [이승준] "회원문의" 삭제
	void deleteQna(int qnaNo);
	
	
	
}
