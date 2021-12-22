package com.b2.Sinnanda.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.b2.Sinnanda.mapper.AdminMapper;
import com.b2.Sinnanda.service.AdminService;


@RestController
public class ChartRestController {
	@Autowired AdminMapper adminMapper;
	@Autowired AdminService adminService;
	
	//[윤경환] 정산 차트 
			@GetMapping("/admin/incomeChart")
			public Map<String,Object> incomeChart(@RequestParam(name ="year") int year) {
				Map<String,Object> map = adminService.getIncomeChart(year);
				return map;
				
			}
}
