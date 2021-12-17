package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Accom;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.Room;
@Mapper
public interface SearchAccomMapper {
	//[이원희] 숙소이름 검색
	Accom selectAccomList(Accom accom);
	List<Accom> selectAccomListByName(Map<String, Object> map);
	//[이원희] 검색된 숙소 갯수
	int selectAccomTotalCount(String accomName);
	//[이원희] 숙소별 별점 값
	List<Double> selectAccomRank(Map<String, Object> map);
	//[이원희] 해당 숙소 정보
	Accom selectAccomOne(Integer accomNo);
	//[이원희] 해당 숙소 객실 리스트
	List<Room>selectAccomOneByRoom(Integer AccomNo);
}
