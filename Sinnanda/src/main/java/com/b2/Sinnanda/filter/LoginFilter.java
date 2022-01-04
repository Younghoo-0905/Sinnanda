package com.b2.Sinnanda.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;
@WebFilter("/login/*")
public class LoginFilter extends HttpFilter implements Filter {
	//[이원희]필터에는 DL 메소드 사용하지 말것!
	
   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		throws IOException, ServletException {
		
	   HttpSession session = ((HttpServletRequest)request).getSession();
	   
	   if(session.getAttribute("loginUser") != null) {
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/index");
			return;
		}
	   
	   
	super.doFilter(request, response, chain);
}
}
