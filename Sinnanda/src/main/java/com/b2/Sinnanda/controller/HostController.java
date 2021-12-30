package com.b2.Sinnanda.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.service.AddressService;
import com.b2.Sinnanda.service.ComplainService;
import com.b2.Sinnanda.service.HostQnaService;
import com.b2.Sinnanda.service.HostService;
import com.b2.Sinnanda.service.ReviewService;
import com.b2.Sinnanda.vo.Address;
import com.b2.Sinnanda.vo.Host;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
public class HostController {
	@Autowired
	private DL dl;	// 조장이 만든 로그 출력 클래스
	@Autowired
	private HostService hostService;
	@Autowired
	private HostQnaService hostQnaService;
	@Autowired
	private ComplainService complainService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private AddressService addressService;
	
/* 2. 삽입 */

	// [이승준] "사업자 주소 테스트" | 사업자페이지
	@GetMapping("/host/hostTest")
	public String getTest(HttpSession session, Model model) {
		dl.p("HostService", "getMyInfo() | Get", "[시작]");
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("getHostPage()", "loginUser", loginUser.toString());
		
		Address address = addressService.getAddressOne("서울특별시 양천구 목동중앙본로2길 38-38");
		//Address address = addressService.getAddressOne("서울특별시 금천구 가마산로 70");
		
		Host host = hostService.getHostOneWithAddress(loginUser.getHost().getHostNo());
		
		model.addAttribute("host", host);
		model.addAttribute("address", address);
		return "host/hostTest";
	}
	
	// [이승준] "사업자 상세" 조회
	@GetMapping("/host/myHostInfo")
	public String getMyHostInfo(HttpSession session, Model model, int hostNo) {
		dl.p("HostService", "getMyInfo() | Get", "[시작]");
		dl.p("getMyInfo()", "hostNo", hostNo);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("getHostPage()", "loginUser", loginUser.toString());
		
		// 2. 방어코드 : 자신의 정보에 대해서만 출력하기 위함
		if(loginUser.getHost().getHostNo() != hostNo) {
			return "redirect:/index";
		}
		
		// 3. "사업자 상세" 조회 서비스 호출
		Host host = hostService.getHostOneWithAddress(hostNo);
		
		// 4. 모델 전달
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("host", host);
		
		return "host/myHostInfo";
	}
	
	// [이승준] "사업자" 메인페이지
	@GetMapping("/host/hostPage")
	public String getHostPage(HttpSession session, Model model, int hostNo) {
		dl.p("HostService", "getHostPage() | Get", "[시작]");
		dl.p("getHostPage()", "hostNo", hostNo);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("getHostPage()", "loginUser", loginUser.toString());
		
		// 2. 방어코드 : 자신의 정보에 대해서만 출력하기 위함
		if(loginUser.getHost().getHostNo() != hostNo) {
			return "redirect:/index";
		}
		
		// 3. "답변없는 사업자문의 목록" 조회
		Map<String, Object> noCommentedHostQnaMap = hostQnaService.getNotCommentedHostQnaList(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), null, 0, 10);
		
		// 4. "답변없는 리뷰 목록" 조회
		Map<String, Object> noCommentedReviewMap = reviewService.getNotCommentedReviewList(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), 0, 10);
		
		// 5. "답변없는 컴플레인 목록" 조회
		Map<String, Object> noCommentedComplainMap = complainService.getNotCommentedComplainList(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), null, 0, 10);
		
		// 6. 모델 전달
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("hostQnaList", noCommentedHostQnaMap.get("hostQnaList"));
		model.addAttribute("hostQnaListTotalCount", noCommentedHostQnaMap.get("totalCount"));
		model.addAttribute("reviewList", noCommentedReviewMap.get("reviewList"));
		model.addAttribute("reviewListTotalCount", noCommentedReviewMap.get("totalCount"));
		model.addAttribute("complainList", noCommentedComplainMap.get("complainList"));
		model.addAttribute("complainListTotalCount", noCommentedComplainMap.get("totalCount"));
		
		return "host/hostPage";
	}
	
	// [이승준] Host 정보 보기
	@GetMapping("/host/hostInfo")
	public String hostInfo(HttpSession session, Model model) {
		dl.p("HostController", "hostInfo()", "[시작]");
		
		// 1. 로그인된 세션 정보 조회
		User loginUser = (User)session.getAttribute("loginUser");
		// 1-1. 로그인된 세션 정보 디버깅
		if(loginUser != null) {
			dl.p("HostController", "loginUser", loginUser.toString());
		} else {
			dl.p("HostController", "loginUser", "null");
			return "redirect:/index";
		}
		
		// 2. 모델 추가
		model.addAttribute("loginUser", loginUser);
		
		return "host/hostInfo";
	}
}
