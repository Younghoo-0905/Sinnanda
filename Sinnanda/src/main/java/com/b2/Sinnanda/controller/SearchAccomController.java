package com.b2.Sinnanda.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.SearchAccomService;
import com.b2.Sinnanda.vo.Accom;
import com.b2.Sinnanda.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchAccomController {
	@Autowired SearchAccomService searchAccomService;
	@Autowired DL dl; //[이원희]디버깅용
	// [이원희] 숙소 목록 페이징
	private final int ROW_PER_PAGE = 12;
	
	//[이원희]검색 후 리스트 이동 21.12.10
//	@GetMapping("/searchAccomList")
//	public String getSerchList(Accom accom, Model model, 
//			@RequestParam(defaultValue = "1") int currentPage,
//			@RequestParam(defaultValue = "1")int person,
//			@RequestParam List<String> accomCategory1
//			) {
//		dl.p("AccomController", "getSerchList(accom)", accom);
//		dl.p("AccomController", "getSerchList(accomCategory1)", accomCategory1);
//		Map<String, Object> map = searchAccomService.getAccomListByName(accom, person, currentPage, ROW_PER_PAGE, accomCategory1);
//	
//		dl.p("AccomController","accomName",map.get("accomName"));
//		dl.p("AccomController","accomList",map.get("accomList"));
//		dl.p("AccomController", "accomCategoryName", map.get("accomCategoryName"));
//		dl.p("AccomController","accomRankList",map.get("accomRankList"));
//		dl.p("AccomController","lastPage",map.get("lastPage"));
//		dl.p("AccomController","currentPage",map.get("currentPage"));
//		
//		model.addAttribute("accomName",accom.getAccomName());
//		model.addAttribute("accomList", map.get("accomList"));
//		model.addAttribute("accomCategoryName",accom.getAccomCategoryName());
//		model.addAttribute("accomRankList",map.get("accomRankList"));
//		model.addAttribute("lastPage", map.get("lastPage"));
//		model.addAttribute("accomCategory1", accomCategory1);
//		model.addAttribute("currentPage", currentPage);
//		
//		return"/searchAccomList";
//	}
	
	@PostMapping("/searchAccomList")
	public String postSerchList(Accom accom, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "1") int person,
			@RequestParam(defaultValue = "호텔")List<String> accomCategory1,
			@RequestParam(defaultValue = "5,4,3,2,1") List<Integer> accomRate) {
		dl.p("AccomController", "getSerchList(accom)", accom);
		
		Map<String, Object> map = searchAccomService.getAccomListByName(accom, person, currentPage, ROW_PER_PAGE, accomCategory1, accomRate);
		dl.p("AccomController","accomName",map.get("accomName"));
		dl.p("AccomController","accomList",map.get("accomList"));
		dl.p("AccomController", "accomCategoryName", map.get("accomCategoryName"));
		dl.p("AccomController","accomRankList",map.get("accomRankList"));
		dl.p("AccomController","lastPage",map.get("lastPage"));
		dl.p("AccomController","currentPage",map.get("currentPage"));
		dl.p("AccomController","accomCategory1",accomCategory1);
		dl.p("AccomController","accomRate",accomRate);
		int beginRow = 0;
		if(currentPage%10 == 0) {
			beginRow = (((currentPage-1)/10)*10)+1; 
		}else {
			beginRow = ((currentPage/10)*10)+1;
		}
		
		dl.p("AccomController","beginRow",beginRow);
		
		model.addAttribute("accomName",accom.getAccomName());
		model.addAttribute("accomCategoryName",accom.getAccomCategoryName());
		model.addAttribute("accomList", map.get("accomList"));
		model.addAttribute("accomRankList",map.get("accomRankList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("accomCategory1", accomCategory1);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginRow",beginRow);
		model.addAttribute("accomRate",accomRate);
		
		return"/searchAccomList";
	}
	
	@RequestMapping("/searchAccomOne") // [이원희] 숙소정보
	public String getSearchOne(int accomNo, Model model) {
		
		dl.p("AccomController", "accomNo", accomNo);
		
		Map<String, Object> map = searchAccomService.getAccomOne(accomNo);
		model.addAttribute("accom",map.get("accom"));
		model.addAttribute("roomList", map.get("roomList"));
		
		return "/searchAccomOne";
	}
	
	@RequestMapping("/searchRoomOne")
	public String getSearchRoomOne(int roomNo, Model model) {
		dl.p("AccomController", "roomNo", roomNo);
		
		Room room = searchAccomService.getRoomOne(roomNo);
		dl.p("AccomController", "room", room);
		model.addAttribute("room",room);
		
		return "/searchRoomOne";
	}
}
