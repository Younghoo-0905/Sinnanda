package com.b2.Sinnanda.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.service.SearchAccomService;
import com.b2.Sinnanda.vo.Accom;
import com.b2.Sinnanda.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccomController {
	@Autowired SearchAccomService searchAccomService;
	
	// [이원희] 숙소 목록 페이징
	private final int ROW_PER_PAGE = 12;
	
	//[이원희]검색 후 리스트 이동 21.12.10
	@GetMapping("searchList")
	public String getSerchList(Accom accom, Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {
		
		Map<String, Object> map = searchAccomService.getAccomListByName(accom, currentPage, ROW_PER_PAGE);
		
		log.debug(map.get("accomName")+"<----------------------- AccomController - accomName");
		log.debug(map.get("accomList")+"<----------------------- AccomController - accomList");
		log.debug(map.get("accomRankList")+"<----------------------- AccomController - accomRankList");
		log.debug(map.get("lastPage")+"<----------------------- AccomController - lastPage");
		log.debug(map.get("currentPage")+"<----------------------- AccomController - currentPage");
		
		model.addAttribute("accomName",accom.getAccomName());
		model.addAttribute("accomList", map.get("accomList"));
		model.addAttribute("accomRankList",map.get("accomRankList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
			
		return"searchList";
	}
	
	@PostMapping("searchList")
	public String postSerchList(Accom accom, Model model, 
			@RequestParam(defaultValue = "1") int currentPage) {
		
		Map<String, Object> map = searchAccomService.getAccomListByName(accom, currentPage, ROW_PER_PAGE);
		
		log.debug(map.get("accomName")+"<----------------------- AccomController - accomName");
		log.debug(map.get("accomList")+"<----------------------- AccomController - accomList");
		log.debug(map.get("accomRankList")+"<----------------------- AccomController - accomRankList");
		log.debug(map.get("lastPage")+"<----------------------- AccomController - lastPage");
		log.debug(map.get("currentPage")+"<----------------------- AccomController - currentPage");
		
		model.addAttribute("accomName",accom.getAccomName());
		model.addAttribute("accomList", map.get("accomList"));
		model.addAttribute("accomRankList",map.get("accomRankList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		return"searchList";
	}
	
	@GetMapping("searchOne")
	public String getSearchOne(int accomNo, Model model) {
		log.debug(accomNo+"<------------------get값");
		
		Map<String, Object> map = searchAccomService.getAccomOne(accomNo);
		model.addAttribute("accom",map.get("accom"));
		model.addAttribute("roomList", map.get("roomList"));
		
		return "searchOne";
	}
}
