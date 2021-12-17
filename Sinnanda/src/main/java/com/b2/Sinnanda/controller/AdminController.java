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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String getAdminPage(int adminNo, Model model) {
		log.debug("adminNo>---------------"+adminNo); 
		Admin admin =  adminService.getAdminOne(adminNo); 
		
		model.addAttribute(admin);
		
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
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("adminPosition", adminPosition);	// 선택된 Admin 포지션
		model.addAttribute("adminList", map.get("adminList"));	// admin 리스트 
		model.addAttribute("lastPage", map.get("lastPage"));	// 마지막 페이지(페이징용)
		model.addAttribute("currentPage", currentPage);	// 현재 페이지
		
		//	10개의 page 번호를 출력하기 위한 변수
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
	
		//[윤경환] 맵버 리스트 구현
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
			model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
			model.addAttribute("beginRow", beginRow);
			model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
			model.addAttribute("memberActive", memberActive);	// 선택된 Admin 포지션
			model.addAttribute("memberList", map.get("memberList"));	// admin 리스트 
			model.addAttribute("lastPage", map.get("lastPage"));	// 마지막 페이지(페이징용)
			model.addAttribute("currentPage", currentPage);	// 현재 페이지
			
			//	10개의 page 번호를 출력하기 위한 변수
			int pageNo = ((beginRow / 100) * 10 + 1);
			log.debug(" ├[param] pageNo : " + "pageNo");
			
			
			model.addAttribute("pageNo", pageNo);
			return "admin/memberList";
		}
		//[윤경환] 관리자 활성화 
		@GetMapping("/admin/modifyMemberAc")
		@ResponseBody
		public int getModifyMemberAc(int memberNo) {
			int modifyMemberAc = adminService.getModifyMemberAc(memberNo);;
			log.debug("modifyMemberAc+++++++++"+modifyMemberAc);
			return modifyMemberAc;
			
		}
	
}
