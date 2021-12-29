package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Reserve;

@Mapper
public interface ReserveMapper {
	//	[김영후]
	
	//	Reserve (스케쥴러) '이용 완료' 상태변경 
	int modifyReserveUseCheckOut();	
	//	Reserve (스케쥴러) '이용 중' 상태변경 
	int modifyReserveUseCheckIn();
	
	//	Reserve 취소
	void cancelReserve(int reserveNo);
	//	Reserve 등록
	int insertReserve(Reserve reserve);
}
