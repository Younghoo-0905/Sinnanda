package com.b2.Sinnanda.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.NoticeService;
import com.b2.Sinnanda.vo.Notice;
import com.b2.Sinnanda.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	//	[김영후]	notice 추가
	@GetMapping("/addNotice")
	public String addNotice() {
		log.debug("[Debug] \"START\" noticeController.addNotice() | Get");
		return "addNotice";
	}
	@PostMapping("/addNotice")
	public String addNotice(Notice notice) {
		log.debug("[Debug] \"START\" noticeController.addNotice() | Post");
		log.debug(" ├[param] notice : " + notice.toString());
		
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
	
	//	[김영후]	QnA 목록 페이징용 상수
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
