package com.b2.Sinnanda.controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@GetMapping("myPage")
	public String myPage(Model model, HttpServletRequest request) {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		log.debug("멤버 넘버 : "+ memberNo);
		// Member member = memberService.myPage(memberNo);
		return "myPage";
	}
	
	
	// [유동진] 회원 정보 수정
	@GetMapping("/modifyMember")
	public String modifyMember(HttpSession session, Model model) {
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
	
	//	[김영후] 회원 가입 시 실시간 ID 중복체크
	@PostMapping("/chkId")
	public int chkId(String memberId) {
		int checkResult = memberService.checkId(memberId);
		return checkResult;
	}
}
