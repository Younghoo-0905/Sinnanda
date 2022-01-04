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

import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

//	[김영후] 유저 권한 별 필터링 작업 21.12.14

@Slf4j
@WebFilter(urlPatterns = "/host/*")
public class HostLoginFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.debug("[Debug] \"Host 필터 생성\" HostFilter.init()");
	}
	
	//	[김영후] Host filter
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		log.debug("[Debug] \"Host 필터 시작\" HostFilter.doFilter()");
		
		//	User 객체 생성
		User loginUser = new User();
		// request 호출
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res =(HttpServletResponse) response;
		// 세션 정보 가져오기
		HttpSession session = req.getSession();
		// 로그인 정보가 없을 시, login 페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			log.info(" ├[info] \"로그인 정보 없음, 로그인 페이지로 이동\" HostFilter.doFilter()");
			res.sendRedirect(req.getContextPath()+"/login");// [이원희]포워드해서 넘길 파라미터가 없고 좋은 방법 아님
			//req.getRequestDispatcher("/login").forward(request, response);
			return;
		} else {
			loginUser = (User)session.getAttribute("loginUser");
			log.debug(" ├[param] user : "+loginUser.toString());	
			//	UserLevel 검사
			if(loginUser.getUserLevel() != 2) {
				log.info(" ├[info] \"User 권한 부족, 인덱스 페이지로 이동\" HostFilter.doFilter()");
				//req.getRequestDispatcher("/login").forward(request, response);
				res.sendRedirect(req.getContextPath()+"/index");// 권한 부족은 로그인이 되있는 상태이니 인덱스로 이동
				return;
			}
		}		
		chain.doFilter(request, response);
		log.debug("[Debug] \"Host 필터 종료\" HostFilter.doFilter()"); 
    }

	@Override
	public void destroy() {
		log.debug("[Debug] \"Host 필터 파기\" HostFilter.destroy()");
	}
}