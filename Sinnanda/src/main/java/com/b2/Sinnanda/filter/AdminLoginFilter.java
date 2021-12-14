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

import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@WebFilter(urlPatterns = {"/adminPage","/adminLoginForm","/addNotice","/modifyNotice","/removeNotice"})
public class adminLoginFilter implements Filter{
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	//[윤경환] 관리자 필터 		[김영후] 수정 21.12.13
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		log.debug("관리자 로그인 필터 작동!!!!!!!!!");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		log.debug("관리자 로그인 필터 세션값 확인 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + loginUser);
			
		if(loginUser == null) {
			log.debug("비회원은 로그인 필터가 처리했으니 안심하라굿!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			req.getRequestDispatcher("/login").forward(request, response);
			return;
		}
		chain.doFilter(request, response);
    }

	@Override
	public void destroy() {

	}
}