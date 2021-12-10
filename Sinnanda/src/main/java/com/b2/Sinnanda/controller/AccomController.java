package com.b2.Sinnanda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccomController {
	//[이원희]검색 후 리스트 이동 21.12.10
	@GetMapping("searchList")
	public String serchList() {
		return"searchList";
	}
}
