package com.b2.Sinnanda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.b2.Sinnanda.service.HostQnaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HostController {
	@Autowired
	private HostQnaService hostService;
	
	@GetMapping("/host/myPage")
	public String myPage() {
		log.debug("[Debug] \"START\" hostService.myPage() | Get");
		
		return "host/myPage";
	}
}
