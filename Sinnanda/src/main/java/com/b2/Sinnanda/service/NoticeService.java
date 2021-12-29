package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.mapper.NoticeMapper;
import com.b2.Sinnanda.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeService {
	@Autowired 
	NoticeMapper noticeMapper;

	//	[김영후]	공지사항 삭제
	public void removeNotice(int noticeNo, int adminNo) {
		log.debug("[Debug] \"START\" NoticeService.removeNotice()");
		log.debug(" ├[param] noticeNo : " + noticeNo);
		log.debug(" ├[param] memberNo : " + adminNo);
		
		noticeMapper.deleteNotice(noticeNo, adminNo);
	}

	//	[김영후]	공지사항 수정
	public void modifyNotice(Notice notice) {
		log.debug("[Debug] \"START\" noticeService.modifynotice()");
		log.debug(" ├[param] notice : " + notice.toString());
		
		noticeMapper.updateNotice(notice);
	}
		
	//	[김영후]	공지사항 추가
	public void addNotice(Notice notice) {
		log.debug("[Debug] \"START\" NoticeService.addNotice()");
		log.debug(" ├[param] notice : " + notice.toString());
		
		noticeMapper.insertNotice(notice);
	}
	
	//	[김영후]	공지사항 상세 조회
	public Notice getNoticeOne(int noticeNo) {
		log.debug("[Debug] \"START\" NoticeService.getNoticeOne()");
		log.debug(" ├[param] noticeNo : " + noticeNo);
		
		return noticeMapper.selectNoticeOne(noticeNo);
	}
	
	//	[김영후]	상단 고정 공지사항, 카테고리별로 공지사항 목록조회
	public Map<String, Object> getNoticeListByCategory(String noticeCategory, int beginRow, int rowPerPage){
		
		//	'전체' 조회인 경우 noticeCategory를 null 값으로 변경하여 쿼리에서 where절이 실행되지 않도록 한다
		if(noticeCategory == null || noticeCategory.equals("전체")) {
			noticeCategory = null;
		}
		
		log.debug("[Debug] \"START\" NoticeService.getNoticeList()");
		log.debug(" ├[param] noticeCategory : " + noticeCategory);
		log.debug(" ├[param] beginRow : " + beginRow);
		log.debug(" ├[param] rowPerPage : " + rowPerPage);
		
		// 1. 매개변수 가공 (paraMap <-- noticeCategory, currentPage, rowPerPage)
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("noticeCategory", noticeCategory);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		// 2. notice 리스트 조회
		List<Notice> noticePinList = noticeMapper.selectNoticePinList();
		List<Notice> noticeList = noticeMapper.selectNoticeListByCategory(paramMap);
		
		// 3. 리턴 값 가공 (return : notice & lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = noticeMapper.selectNoticeTotalCount(noticeCategory);
		log.debug(" ├[param] notice TotalCount : " + totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		log.debug(" ├[param] lastPage : "+lastPage);
		returnMap.put("noticePinList", noticePinList);
		returnMap.put("noticeList", noticeList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("noticeTotalCount", totalCount);
		
		return returnMap;
	}
	
}
