package com.b2.Sinnanda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.SearchAccomService;
import com.b2.Sinnanda.vo.Accom;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccomController {
	@Autowired SearchAccomService searchAccomService;
	
	//[이원희]검색 후 리스트 이동 21.12.10
	@GetMapping("searchList")
	public String getSerchList() {
		return"searchList";
	}
	
	@PostMapping("searchList")
	public String postSerchList(Accom accom, Model model) {
		Accom getAccom = new Accom();
		log.debug(accom+"<-------------searchList - searchValue");
		getAccom = searchAccomService.getAccomList(accom);
		log.debug(getAccom+"<-------------searchList - getAccom");
		model.addAttribute("getAccom", getAccom);
		return"searchList";
	}
}
