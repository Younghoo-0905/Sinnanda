package com.b2.Sinnanda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.ReserveService;
import com.b2.Sinnanda.vo.Reserve;

@Controller
public class ReserveController {
	@Autowired ReserveService reserveService;
	@Autowired DL dl;
	
	@PostMapping("/member/addReserve")
	public String addReserve(Reserve reserve) {
		dl.p("ReserveController", "addReserve", reserve);
		
		reserveService.addReserve(reserve);
		
		return "redirect:/searchRoomOne?roomNo=" + reserve.getRoomNo();
	}
}


