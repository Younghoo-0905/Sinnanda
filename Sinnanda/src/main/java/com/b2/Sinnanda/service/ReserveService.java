package com.b2.Sinnanda.service;

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
	
	public void addReserve(Reserve reserve) {
		
		//	입력받은 DATE 값을 DB 세팅에 맞게 format
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
