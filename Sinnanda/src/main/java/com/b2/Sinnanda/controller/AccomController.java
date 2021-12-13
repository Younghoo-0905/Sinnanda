package com.b2.Sinnanda.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.SearchAccomService;
import com.b2.Sinnanda.vo.Accom;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccomController {
	@Autowired SearchAccomService searchAccomService;
	
	// [이원희] 숙소 목록 페이징
	private final int ROW_PER_PAGE = 12;
	
	//[이원희]검색 후 리스트 이동 21.12.10
	@GetMapping("searchList")
	public String getSerchList() {
		return"searchList";
	}
	
	@PostMapping("searchList")
	public String postSerchList(Accom accom, Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {
			
		Map<String, Object> map = searchAccomService.getAccomListByName(accom, currentPage, ROW_PER_PAGE);
			
		log.debug(map.get("accomList")+"<----------------------- 맵");
		model.addAttribute("accomList", map.get("accomList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
			
		return"searchList";
	}
}
