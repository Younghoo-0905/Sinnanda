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
import javax.websocket.Session;

import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@WebFilter(urlPatterns = {"/index","/login"})
public class LoginFilter implements Filter{
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.debug("[Debug] \"Login 필터 생성\" LoginFilter.init()");		
	}

	//	[김영후] Login filter
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		log.debug("[Debug] \"Login 필터 시작\" LoginFilter.doFilter()");

		// request 호출
		HttpServletRequest req = (HttpServletRequest) request;
		// 세션 정보 가져오기
		HttpSession session = req.getSession();
		//	이미 로그인 된 유저는 메인 화면으로
		if(session.getAttribute("loginUser") != null) {
			log.info(" ├[info] \"이미 로그인 된 유저입니다. \" LoginFilter.doFilter()");		
			req.getRequestDispatcher("/index").forward(request, response);					
		}
		chain.doFilter(request, response);
		log.debug("[Debug] \"Login 필터 종료\" LoginFilter.doFilter()"); 
    }

	@Override
	public void destroy() {
		log.debug("[Debug] \"Login 필터 파기\" LoginFilter.destroy()");
	}
}