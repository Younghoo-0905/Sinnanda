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

import com.b2.Sinnanda.vo.Member;

import lombok.extern.slf4j.Slf4j;

// [이승준] Member 관련 필터

@Slf4j
@WebFilter(urlPatterns = {"/addQna", "/modifyQna"})
public class MemberFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.debug("[Debug] \"Member 필터 생성\" MemberFilter.init()");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		log.debug("[Debug] \"Member 필터 시작\" MemberFilter.doFilter()");
		
		Member member = new Member();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		member = (Member)session.getAttribute("loginMember");
		log.debug(" ├[param] member : "+member);
		
		// 로그인 정보가 없을 시, login 페이지로 이동
		if(member == null) {
			log.info(" ├[info] \"로그인 정보 없음, 로그인 페이지로 이동\" MemberFilter.doFilter()");
			req.getRequestDispatcher("/login").forward(request, response);
		} else {	// 
			log.info(" ├[info] \"로그인 정보 존재\" MemberFilter.doFilter()");
			chain.doFilter(request, response);
		}
		log.debug("[Debug] \"Member 필터 종료\" MemberFilter.doFilter()");
	}
	
	@Override
	public void destroy() {
		log.debug("[Debug] \"Member 필터 파기\" MemberFilter.destroy()");
	}
}
