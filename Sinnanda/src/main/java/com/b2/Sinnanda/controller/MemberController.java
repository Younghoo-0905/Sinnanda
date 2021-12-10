package com.b2.Sinnanda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.b2.Sinnanda.service.CertifyEmailService;
import com.b2.Sinnanda.service.MemberService;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	@Autowired MemberService memberService;
	@Autowired CertifyEmailService certifyEmailService;
	
	// [유동진] 마이페이지
	

	
	// [유동진] 회원 정보 수정
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
		return "redirect:/myPage";
	}
	
	//	[김영후] 회원 가입
	@GetMapping("/insertMember")
	public String getInsertMember() {
		return "insertMemberForm";
	}
	@PostMapping("/insertMember")
	public String postInsertMember(Member member) {
		
		memberService.addMember(member);
		
		certifyEmailService.sendMail(member);
		
		return "redirect:/login";
	}
	
	//	[김영후]	회원 이메일 인증
	@PostMapping("/certifyMember")
	public String certifyMember(Member member) {
		int result = memberService.certifyMember(member);
		if(result == 1) {
			memberService.certifyMemberUpdate(member);
			return "index";
		} else {
			return "redirect:/login";
		}
	}
	
	//	[김영후] 회원 탈퇴
	@GetMapping("/insertMemberOut")
	public String getInsertMemberOut() {
		return "memberOutForm";
	}	
	@PostMapping("/insertMemberOut")
	public String postInsertMemberOut(Member member, MemberOut memberOut) {
		
		//	트랜잭션 처리 -> member 테이블 데이터 삭제 후 memberOut 테이블 데이터 삽입
		memberService.removeMember(member, memberOut);
		
		return "redirect:/index";
	}
}
