package com.b2.Sinnanda.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.AdminMapper;
import com.b2.Sinnanda.service.AdminService;


@RestController
public class ChartRestController {
   @Autowired AdminMapper adminMapper;
   @Autowired AdminService adminService;
   @Autowired DL dl;
   //[윤경환] 정산 차트 
         @GetMapping("/admin/getIncomeChart")
         public Map<String,Object> incomeChart(@RequestParam(name ="year") int year) {
            Map<String,Object> map = adminService.getIncomeChart(year);
            return map;
            
         }
         
   //[윤경환] 년동에 따라 회원가입한 수 
         @GetMapping("/admin/getTotalMemberYear")
         public Map<String,Object> memberYear(@RequestParam(name="year") int year){
        	 Map<String,Object> map = adminService.getTotalMemberYear(year);
        	 
        	 dl.p("ChartRestController", "memberYear", map);			
			return map;
        	 
         }
         
      //[윤경환] 년도에 따라 사업자가 회원가입 한 수 
         @GetMapping("/admin/getTotalHostYear")
         public Map<String,Object> hostYear(@RequestParam(name="year") int year){
        	 Map<String,Object> map = adminService.getTotalHostYear(year);
        	 
        	 dl.p("ChartRestController", "hostYear", map);			
			return map;
        	 
         }
}