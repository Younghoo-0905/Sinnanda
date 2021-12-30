package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Reserve;

@Mapper
public interface ReserveMapper {
	//	[김영후]
	
	//	Reserve (사업자) 예약목록 개수 출력
	int selectHostMyReserveTotalCount(Map<String, Object> map);
	//	Reserve (사업자) 나의 예약목록 출력
	List<Reserve> selectHostMyReserveList(Map<String, Object> map);
	
	//	Reserve (스케쥴러) '이용 완료' 상태변경 
	int modifyReserveUseCheckOut();	
	//	Reserve (스케쥴러) '이용 중' 상태변경 
	int modifyReserveUseCheckIn();
	
	//	Reserve 취소
	void cancelReserve(int reserveNo);
	//	Reserve 등록
	int insertReserve(Reserve reserve);
}
