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

import lombok.extern.slf4j.Slf4j;
@Slf4j
@WebFilter(urlPatterns = {"/index","/login"})
public class LoginFilter implements Filter{
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		log.debug("로그인 필터 작동!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		boolean isRedirect = false;
		Member member = new Member();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		member = (Member)session.getAttribute("loginMember");
		log.debug("로그인 필터 세션값 확인 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+member);
		
		if(member == null) {
			isRedirect = true;
		}
		
		if(isRedirect == true) {
			log.debug("비회원은 로그인 필터가 처리했으니 안심하라굿!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			req.getRequestDispatcher("/login").forward(request, response);
			return;
		}else {
			log.debug("너는 로그인 했으니 로그인 페이지로 그만가셈!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			req.getRequestDispatcher("/index").forward(request, response);
			chain.doFilter(request, response);
			return;
		}
    }

	@Override
	public void destroy() {

	}
}