package com.b2.Sinnanda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	@GetMapping("index")
	public String index() {
		return "index";
	}
	
	@GetMapping("termsOfUse")
	public String getTermsOfUse() {
		return "termsOfUse";
	}
	
	@GetMapping("privacyPolicy")
	public String getPrivacyPolicy() {
		return "privacyPolicy";
	}
}
