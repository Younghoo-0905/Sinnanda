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

	//	[김영후]	notice 목록 페이징용 상수
	private final int ROW_PER_PAGE = 10;	

	//	[김영후]	notice 삭제
	@GetMapping("/admin/removeNotice")
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
	@GetMapping("/admin/modifyNotice")
	public String modifyNotice(Model model, int noticeNo) {
		log.debug("[Debug] \"START\" NoticeController.modifyNotice() | Get");
		log.debug(" ├[param] noticeNo : " + noticeNo);
		
		// 수정 전 기존 값 출력
		Notice Notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute(Notice);
		
		return "modifyNotice";
	}
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		log.debug("[Debug] \"START\" NoticeController.modifyNotice() | Post");
		log.debug(" ├[param] Notice : "+ notice.toString());
		
		noticeService.modifyNotice(notice);
		
		return "redirect:/noticeOne?noticeNo="+notice.getNoticeNo();
	}
	
	//	[김영후]	notice 추가
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		log.debug("[Debug] \"START\" noticeController.addNotice() | Get");
		
		return "addNotice";
	}
	@PostMapping("/admin/addNotice")
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
	
	//	[김영후]	notice 목록 조회
	@GetMapping("/noticeList")
	public String noticeList(Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String noticeCategory) {
		log.debug("[Debug] \"START\" noticeController.noticeList() | Get");
		log.debug(" ├[param] currentPage : "+currentPage);
				
		//	출력을 시작하는 행 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1); 

		//	목록 출력
		Map<String, Object> map = noticeService.getNoticeListByCategory(noticeCategory, beginRow, ROW_PER_PAGE);

		//	값 디버깅
		log.debug(" ├[param] beginRow : " + beginRow);
		log.debug(" ├[param] noticeCategory : " + noticeCategory);
		log.debug(" ├[param] currentPage : " + currentPage);
		//	log.debug(" ├ noticeList : " + map.get("noticeList"));
		log.debug(" ├[param] lastPage : " + map.get("lastPage"));
		
		//	값 전달
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("noticeCategory", noticeCategory);
		model.addAttribute("noticePinList", map.get("noticePinList"));
		model.addAttribute("noticeList", map.get("noticeList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		//	10개의 page 번호를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		log.debug(" ├[param] pageNo : " + "pageNo");
		model.addAttribute("pageNo", pageNo);
		
		return "noticeList";
	}
}
