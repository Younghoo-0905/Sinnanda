package com.b2.Sinnanda.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.AdminMapper;
import com.b2.Sinnanda.mapper.MemberMapper;
import com.b2.Sinnanda.service.AdminService;
import com.b2.Sinnanda.service.HostService;
import com.b2.Sinnanda.service.MemberService;
import com.b2.Sinnanda.vo.Host;
import com.b2.Sinnanda.vo.User;


@RestController
public class ChartRestController {
   @Autowired AdminMapper adminMapper;
   @Autowired AdminService adminService;
   @Autowired DL dl;
   @Autowired HostService hostService;
   @Autowired MemberMapper memberMapper;
   @Autowired MemberService memberService;
   
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
         //[운경환] 년도에 따른 숙박업속 종류수 
         @GetMapping("/admin/getTotalAccomYear")
         public Map<String, Object> AccomYear(@RequestParam(name="year") int year, 
        		 @RequestParam(defaultValue = "전체") String accomName){
					
        	 Map<String,Object> map = adminService.getTotalAccomYear(year,accomName);
        	 dl.p("ChartRestController", "AccomYear", map);
        	 return map;
        	 
         }
         
         //[윤경환] '호스트' 숙소에 따른 정산
         @GetMapping("/host/getmyHostRevenue")
         public Map<String,Object> myHostRevenue(@RequestParam(name ="year") int year,
        		 @RequestParam(defaultValue = "전체") String accomName,
        		 HttpSession session){
             
        	 User loginUser = (User)session.getAttribute("loginUser");
        	 dl.p("AccomHostYear", "loginUser", loginUser);
        	 
        	 Map<String,Object> map  = hostService.getTotalAccomHostYear(year, loginUser.getHost().getHostNo(), accomName);
        	 dl.p("AccomHostYear", "map", map);
			
        	 return map;
        	 
        	 
        		 
         }
         //[윤경환] '호스트' 숙소에 따른 수수료
         @GetMapping("/host/getmyHostCommission")
         public Map<String,Object> myHostCommission(@RequestParam(name ="year") int year,
        		 @RequestParam(defaultValue = "전체") String accomName,
        		 HttpSession session){
             
        	 User loginUser = (User)session.getAttribute("loginUser");
        	 dl.p("AccomHostYear", "loginUser", loginUser);
        	 
        	 Map<String,Object> map  = hostService.getTotalDeduHostYear(year, loginUser.getHost().getHostNo(), accomName);
        	 dl.p("AccomHostYear", "map", map);
			
        	 return map;
         }
         
         //[윤경환] '호스트' 숙소에 따른 컴플레인 
         @GetMapping("/host/getHostComplainChart")
         public Map<String,Object> myHostComplain(@RequestParam(name ="year") int year,
        		 @RequestParam(defaultValue = "전체") String accomName,
        		 HttpSession session){
             
        	 User loginUser = (User)session.getAttribute("loginUser");
        	 dl.p("AccomHostYear", "loginUser", loginUser);
        	 
        	 Map<String,Object> map  = hostService.getTotalComplainYear(year, loginUser.getHost().getHostNo(), accomName);
        	 dl.p("AccomHostYear", "map", map);
			
        	 return map;
         }
         //[윤경환] '호스트 ' 숙소에 따른 리뷰 
         @GetMapping("/host/getHostReviewChart")
         public Map<String,Object> myHostReview(@RequestParam(name ="year") int year,
        		 @RequestParam(defaultValue = "전체") String accomName,
        		 HttpSession session){
             
        	 User loginUser = (User)session.getAttribute("loginUser");
        	 dl.p("AccomHostYear", "loginUser", loginUser);
        	 
        	 Map<String,Object> map  = hostService.getTotalReviewYear(year, loginUser.getHost().getHostNo(), accomName);
        	 dl.p("AccomHostYear", "map", map);
			
        	 return map;
         }
         
         
         // [유동진] 정산 차트 
         @GetMapping("/member/getMemberPaymentChart")
         public Map<String,Object> memberPaymentChart(HttpSession session, @RequestParam(name ="year") int year) {
      	   User loginUser = (User)session.getAttribute("loginUser");
      	   dl.p("ChartRestController", "memberPaymentCHart", "loginUser : " + loginUser);
      	   
      	   Map<String,Object> map = memberService.getMemberPaymentChart(year, loginUser.getMember().getMemberNo());
      
      	   return map;  
         }


         // [유동진] 회원 년도별 이용횟수 차트 
         @GetMapping("/member/getMemberUseChart")
         public Map<String,Object> memberUseChart(HttpSession session, @RequestParam(name ="year") int year) {
      	   
      	   User loginUser = (User)session.getAttribute("loginUser");
      	   dl.p("ChartRestController", "memberPaymentCHart", "loginUser : " + loginUser);
      	   
      	   Map<String,Object> map = memberService.getMemberUseChart(year, loginUser.getMember().getMemberNo());
      
      	   return map;  
         }
         
         
}