package com.b2.Sinnanda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String getAdminPage() {
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
	//[윤경환] 관리자 수정 폼
	@GetMapping("/modifyAdminOne")
	public String getmodifyAdminOne(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		log.debug("loginUser456456456"+loginUser.toString());
	
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
}
