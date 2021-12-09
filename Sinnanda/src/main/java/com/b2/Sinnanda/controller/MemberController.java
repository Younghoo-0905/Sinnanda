package com.b2.Sinnanda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.MemberService;
import com.b2.Sinnanda.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	// 회원 정보 수정
	@GetMapping("/modifyMember")
	public String modifyMember(Model model, Member member) {
		log.debug("MemberController : memberNo -> " + member.getMemberNo());
		model.addAttribute("memberNo", member.getMemberNo());
		return "modifyMember";
	}
	@PostMapping("/modifyMember")
	public String modifyMember(Member member) {
		log.debug("MemberController : modifyMember -> " + member.toString());
		memberService.modifyMember(member);
		log.debug("MemberController : 수정 성공!");
		return "redirect:/memberList";
	}
}
