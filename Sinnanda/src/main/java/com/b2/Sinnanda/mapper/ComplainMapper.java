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
	
	//	NotCommented Complain 목록조회
	List<Complain> selectNotCommentedComplainList(int hostNo);
	
	//	Complain 목록조회
	List<Complain> selectComplainList(Map<String, Object> map);
}
