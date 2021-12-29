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

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.QnaService;
import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.QnaComment;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	@Autowired
	private DL dl;
	
	// 페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
/* 1. 조회 */
	
	// [이승준] "회원문의 목록" 조회
	@GetMapping("/qnaList")
	public String qnaList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String qnaCategory) {
		dl.p("QnaController", "qnaList() | Get", "시작");
		dl.p("qnaList()", "currentPage", currentPage);
		dl.p("qnaList()", "qnaCategory", qnaCategory);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;

		// 3. "회원문의 목록" 조회 서비스 호출
		Map<String, Object> map = qnaService.getQnaList(qnaCategory, beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 페이지번호의를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("complainList()", "pageNo", pageNo);
		
		// 5. 모델 전달
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("qnaCategory", qnaCategory);
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
			
		return "qnaList";
	}
	
	// [이승준] "회원문의 상세" 조회
	@GetMapping("/qnaOne")
	public String getQnaOne(HttpSession session, Model model, int qnaNo) {
		dl.p("QnaController", "getQnaOne() | Get", "시작");
		dl.p("getQnaOne()", "qnaNo", qnaNo);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. "회원문의" 상세 조회 서비스 호출
		Qna qna = qnaService.getQnaOne(qnaNo);
		
		
		// 3. 비밀글인 경우 (접근가능자 : 작성자 본인 or 관리자)
		if(qna.getQnaSecret().equals("비밀문의")) {
			// 3-1. 비회원, 사업자인 경우
			if((loginUser == null) || (loginUser.getUserLevel() == 2)) {
				dl.p("getQnaOne()", "비밀글", "접근불가 | 권한부족");
				return "redirect:/qnaList";
				
			// 3-2. 멤버이지만
			} else if(loginUser.getUserLevel() == 1) {
				dl.p("getQnaOne()", "작성자 memberNo", qna.getMemberNo());
				dl.p("getQnaOne()", "세션 memberNo", loginUser.getMember().getMemberNo());
				
				// 3-2-1. 글 작성자의 '회원번호'와 로그인된 '회원번호'가 일치하지 않는 경우
				if(qna.getMemberNo() != loginUser.getMember().getMemberNo()) {
					dl.p("getQnaOne()", "비밀글", "접근불가 | 작성자가 아님");
					return "redirect:/qnaList";
				}
			}
		}
		
		// 5. 모델 전달
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("qna", qna);
		
		return "qnaOne";
	}
	
	//[윤경환] 관리자가 볼수 있는 답변이 안된 회원 QNA 목록
	@GetMapping("/admin/memberQnaList")
	public String getMemberQnaList(HttpSession session, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String qnaCategory) {
		dl.p("QnaController", "qnaList() | Get", "시작");
		dl.p("qnaList()", "currentPage", currentPage);
		dl.p("qnaList()", "qnaCategory", qnaCategory);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;

		// 3. "회원문의 목록" 조회 서비스 호출
		Map<String, Object> map = qnaService.getAdminQnaList(qnaCategory, beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 페이지번호의를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("complainList()", "pageNo", pageNo);
		
		// 5. 모델 전달
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("qnaCategory", qnaCategory);
		model.addAttribute("adminQnaList", map.get("adminQnaList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		return "admin/memberQnaList";
	}
	//[윤경환] 관리자가 볼수 있는 답변이 안된 회원 QNA
	@GetMapping("/admin/memberQnaOne")
	public String getMemberQnaList(HttpSession session, Model model, int qnaNo) {
		User loginUser = (User)session.getAttribute("loginUser");
		Qna qna = qnaService.getQnaOne(qnaNo);
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("qna", qna);
		
		return "admin/memberQnaOne";
	}
	
	
	
/* 2. 삽입 */
	
	// [이승준] "회원문의" 삽입
	@GetMapping("/member/addQna")
	public String addQna(HttpSession session, Model model) {
		dl.p("QnaController", "getQnaOne() | Get", "시작");
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. 회원이 아닌 경우, "회원문의" 작성불가
		if(loginUser.getUserLevel() != 1) {
			dl.p("addQna()", "회원문의 작성", "접근불가 | 오직 회원만 작성가능");
			return "redirect:/qnaList";
		}
		
		// 3. 모델 전달
		model.addAttribute("loginUser", loginUser);
		
		return "/member/addQna";
	}
	@PostMapping("/member/addQna")
	public String addQna(Qna qna) {
		dl.p("QnaController", "getQnaOne() | Post", "시작");
		dl.p("getQnaOne()", "qna", qna.toString());
		
		// 1. "회원문의" 삽입 서비스 호출
		qnaService.addQna(qna);
		
		return "redirect:/qnaOne?qnaNo="+qna.getQnaNo();
	}
	
	// [이승준] "회원문의 답변" 삽입
	@PostMapping("/addQnaComment")
	public String addQnaComment( QnaComment qnaComment) {
		dl.p("QnaController", "addQnaComment() | Post", "시작");
		dl.p("addQnaComment()", "qnaComment", qnaComment.toString());
		
		// 1. "회원문의 답변" 삽입 서비스 호출
		qnaService.addQnaComment(qnaComment);
		
		return "redirect:/qnaOne?qnaNo="+qnaComment.getQnaNo();
	}
	
	//[윤경환] "관리자가 회원문의" 삽입
	@PostMapping("/admin/addMemberQnaComment")
	public String addMemberQnaComment(QnaComment qnaComment) {
		
		
		dl.p("QnaController", "addQnaComment() | Post", "시작");
		dl.p("addQnaComment()", "qnaComment", qnaComment.toString());
		
		// 1. "회원문의 답변" 삽입 서비스 호출
		qnaService.addQnaComment(qnaComment);
		
		return "redirect:/admin/memberQnaOne?qnaNo="+qnaComment.getQnaNo();
		
	}
	
/* 3. 수정 */
	
	// [이승준] "회원문의" 수정
	@GetMapping("/member/modifyQna")
	public String modifyQna(HttpSession session, Model model, int qnaNo) {
		dl.p("QnaController", "modifyQna() | Get", "시작");
		dl.p("modifyQna()", "qnaNo", qnaNo);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. "회원문의 상세" 조회 서비스 호출
		Qna qna = qnaService.getQnaOne(qnaNo);
		
		// 3. "회원문의"를 작성한 작성자만 수정 가능
		if(loginUser.getUserLevel() != 1 && loginUser.getMember().getMemberNo() == qna.getMemberNo()) {
			return "redirect:/qnaList";
		}
		
		// 4. 모델 전달
		model.addAttribute("qna", qna);
		
		return "/member/modifyQna";
	}
	@PostMapping("/member/modifyQna")
	public String modifyQna(Qna qna) {
		dl.p("QnaController", "modifyQna() | Post", "시작");
		dl.p("modifyQna()", "qna", qna.toString());
		
		// 1. "회원문의" 수정 서비스 호출
		qnaService.modifyQna(qna);
		
		return "redirect:/qnaOne?qnaNo="+qna.getQnaNo();
	}
	
	
	
/* 4. 삭제 */
	
	// [이승준] "회원문의 답변" 삭제
	@GetMapping("/removeQnaComment")
	public String removeQnaComment(int qnaNo) {
		dl.p("QnaController", "removeQnaComment() | Post", "시작");
		dl.p("removeQnaComment()", "qnaNo", qnaNo);
		
		// 2. "회원문의 답변" 삭제 서비스 호출
		qnaService.removeQnaComment(qnaNo);
		
		return "redirect:/qnaOne?qnaNo="+qnaNo;
	}
	
	// [이승준] "회원문의" 삭제
	@GetMapping("/removeQna")
	public String removeQna(int qnaNo) {
		dl.p("QnaController", "removeQna() | Get", "시작");
		dl.p("removeQna()", "qnaNo", qnaNo);
		
		// 2. "회원문의" 삭제 서비스 호출
		qnaService.removeQna(qnaNo);
		
		return "redirect:/qnaList";
	}
	
	
	
}
