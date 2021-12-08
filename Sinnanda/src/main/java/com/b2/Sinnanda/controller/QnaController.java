package com.b2.Sinnanda.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	private final int ROW_PER_PAGE = 10;
	
	// [이승준] QnA 목록 조회
	@GetMapping("/qnaList")
	public String qnaList(Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {
		log.debug("[Debug] \"START\" QnaController.qnaList()");
		log.debug(" ├[param] currentPage : "+currentPage);
		
		Map<String, Object> map = qnaService.getQnaList(currentPage, ROW_PER_PAGE);
		
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		return "qnaList";
	}
}
