package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.ReserveMapper;
import com.b2.Sinnanda.vo.Reserve;

@Service
@Transactional
public class ReserveService {
	@Autowired ReserveMapper reserveMapper;
	@Autowired DL dl;
	
	//	[김영후]	Reserve (스케쥴러) '이용 완료' 상태변경
	public int modifyReserveUseCheckOut() {
		return reserveMapper.modifyReserveUseCheckOut();
	}
		
	//	[김영후]	Reserve (스케쥴러) '이용 중' 상태변경
	public int modifyReserveUseCheckIn() {
		return reserveMapper.modifyReserveUseCheckIn();
	}
	
	//	[김영후]	(사업자) 나의 Reserve 목록 출력
	public Map<String, Object> getHostMyReserveList(int hostNo, String reserveUse, int beginRow, int rowPerPage) {
		dl.p("ReserveService", "hostNo", hostNo);
		dl.p("ReserveService", "reserveUse", reserveUse);
		dl.p("ReserveService", "beginRow", beginRow);
		dl.p("ReserveService", "rowPerPage", rowPerPage);

		//	"전체"의 카테고리를 조회하는 경우, null 값으로 변경 -> 쿼리에서 WHERE절이 실행되지 않도록 한다 (by 김영후)
		if(reserveUse.equals("전체")) {
			reserveUse = null;
		}
		
			//	데이터 가공 -> map 형태로 전달
		Map<String, Object> paramReserveListMap = new HashMap<>();
		paramReserveListMap.put("hostNo", hostNo);
		paramReserveListMap.put("reserveUse", reserveUse);
		paramReserveListMap.put("beginRow", beginRow);
		paramReserveListMap.put("rowPerPage", rowPerPage);
				
		//	Reserve 목록과 페이징을 위한 행 개수 연산
		List<Reserve> reserveList = reserveMapper.selectHostMyReserveList(paramReserveListMap);
		int totalCount = reserveMapper.selectHostMyReserveTotalCount(paramReserveListMap);
		dl.p("ReserveService", "totalCount", totalCount);
		
		//	목록의 "마지막 페이지 번호" 가공
		int lastPage = 0;
		lastPage = totalCount / rowPerPage;	// 총 게시글의 개수와 한 페이지에 보여줄 개수를 나눠주면 -> 페이지의 개수
		//	나머지 페이지가 있는 경우
		if(totalCount % rowPerPage != 0 || lastPage == 0) {	// 조건 : 총 페이지(101), 페이지당 출력 개수(10) -> 총 11 페이지가 필요하게 됨으로
			lastPage += 1;
		}
		dl.p("ReserveService()", "lastPage", lastPage);
		
		//	리턴할 모델 가공
		Map<String, Object> returnMap = new HashMap<>();
			returnMap.put("reserveList", reserveList);
			returnMap.put("totalCount", totalCount);
			returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	//	[김영후]	Reserve 취소
	public void cancelReserve(int reserveNo) {
		dl.p("ReserveService", "cancelReserve", reserveNo);
		
		reserveMapper.cancelReserve(reserveNo);
	}
	
	
	//	[김영후]	Reserve 등록
	public void addReserve(Reserve reserve) {
		dl.p("ReserveService", "addReserve", reserve);
		// 입력받은 DATE 값을 DB 세팅에 맞게 format
			//	checkIn 날짜
		String[] checkInData = null;
		checkInData = reserve.getReserveCheckIn().split("/");
		String inYear = checkInData[2];
		String inMonth = checkInData[0];
		String inDay = checkInData[1];
		if(inMonth.length() < 2) {
			inMonth = "0" + inMonth;
		}
		reserve.setReserveCheckIn(inYear + "-" + inMonth + "-" + inDay);
		
			//	checkOut 날짜
		String[] checkOutData = null;
		checkOutData = reserve.getReserveCheckOut().split("/");
		String outYear = checkOutData[2];
		String outMonth = checkOutData[0];
		String outDay = checkOutData[1];
		if(outMonth.length() < 2) {
			outMonth = "0" + outMonth;
		}
		reserve.setReserveCheckOut(outYear + "-" + outMonth + "-" + outDay);		
		
		reserveMapper.insertReserve(reserve);
	}
}
