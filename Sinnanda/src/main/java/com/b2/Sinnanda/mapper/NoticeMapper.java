package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Notice;

@Mapper
public interface NoticeMapper {

	//	[김영후]	notice 삭제
	void deleteNotice(int noticeNo, int adminNo);

	//	[김영후]	notice 수정
	void updateNotice(Notice notice);
	
	//	[김영후]	notice 등록
	void insertNotice(Notice notice);
	
	//	[김영후]	notice 상세 조회
	Notice selectNoticeOne(int noticeNo);
	
	//	[김영후]	noticeList 출력
	List<Notice> selectNoticeListByCategory(Map<String, Object> map);
	
	//	[김영후]	notice 총 갯수 조회
	int selectNoticeTotalCount(String noticeCategory);
}
