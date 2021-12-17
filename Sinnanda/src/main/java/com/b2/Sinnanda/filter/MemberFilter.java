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
import javax.servlet.http.HttpSession;

import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

// [이승준] Member 관련 필터
//	[김영후] 유저 권한 별 필터링 작업 21.12.14

@Slf4j
@WebFilter(urlPatterns = {"/member/*", "/addQna"})
public class MemberFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.debug("[Debug] \"Member 필터 생성\" MemberFilter.init()");
	}

	//	[김영후] Member filter 
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		log.debug("[Debug] \"Member 필터 시작\" MemberFilter.doFilter()");
				
		//	User 객체 생성
		User loginUser = new User();
		// request 호출
		HttpServletRequest req = (HttpServletRequest) request;
		// 세션 정보 가져오기
		HttpSession session = req.getSession();
		// 로그인 정보가 없을 시, login 페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			log.info(" ├[info] \"로그인 정보 없음, 로그인 페이지로 이동\" MemberFilter.doFilter()");
			req.getRequestDispatcher("/login").forward(request, response);
			return;
		} else {
			loginUser = (User)session.getAttribute("loginUser");
			log.debug(" ├[param] user : "+loginUser.toString());	
			//	UserLevel 검사
			if(loginUser.getUserLevel() < 1) {
				log.info(" ├[info] \"User 권한 부족, 로그인 페이지로 이동\" MemberFilter.doFilter()");
				req.getRequestDispatcher("/login").forward(request, response);				
			}
		}		
		chain.doFilter(request, response);
		log.debug("[Debug] \"Member 필터 종료\" MemberFilter.doFilter()");
	}
	
	@Override
	public void destroy() {
		log.debug("[Debug] \"Member 필터 파기\" MemberFilter.destroy()");
	}
}
