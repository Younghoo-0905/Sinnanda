package com.b2.Sinnanda.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.ReserveService;

@Component
public class ReserveScheduler {
	//@Autowired ReserveService reserveService;
	//@Autowired DL dl;
	
	//	[김영후] 30분마다, 체크인 시간이 지난 예약내역 상태변경 -> '이용 중' (당일 취소 불가)
	@Scheduled(cron = "0 30 * * * *")
	public void modifyReserveUseCheckIn() {
		//int row = reserveService.modifyReserveUseCheckIn();
		//dl.p("ReserveScheduler", "modifyReserveUseCheckIn", row + "행을 '이용 중' 상태로 변경 완료");
	}
	
	//	[김영후] 30분마다, 체크아웃 시간이 지난 예약내역 상태변경 -> '이용 완료'
	@Scheduled(cron = "0 30 * * * *")
	public void modifyReserveUseCheckOut() {
		//int row = reserveService.modifyReserveUseCheckOut();
		//dl.p("ReserveScheduler", "modifyReserveUseCheckOut", row + "행을 '이용 완료' 상태로 변경 완료");
	}
}
