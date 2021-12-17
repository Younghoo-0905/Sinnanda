package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.b2.Sinnanda.service.CertifyEmailService;
import com.b2.Sinnanda.service.MemberService;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	@Autowired MemberService memberService;
	@Autowired CertifyEmailService certifyEmailService;
	
	// [유동진] 마이페이지
	@GetMapping("myPage")
	public String myPage(Model model, int memberNo) {
      // memberNo을 이용해서 member의 데이터들을 조회하고, member 객체에 삽입
      Member member = memberService.myPage(memberNo);
      log.debug("멤버 넘버 : "+ memberNo);
      
      // member 객체의 데이터를 전달
      model.addAttribute(member);
      return "myPage";
	}
		
	// [유동진] 회원 정보 수정(프로필)
	@GetMapping("/modifyMember")
	public String modifyMember(HttpServletRequest request, Model model) {
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		model.addAttribute(loginUser);
		return "modifyMember";
	}
	@PostMapping("/modifyMember")
	public String modifyMember(Member member) {
		log.debug("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥MemberController : modifyMember -> " + member.toString());
		memberService.modifyMember(member);
		log.debug("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥MemberController : 회원정보수정 성공!");
		return "redirect:/myPage?memberNo="+member.getMemberNo();
	}
	
	// [유동진] 비밀번호 변경
	@GetMapping("/checkMemberPw")
	public String checkMemberPw(HttpServletRequest request, Model model) {
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		model.addAttribute(loginUser);
		return "checkMemberPw";
	}
	@PostMapping("/checkMemberPw")
	public String postcheckMemberPw(String memberPw) {
		log.debug("memberPw ->->->->->->-> " + memberPw);
		
		memberService.getCheckMemberPw(memberPw);

		return "modifyMemberPw";		
	}
	@PostMapping("/modifyMemberPw")
	public String modifyMemberPw(HttpSession session, Member member) {

		memberService.modifyMemberPw(member);
		session.invalidate();
		log.debug("★★★★★★★★★★★★★ 회원비밀번호 변경 성공!!! 다시 로그인 해주세요!!!!");
		return "redirect:/index";
	}
	
	// [유동진] QnA 목록 페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
	// [유동진] 내가 작성한 QnA 목록 조회
	@GetMapping("/myQnaList")
	public String myQnaList(HttpServletRequest request, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(required = false) String qnaCategory) {
		log.debug("[Debug] \"START\" MemberController.myQnaList() | Get");
		log.debug(" ├[param] currentPage : "+currentPage);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
			return "redirect:/index";
		}

		// QnA 목록 조회
		Map<String, Object> map = memberService.getMyQnaListByQnaCategory(loginUser.getMember().getMemberNo(), qnaCategory, currentPage, ROW_PER_PAGE);
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute("qnaCategory", map.get("qnaCategory"));	// 선택된 QnA 카테고리
		model.addAttribute("myQnaList", map.get("myQnaList"));	// QnA 목록 정보
		model.addAttribute("lastPage", map.get("lastPage"));	// 마지막 페이지(페이징용)
		model.addAttribute("currentPage", currentPage);	// 현재 페이지
		
		return "myQnaList";
	}

	//	[김영후] 회원 가입
	@GetMapping("/insertMember")
	public String getInsertMember() {
		return "insertMemberForm";
	}
	@PostMapping("/insertMember")
	public String postInsertMember(Member member) {
		log.debug("입력된 회원 정보 :" + member.toString());
		//	회원정보 입력
		memberService.addMember(member);
		//	입력된 이메일로 인증코드 발송
		certifyEmailService.sendMail(member);
		
		return "redirect:/login";
	}
	
	//	[김영후]	회원 이메일 인증
	@PostMapping("/certifyMember")
	public String certifyMember(Member member) {
		int result = memberService.certifyMember(member);
		log.debug("├[Debug] 이메일 인증 result : " + result);
		if(result == 1) {	//	인증 완료 후, Member 정보 update
			memberService.certifyMemberUpdate(member);
			return "index";
		} else {	//	인증 실패시 다시 인증 화면
			return "certifyEmailForm";
		}
	}
	
	//	[김영후] 회원 탈퇴
	@GetMapping("/insertMemberOut")
	public String getInsertMemberOut() {
		return "memberOutForm";
	}	
	@PostMapping("/insertMemberOut")
	public String postInsertMemberOut(Member member, MemberOut memberOut) {
		log.debug("탈퇴할 멤버 정보 :" + member);		
		//	트랜잭션 처리 -> member 테이블 데이터 삭제 후 memberOut 테이블 데이터 삽입
		memberService.removeMember(member, memberOut);
		
		return "redirect:/index";
	}
	
	//	[김영후] 회원 가입 시 실시간 ID 중복체크
	@GetMapping("/chkId")
	@ResponseBody
	public int checkId(String memberId) {
		//	DB에 저장된 중복값 유무 결과를 반환
		int checkResult = memberService.checkId(memberId);
		log.debug("중복값 검사 결과 : " + checkResult);
		return checkResult;
	}
}
