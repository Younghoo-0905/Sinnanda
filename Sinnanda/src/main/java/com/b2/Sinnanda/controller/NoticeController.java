package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.NoticeService;
import com.b2.Sinnanda.vo.Notice;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;

	//	[김영후]	notice 삭제
	@GetMapping("/removeNotice")
	public String removeNotice(HttpServletRequest request, int noticeNo) {
		log.debug("[Debug] \"START\" NoticeController.removeNotice() | Get");
		log.debug(" ├[param] noticeNo : " + noticeNo);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		log.debug(" ├[param] loginUser : " + loginUser.toString());
		
		// 수정 전 기존 값 출력
		noticeService.removeNotice(noticeNo, loginUser.getAdmin().getAdminNo());
		
		return "redirect:/noticeList";
	}

	//	[김영후]	notice 수정
	@GetMapping("/modifyNotice")
	public String modifyNotice(Model model, int noticeNo) {
		log.debug("[Debug] \"START\" NoticeController.modifyNotice() | Get");
		log.debug(" ├[param] noticeNo : " + noticeNo);
		
		// 수정 전 기존 값 출력
		Notice Notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute(Notice);
		
		return "modifyNotice";
	}
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice) {
		log.debug("[Debug] \"START\" NoticeController.modifyNotice() | Post");
		log.debug(" ├[param] Notice : "+ notice.toString());
		
		noticeService.modifyNotice(notice);
		
		return "redirect:/noticeOne?noticeNo="+notice.getNoticeNo();
	}
	
	//	[김영후]	notice 추가
	@GetMapping("/addNotice")
	public String addNotice() {
		log.debug("[Debug] \"START\" noticeController.addNotice() | Get");
		
		return "addNotice";
	}
	@PostMapping("/addNotice")
	public String addNotice(Notice notice, HttpServletRequest req) {
		log.debug("[Debug] \"START\" noticeController.addNotice() | Post");
		log.debug(" ├[param] notice : " + notice.toString());
		HttpSession session = req.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		//	공지를 등록하는 관리자 세션 디버깅
		log.debug("" + loginUser);
		
		noticeService.addNotice(notice);
		
		return "redirect:/noticeOne?noticeNo=" + notice.getNoticeNo();
	}
	
	//	[김영후]	notice 상세 조회
	@GetMapping("/noticeOne")
	public String noticeOne(Model model, int noticeNo) {
		log.debug("[Debug] \"START\" NoticeController.noticeOne() | Get");
		log.debug(" ├[param] noticeNo : " + noticeNo);
		
		Notice notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute(notice);
		
		return "noticeOne";
	}
	
	//	[김영후]	notice 목록 페이징용 상수
	private final int ROW_PER_PAGE = 10;	
	//	[김영후]	notice 목록 조회
	@GetMapping("/noticeList")
	public String noticeList(Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String noticeCategory) {
		log.debug("[Debug] \"START\" noticeController.noticeList() | Get");
		log.debug(" ├[param] currentPage : "+currentPage);
		
		Map<String, Object> map = noticeService.getNoticeListByCategory(noticeCategory, currentPage, ROW_PER_PAGE);
		
		model.addAttribute("noticeCategory", map.get("noticeCategory"));
		model.addAttribute("noticeList", map.get("noticeList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		return "noticeList";
	}
}
