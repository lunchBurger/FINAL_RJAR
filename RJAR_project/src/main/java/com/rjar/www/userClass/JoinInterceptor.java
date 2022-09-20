package com.rjar.www.userClass;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class JoinInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println();
		System.out.println("JoinInterceptor preHandler call");
		System.out.println("preHandler session : " + request.getSession().getAttribute("m_nick"));
		System.out.println("preHandler session : " + request.getSession().getAttribute("m_id"));
		if (request.getSession().getAttribute("m_nick") != null) {
			System.out.println("로그인중....");
			response.sendRedirect("./"); // home.jsp
		}
		return true; // controller 진입가능
	}
}
