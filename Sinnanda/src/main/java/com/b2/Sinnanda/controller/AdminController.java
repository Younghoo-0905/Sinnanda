package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.AdminService;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	@Autowired AdminService adminService;
	
	
	// [윤경환] Admin 목록 페이징용 상수
		private final int ROW_PER_PAGE = 10;
	
	//[윤경환] 관리자 회원가입
	@GetMapping("/insertAdminForm")
	public String getInsertAdmin() {
		
		return "insertAdminForm";
	}
	@PostMapping("insertAdminForm")
	public String postInsertAdmin(Admin admin) {
		log.debug("admin<-----"+admin);
		adminService.addAdmin(admin);
		
		return "redirect:/adminList?currentPage="+1;
	}
	
	//[윤경환] 관리자 페이지
	@GetMapping("/adminPage")
	public String getAdminPage(int adminNo, Model model) {
		log.debug("adminNo>---------------"+adminNo); 
		Admin admin =  adminService.getAdminOne(adminNo); 
		
		model.addAttribute(admin);
		
		return "adminPage";
	}
	
	//[윤경환] 관리자 상세 조회
	@GetMapping("/adminOne")
	public String getAdminOne(int adminNo, Model model) {
		log.debug("adminID+++++++++++++"+adminNo);
		
		Admin admin =  adminService.getAdminOne(adminNo); 
		log.debug("admin+++++++++++++"+admin);
		
		model.addAttribute(admin);
		
		return "adminOne";	
	}
	//[윤경환] 관리자 수정 전
	@GetMapping("/modifyAdminOne")
	public String getmodifyAdminOne(int adminNo, Model model) {
		log.debug("adminID+++++++++++++"+adminNo);
		
		log.debug("adminNo>---------------"+adminNo); 
		Admin admin = adminService.getSelectAdminName(adminNo); 
	
		model.addAttribute(admin);
		
		return "modifyAdminOne";
		
	}
	@PostMapping("/modifyAdminOne")
	public String postmodifyAdminOne(String adminId, String adminPw, Model model) {
		log.debug("admin<-----"+adminId);
		log.debug("admin<-----"+adminPw);
		
	
	
		Admin admin = adminService.getModifyAdmin(adminId,adminPw);
			
		model.addAttribute(admin);
	
		return "modifyAdminForm";
		
	}
	//[윤경환] 관리자 수정 후
	@PostMapping("/modifyAdminForm")
	public String postmodifyAdminForm(Admin admin) {
		log.debug("admin<---------"+admin);
		
		
		adminService.getModifyAdminForm(admin);
		log.debug("admin.getAdminName()+++++++++++"+admin.getAdminName());
		log.debug("admin.getAdminNo()+++++++++++"+admin.getAdminNo());
		return "redirect:/adminPage?adminNo="+admin.getAdminNo();
		
	}
	//[윤경환] 관리자 리스트
	@GetMapping("/adminList")
	public String getAdminList(HttpServletRequest request, Model model,
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(required = false) String adminPosition) {
		
		log.debug("currntPage++++++++++"+currentPage);
		
		
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
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute("adminPosition", map.get("adminPosition"));	// 선택된 QnA 카테고리
		model.addAttribute("adminList", map.get("adminList"));	// QnA 목록 정보
		model.addAttribute("lastPage", map.get("lastPage"));	// 마지막 페이지(페이징용)
		model.addAttribute("currentPage", currentPage);	// 현재 페이지
		
		
		return "adminList";
		
	}
	//[윤경환] 총관리자가 다른 관리자 수정 
	@GetMapping("/modifyAdminList")
	public String getmodifyAdminList(int adminNo, Model model) {
		log.debug("adminNo++++++"+adminNo);
		Admin admin = adminService.getSelectAdminName(adminNo);
		
		log.debug("admin+++++++++++"+admin);
		model.addAttribute(admin);
		
		return "modifyAdminList";
	}
	@PostMapping("/modifyAdminList")
	public String postmodifyAdminList(Admin admin) {
		log.debug("admin++++++++++"+admin);
		
		
		return "adminList";
		
	}
	
	
}
