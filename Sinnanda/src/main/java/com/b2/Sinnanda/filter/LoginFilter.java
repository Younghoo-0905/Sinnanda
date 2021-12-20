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

import org.springframework.beans.factory.annotation.Autowired;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@WebFilter(urlPatterns = {"/index","/login"})
public class LoginFilter implements Filter{
	
	@Autowired DL dl;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		dl.p("LoginFilter", "init()", "Login 필터 생성");
	}

	//	[김영후] Login filter
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		dl.p("LoginFilter", "doFilter()", "Login 필터 시작");
		// request 호출
		HttpServletRequest req = (HttpServletRequest) request;
		// 세션 정보 가져오기
		HttpSession session = req.getSession();
		//	이미 로그인 된 유저는 메인 화면으로
		if(session.getAttribute("loginUser") != null) {
			dl.p("LoginFilter", "doFilter()", "이미 로그인 된 유저입니다.");
			req.getRequestDispatcher("/index").forward(request, response);					
		}
		chain.doFilter(request, response);
		dl.p("LoginFilter", "doFilter()", "Login 필터 종료");
    }

	@Override
	public void destroy() {
		dl.p("LoginFilter", "destroy()", "Login 필터 파기");
		
	}
}