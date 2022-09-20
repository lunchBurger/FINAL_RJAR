package com.rjar.www.userClass;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println();
		System.out.println("SessionInterceptor preHandler call");
		System.out.println("preHandler session : " + request.getSession().getAttribute("m_nick"));
		System.out.println("preHandler session : " + request.getSession().getAttribute("m_id"));
		if (request.getSession().getAttribute("m_nick") == null) {
			System.out.println("비 로그인....");
			response.sendRedirect("./"); // home.jsp
		}
		return true; // controller 진입가능
	}

}
