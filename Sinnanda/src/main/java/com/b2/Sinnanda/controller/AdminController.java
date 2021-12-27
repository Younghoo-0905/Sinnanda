package com.b2.Sinnanda.controller;

import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.AdminMapper;
import com.b2.Sinnanda.service.AdminService;
import com.b2.Sinnanda.service.HostQnaService;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.AdminSales;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class AdminController {
   @Autowired AdminService adminService;
   @Autowired HostQnaService hostQnaService;
   @Autowired AdminMapper adminMapper;
   
   @Autowired DL dl;
   
   
   // [윤경환] Admin 목록 페이징용 상수
      private final int ROW_PER_PAGE = 10;
   
   //[윤경환] 관리자 회원가입
   @GetMapping("/admin/insertAdminForm")
   public String getInsertAdmin() {
      
      return "admin/insertAdminForm";
   }
   @PostMapping("admin/insertAdminForm")
   public String postInsertAdmin(Admin admin) {
      log.debug("admin<-----"+admin);
      adminService.addAdmin(admin);
      
      return "redirect:/admin/adminList?currentPage="+1;
   }
   
   //[윤경환] 관리자 페이지
   @GetMapping("/admin/adminPage")
   public String getAdminPage(HttpServletRequest request, Model model, 
         @RequestParam(defaultValue = "전체") String hostQnaCategory,
         @RequestParam(defaultValue = "1") int currentPage) {
      // 로그인 세션 조회
      HttpSession session = request.getSession();
      User loginUser = (User)session.getAttribute("loginUser");
      
      //이슈 로그인된값이 같지 않으면 index 페이지로 리턴
      Map<String, Object> map = hostQnaService.getNoCommentsHostQnaListForAdmin(loginUser.getUserLevel(), hostQnaCategory, currentPage, ROW_PER_PAGE);
   
      Map<String, Object> noCommentedHostQnaMap = hostQnaService.getNoCommentsHostQnaListForHost(loginUser.getUserLevel(), loginUser.getAdmin().getAdminNo(), null, 1, 10);
      
      
      Admin admin =  adminService.getAdminOne(loginUser.getAdmin().getAdminNo()); 
      
      model.addAttribute(admin);
      model.addAttribute("hostQnaList", map.get("hostQnaList"));   
      model.addAttribute("hostQnaListTotalCount", noCommentedHostQnaMap.get("totalCount"));
      // QnA 목록 정보
      return "admin/adminPage";
   }
   
   //[윤경환] 관리자 상세 조회
   @GetMapping("/admin/adminOne")
   public String getAdminOne(int adminNo, Model model) {
      log.debug("adminID+++++++++++++"+adminNo);
      
      Admin admin =  adminService.getAdminOne(adminNo); 
      log.debug("admin+++++++++++++"+admin);
      
      model.addAttribute(admin);
      
      return "admin/adminOne";   
   }
   //[윤경환] 관리자 수정 전
   @GetMapping("/admin/modifyAdminOne")
   public String getmodifyAdminOne(int adminNo, Model model) {
      log.debug("adminID+++++++++++++"+adminNo);
      
      log.debug("adminNo>---------------"+adminNo); 
      Admin admin = adminService.getSelectAdminName(adminNo); 
   
      model.addAttribute(admin);
      
      return "admin/modifyAdminOne";
      
   }
   @PostMapping("/admin/modifyAdminOne")
   public String postmodifyAdminOne(String adminId, String adminPw, Model model) {
      log.debug("admin<-----"+adminId);
      log.debug("admin<-----"+adminPw);
      
   
   
      Admin admin = adminService.getModifyAdmin(adminId,adminPw);
         
      model.addAttribute(admin);
   
      return "admin/modifyAdminForm";
      
   }
   //[윤경환] 관리자 수정 후
   @PostMapping("/admin/modifyAdminForm")
   public String postmodifyAdminForm(Admin admin) {
      log.debug("admin<---------"+admin);
      
      
      adminService.getModifyAdminForm(admin);
      log.debug("admin.getAdminName()+++++++++++"+admin.getAdminName());
      log.debug("admin.getAdminNo()+++++++++++"+admin.getAdminNo());
      return "redirect:/admin/adminPage?adminNo="+admin.getAdminNo();
      
   }
   //[윤경환] 관리자 리스트
   @GetMapping("/admin/adminList")
   public String getAdminList(HttpServletRequest request, Model model,
         @RequestParam(defaultValue = "1") int currentPage,
         @RequestParam(defaultValue = "전체 관리자") String adminPosition) {
      
      log.debug("currntPage++++++++++"+currentPage);
      
      int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
      
      Map<String, Object> map = adminService.getAdminList(adminPosition, currentPage, ROW_PER_PAGE);
      

      // 로그인 세션 조회
      HttpSession session = request.getSession();
      User loginUser = (User) session.getAttribute("loginUser");
      // 로그인 세션 디버깅
      if(loginUser != null) {
         log.debug(" ├[param] loginUser : "+loginUser.toString());
      } else {
         log.debug(" ├[param] loginUser : Null");
      }
      
      
      /* 모델 추가 */
      model.addAttribute("loginUser", loginUser);   // 로그인 세선 정보
      model.addAttribute("beginRow", beginRow);
      model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
      model.addAttribute("adminPosition", adminPosition);   // 선택된 Admin 포지션
      model.addAttribute("adminList", map.get("adminList"));   // admin 리스트 
      model.addAttribute("lastPage", map.get("lastPage"));   // 마지막 페이지(페이징용)
      model.addAttribute("currentPage", currentPage);   // 현재 페이지
      
      //   10개의 page 번호를 출력하기 위한 변수
      int pageNo = ((beginRow / 100) * 10 + 1);
      log.debug(" ├[param] pageNo : " + "pageNo");
      model.addAttribute("pageNo", pageNo);
      
      
      
      return "admin/adminList";
      
   }
   //[윤경환] 총관리자가 다른 관리자 수정 
   @GetMapping("/admin/modifyAdminList")
   public String getmodifyAdminList(int adminNo, Model model) {
      log.debug("adminNo++++++"+adminNo);
      Admin admin = adminService.getSelectAdminName(adminNo);
      
      log.debug("admin+++++++++++"+admin);
      model.addAttribute(admin);
      
      return "admin/modifyAdminList";
   }
   @PostMapping("/admin/modifyAdminList")
   public String postmodifyAdminList(Admin admin) {
      log.debug("admin++++++++++"+admin);
      
      adminService.getmodifyAdminList(admin);
      
      return "redirect:/admin/adminList?currentPage="+1;
      
   }
   
   //[윤경환] 관리자 등록 시 ID 중복 체크 
      @GetMapping("/checkAdminId")
      @ResponseBody
      public int checkAdminId(String adminId) {
         int checkResult = adminService.checkAdminId(adminId);
         
         log.debug("중복값 검사 결과 : " + checkResult);
         return checkResult;
      }
   
      //[윤경환] 멤버 리스트 구현
      @GetMapping("/admin/memberList")
      public String getMemberList(HttpServletRequest request, Model model,
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "0") int memberActive) {
         
         log.debug("currntPage++++++++++"+currentPage);
         
         int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
         
         Map<String, Object> map = adminService.getMemberList(memberActive, currentPage, ROW_PER_PAGE);
         

         // 로그인 세션 조회
         HttpSession session = request.getSession();
         User loginUser = (User) session.getAttribute("loginUser");
         // 로그인 세션 디버깅
         if(loginUser != null) {
            log.debug(" ├[param] loginUser : "+loginUser.toString());
         } else {
            log.debug(" ├[param] loginUser : Null");
         }
         

         /* 모델 추가 */
         model.addAttribute("loginUser", loginUser);   // 로그인 세선 정보
         model.addAttribute("beginRow", beginRow);
         model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
         model.addAttribute("memberActive", memberActive);   // 선택된 Admin 포지션
         model.addAttribute("memberList", map.get("memberList"));   // admin 리스트 
         model.addAttribute("lastPage", map.get("lastPage"));   // 마지막 페이지(페이징용)
         model.addAttribute("currentPage", currentPage);   // 현재 페이지
         
         //   10개의 page 번호를 출력하기 위한 변수
         int pageNo = ((beginRow / 100) * 10 + 1);
         log.debug(" ├[param] pageNo : " + "pageNo");
         
         
         model.addAttribute("pageNo", pageNo);
         return "admin/memberList";
      }
      
      
      //[윤경환] 맴버 활성화 상태 만들기 
      @GetMapping("/admin/modifyMemberAc")
      public String postModifyMemberAc(int memberNo) {
         adminService.getModifyMemberAc(memberNo);
         return "redirect:memberList?memberActive="+0;
         
      }
      //[윤경환] 관리자 활성화 상태만드릭 
      @GetMapping("/admin/modifyHostAc")
      public String postModifyHostAc(int hostNo) {
         adminService.getModifyHostAc(hostNo);
         return "redirect:hostList?memberActive="+0;
         
      }
      
      //[윤경환] 호스트 리스트 
      @GetMapping("/admin/hostList")
      public String getHostList(HttpServletRequest request, Model model,
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "0") int hostActive) {
         
         log.debug("currntPage++++++++++"+currentPage);
         
         int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
         
         Map<String, Object> map = adminService.getHostList(hostActive, currentPage, ROW_PER_PAGE);
         

         // 로그인 세션 조회
         HttpSession session = request.getSession();
         User loginUser = (User) session.getAttribute("loginUser");
         // 로그인 세션 디버깅
         if(loginUser != null) {
            log.debug(" ├[param] loginUser : "+loginUser.toString());
         } else {
            log.debug(" ├[param] loginUser : Null");
         }
         

         /* 모델 추가 */
         model.addAttribute("loginUser", loginUser);   // 로그인 세선 정보
         model.addAttribute("beginRow", beginRow);
         model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
         model.addAttribute("hostActive", hostActive);   // 선택된 host 포지션
         model.addAttribute("hostList", map.get("hostList"));   // host 리스트 
         model.addAttribute("lastPage", map.get("lastPage"));   // 마지막 페이지(페이징용)
         model.addAttribute("currentPage", currentPage);   // 현재 페이지
         
         //   10개의 page 번호를 출력하기 위한 변수
         int pageNo = ((beginRow / 100) * 10 + 1);
         log.debug(" ├[param] pageNo : " + "pageNo");
         
         
         model.addAttribute("pageNo", pageNo);
         return "/admin/hostList";
      }
      
      
      //[윤경환] 정산 차트 
      @GetMapping("/admin/incomeChart")
      public  String getIncomeChart() {
         
         return "/admin/incomeChart";
         
      }
      
      //[윤경환] 년도에 따라 회원가입한 인원수 
      @GetMapping("/admin/totalMemberYear")
      public String getTotalMemberYear() {
    	  return "/admin/totalMemberYear";
      }
      
      //[윤경환] 년도에 따라 회원강비한 회원수
      @GetMapping("/admin/totalHostYear")
      public String getTotalHostYear() {
    	  return "/admin/totalHostYear";
      }
      
      //[운경환] 년도에 따른 숙박업속 종류수 
      @GetMapping("/admin/totalAccomYear")
      public String getTotalAccomYear() {
		return "/admin/totalAccomYear";
    	  
      }
}