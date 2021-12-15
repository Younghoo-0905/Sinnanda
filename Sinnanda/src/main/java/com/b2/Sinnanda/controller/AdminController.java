package com.b2.Sinnanda.controller;

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
	//[윤경환] 관리자 회원가입
	@GetMapping("/insertAdminForm")
	public String getInsertAdmin() {
		
		return "insertAdminForm";
	}
	@PostMapping("insertAdminForm")
	public String postInsertAdmin(Admin admin) {
		log.debug("admin<-----"+admin);
		adminService.addAdmin(admin);
		
		return "adminLoginForm";
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
		return "adminPage";
		
	}
	@GetMapping("/adminList")
	public String getAdminList() {
		return "adminList";
		
	}
	
	
}
