package com.b2.Sinnanda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.AdminService;
import com.b2.Sinnanda.vo.Admin;

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
		
		return "index";
	}
}
