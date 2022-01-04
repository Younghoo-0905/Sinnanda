package com.b2.Sinnanda.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

// [이승준] Member 관련 필터
//	[김영후] 유저 권한 별 필터링 작업 21.12.14
// [이원희] 디버그 메소드 적용 21.12.20 - > 디버그 메소드 aws 업로드시 문제 되므로 필터에서 사용 x 22.01.04
//	ㄴ 포워드에서 리다이렉트로 코드 변경


@WebFilter(urlPatterns = "/member/*")
public class MemberFilter implements Filter {
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//dl.p("MemberFilter", "init()", "Member 필터 생성");
	}

	//	[김영후] Member filter 
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//dl.p("MemberFilter", "doFilter()", "Member 필터 시작");
				
		//	User 객체 생성
		User loginUser = new User();
		// request 호출
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res =(HttpServletResponse) response;
		
		// 세션 정보 가져오기
		HttpSession session = req.getSession();
		// 로그인 정보가 없을 시, login 페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			//dl.p("MemberFilter", "doFilter()", "로그인 정보 없음, 로그인 페이지로 이동");
			res.sendRedirect(req.getContextPath()+"/login");
			//req.getRequestDispatcher("/login").forward(request, response);
			return;
		} else {
			loginUser = (User)session.getAttribute("loginUser");
			//dl.p("MemberFilter", "user", loginUser.toString());
			//	이메일 인증여부 검사
			if(loginUser.getMember().getMemberActive() == 0) {
				//dl.p("MemberFilter", "doFilter()", "이메일 미인증 계정입니다. 인증 페이지로 이동");
				res.sendRedirect(req.getContextPath()+"/certifyEmailForm");
				//req.getRequestDispatcher("/certifyEmailForm").forward(request, response);	
				return;
			}
			//	휴면 여부 검사
			if(loginUser.getMember().getMemberActive() == 2) {
				//dl.p("MemberFilter", "doFilter()", "휴면 계정입니다. 휴면해제 페이지로 이동");
				res.sendRedirect(req.getContextPath()+"/activeMemberForm");
				//req.getRequestDispatcher("/activeMemberForm").forward(request, response);	
				return;
			}
			//	UserLevel 검사
			if(loginUser.getUserLevel() != 1) {
				//dl.p("MemberFilter", "doFilter()", "User 권한 부족, 인덱스 페이지로 이동");
				res.sendRedirect(req.getContextPath()+"/index");
				//req.getRequestDispatcher("/login").forward(request, response);		
				return;
			}
		}		
		chain.doFilter(request, response);
		//dl.p("MemberFilter", "doFilter()", "Member 필터 종료");
	}
	
	@Override
	public void destroy() {
		//dl.p("MemberFilter", "destroy()", "Member 필터 파기");
	}
}
