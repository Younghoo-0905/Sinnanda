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
	public String qnaList(HttpServletRequest request, Model model, 
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String qnaCategory) {
		log.debug("[Debug] \"START\" QnaController.qnaList() | Get");
		log.debug(" ├[param] currentPage : "+currentPage);
		
		//	출력을 시작하는 행 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;

		// QnA 목록 조회
		Map<String, Object> map = qnaService.getQnaList(qnaCategory, beginRow, ROW_PER_PAGE);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("qnaCategory", qnaCategory);	// 선택된 QnA 카테고리
		model.addAttribute("qnaList", map.get("qnaList"));	// QnA 목록 정보
		model.addAttribute("lastPage", map.get("lastPage"));	// 마지막 페이지(페이징용)
		model.addAttribute("currentPage", currentPage);	// 현재 페이지
		
		//	10개의 page 번호를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		log.debug(" ├[param] pageNo : " + pageNo);
		model.addAttribute("pageNo", pageNo);
			
		return "qnaList";
	}
	
	// [이승준] "회원문의 상세" 조회
	@GetMapping("/qnaOne")
	public String qnaOne(HttpServletRequest request, Model model, int qnaNo) {
		log.debug("[Debug] \"START\" QnaController.qnaOne() | Get");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		
		// QnA 상세 조회
		Qna qna = qnaService.getQnaOne(qnaNo);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		// *비밀문의인 경우, 접근제한 필요(작성자 본인 or 관리자)
		if(qna.getQnaSecret().equals("비밀문의")) {
			// 1. 비회원 or 사업자인 경우 -> qnaList
			if((loginUser == null) || (loginUser.getUserLevel() == 2)) {
				log.info(" ├[info] qnaOne 접근 불가 : 비회원 or 사업자");
				return "redirect:/qnaList";
			}
			log.debug(" ├[param] 작성자 memberNo : "+qna.getMemberNo());
			log.debug(" ├[param] 접근자 Level : "+loginUser.getUserLevel());
			
			// 2. 멤버인 경우, 작성자 No + 세션 No = 일치 X -> qnaList
			if(loginUser.getUserLevel() == 1) {
				log.debug(" ├[param] 세션 memberNo : "+loginUser.getMember().getMemberNo());
				if(qna.getMemberNo() != loginUser.getMember().getMemberNo()) {
					return "redirect:/qnaList";
				}
			}
			log.info(" ├[info] qnaOne 접근 허용");
		}
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute(qna);	// 선택된 QnA 상세 정보
		
		return "qnaOne";
	}
	
	
	
/* 2. 삽입 */
	
	// [이승준] "회원문의" 삽입
	@GetMapping("/member/addQna")
	public String addQna(HttpServletRequest request, Model model) {
		log.debug("[Debug] \"START\" QnaController.addQna() | Get");
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
			// 오직 멤버만 작성 가능
			if(loginUser.getUserLevel() != 1) {
				return "redirect:/qnaList";
			}
		} else {
			log.debug(" ├[param] loginUser : Null");
			return "redirect:/qnaList";
		}
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		
		return "/member/addQna";
	}
	@PostMapping("/member/addQna")
	public String addQna(Qna qna) {
		log.debug("[Debug] \"START\" QnaController.addQna() | Post");
		log.debug(" ├[param] qna : "+qna.toString());
		
		qnaService.addQna(qna);
		
		return "redirect:/qnaOne?qnaNo="+qna.getQnaNo();
	}
	
	// [이승준] "회원문의 답변" 삽입
	@GetMapping("/addQnaComment")
	public String addQnaComment() {
		log.debug("[Debug] \"START\" QnaController.addQnaComment() | Get");
		
		return "addQnaComment";
	}
	@PostMapping("/addQnaComment")
	public String addQnaComment(HttpServletRequest request, QnaComment qnaComment) {
		log.debug("[Debug] \"START\" QnaController.addQnaComment() | Post");
		log.debug(" ├[param] qnaComment : "+qnaComment.toString());
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		// 답변 삽입
		qnaService.addQnaComment(qnaComment);
		
		return "redirect:/qnaOne?qnaNo="+qnaComment.getQnaNo();
	}
	
	
	
/* 3. 수정 */
	
	// [이승준] "회원문의" 수정
	@GetMapping("/member/modifyQna")
	public String modifyQna(HttpServletRequest request, Model model, int qnaNo) {
		log.debug("[Debug] \"START\" QnaController.modifyQna() | Get");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		
		// 수정 전 기존 값 조회
		Qna qna = qnaService.getQnaOne(qnaNo);
		model.addAttribute(qna);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
			// 오직 게시글을 작성한 회원만 접근 가능
			if(loginUser.getUserLevel() != 1 && loginUser.getMember().getMemberNo() == qna.getMemberNo()) {
				return "redirect:/qnaList";
			}
		} else {
			log.debug(" ├[param] loginUser : Null");
			return "redirect:/qnaList";
		}
		
		return "/member/modifyQna";
	}
	@PostMapping("/member/modifyQna")
	public String modifyQna(Qna qna) {
		log.debug("[Debug] \"START\" QnaController.modifyQna() | Post");
		log.debug(" ├[param] qna : "+qna.toString());
		
		qnaService.modifyQna(qna);
		
		return "redirect:/qnaOne?qnaNo="+qna.getQnaNo();
	}
	
	
	
/* 4. 삭제 */
	
	// [이승준] "회원문의 답변" 삭제
	@GetMapping("/removeQnaComment")
	public String removeQnaComment(HttpServletRequest request, int qnaNo) {
		log.debug("[Debug] \"START\" QnaController.removeQnaComment() | Get");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		// 답변 삽입
		qnaService.removeQnaComment(qnaNo);
		
		return "redirect:/qnaOne?qnaNo="+qnaNo;
	}
	
	// [이승준] "회원문의" 삭제
	@GetMapping("/removeQna")
	public String removeQna(HttpServletRequest request, int qnaNo) {
		log.debug("[Debug] \"START\" QnaController.removeQna() | Get");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		// 수정 전 기존 값 출력
		qnaService.removeQna(qnaNo);
		
		return "redirect:/qnaList";
	}
	
	
	
}
