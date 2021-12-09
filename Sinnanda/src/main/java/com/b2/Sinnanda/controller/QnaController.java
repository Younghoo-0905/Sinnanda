package com.b2.Sinnanda.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.QnaService;
import com.b2.Sinnanda.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	// [이승준] QnA 목록 페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
	// [이승준] QnA 삭제
	@GetMapping("/removeQna")
	public String removeQna(int qnaNo, int memberNo) {
		log.debug("[Debug] \"START\" QnaController.removeQna() | Get");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		log.debug(" ├[param] memberNo : "+memberNo);
		
		// 수정 전 기존 값 출력
		qnaService.removeQna(qnaNo, memberNo);
		
		return "redirect:/qnaList";
	}
	
	// [이승준] QnA 수정
	@GetMapping("/modifyQna")
	public String modifyQna(Model model, int qnaNo) {
		log.debug("[Debug] \"START\" QnaController.modifyQna() | Get");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		
		// 수정 전 기존 값 출력
		Qna qna = qnaService.getQnaOne(qnaNo);
		model.addAttribute(qna);
		
		return "modifyQna";
	}
	@PostMapping("/modifyQna")
	public String modifyQna(Qna qna) {
		log.debug("[Debug] \"START\" QnaController.modifyQna() | Post");
		log.debug(" ├[param] qna : "+qna.toString());
		
		qnaService.modifyQna(qna);
		
		return "redirect:/qnaOne?qnaNo="+qna.getQnaNo();
	}
	
	// [이승준] QnA 삽입
	@GetMapping("/addQna")
	public String addQna() {
		log.debug("[Debug] \"START\" QnaController.addQna() | Get");
		return "addQna";
	}
	@PostMapping("/addQna")
	public String addQna(Qna qna) {
		log.debug("[Debug] \"START\" QnaController.addQna() | Post");
		log.debug(" ├[param] qna : "+qna.toString());
		
		qnaService.addQna(qna);
		
		return "redirect:/qnaOne?qnaNo="+qna.getQnaNo();
	}
	
	// [이승준] QnA 상세 조회
	@GetMapping("/qnaOne")
	public String qnaOne(Model model, int qnaNo) {
		log.debug("[Debug] \"START\" QnaController.qnaOne() | Get");
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
		log.debug("[Debug] \"START\" QnaController.qnaList() | Get");
		log.debug(" ├[param] currentPage : "+currentPage);
		
		Map<String, Object> map = qnaService.getQnaListByQnaCategory(qnaCategory, currentPage, ROW_PER_PAGE);
		
		model.addAttribute("qnaCategory", map.get("qnaCategory"));
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		return "qnaList";
	}
}
