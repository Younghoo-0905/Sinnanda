package com.b2.Sinnanda.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.QnaService;
import com.b2.Sinnanda.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	private final int ROW_PER_PAGE = 10;
	
	// [이승준] QnA 상세 조회
	@GetMapping("/qnaOne")
	public String qnaOne(Model model, int qnaNo) {
		log.debug("[Debug] \"START\" QnaController.qnaOne()");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		
		Qna qna = qnaService.getQnaOne(qnaNo);
		model.addAttribute(qna);
		
		return "qnaOne";
	}
	
	// [이승준] QnA 목록 조회
	@GetMapping("/qnaList")
	public String qnaList(Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String qnaCategory) {
		log.debug("[Debug] \"START\" QnaController.qnaList()");
		log.debug(" ├[param] currentPage : "+currentPage);
		
		Map<String, Object> map = qnaService.getQnaListByQnaCategory(qnaCategory, currentPage, ROW_PER_PAGE);
		
		model.addAttribute("qnaCategory", map.get("qnaCategory"));
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		return "qnaList";
	}
}
