package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Complain;
import com.b2.Sinnanda.vo.ComplainComment;

//	[김영후]
@Mapper
public interface ComplainMapper {
	
	
	
	//	Complain Comment 삭제
	void deleteComplainComment(int complainNo);
	
	//	Complain Comment 추가
	void insertComplainComment(ComplainComment complainComment);
	
	//	Complain 삭제
	void deleteComplain(Complain complain);
	
	//	Complain 수정
	void updateComplain(Complain complain);
	
	//	Complain 추가
	void insertComplain(Complain complain);
	
	//	Complain 상세조회
	Complain selectComplainOne(int complainNo);
	
	// [이승준] complain 목록 조회
	// ㄴ매개변수(map) : userLevel, hostNo, complainCategory
	List<Complain> selectComplainList(Map<String, Object> map);
	
	// [이승준] complain 총 개수 조회
	// ㄴ매개변수(map) : userLevel, hostNo, complainCategory
	int selectComplainTotalCount(Map<String, Object> map);
	
// 공통(사업자/관리자) 기능
	//	NotCommented Complain 목록조회
	// ㄴ매개변수(ma) : userLevel, hostNo, complainCategory, currentPage, rowPerPage
	List<Complain> selectNotCommentedComplainList(Map<String, Object> map);
	
	// [이승준] 답변이 없는 컴플레인의 총 개수
	// ㄴ매개변수(ma) : userLevel, hostNo, complainCategory, currentPage, rowPerPage
	int selectNotCommentedComplainTotalCount(Map<String, Object> map);
}
