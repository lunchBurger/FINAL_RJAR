package com.rjar.www.advice;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.exception.CheckUserException;
import com.rjar.www.exception.IdCheckException;
import com.rjar.www.exception.NoMatchingPwException;

@org.springframework.web.bind.annotation.ControllerAdvice
public class ControllerAdvice {
	
	// 한글 깨짐 방지
//	private HttpHeaders getHeaders() {
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Content-Type", "text/plain;charset=utf-8");
//		return headers;
//	}

	@ExceptionHandler(IdCheckException.class) // 처리할 예외처리 타입 선언
	public ModelAndView IdCheckExceptionHandler(IdCheckException ex) {
		
		System.out.println("CheckException Advice 진입");
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", ex.getMessage());
		mav.setViewName("findPw");
		
		return mav;
	}
	
	@ExceptionHandler(NoMatchingPwException.class) // 처리할 예외처리 타입 선언
	public ModelAndView NoMatchingPwExceptionExceptionHandler(NoMatchingPwException ex) {
		
		System.out.println("NoMatchingPwException Advice 진입");
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", ex.getMessage());
		mav.setViewName("findPw2");
		
		return mav;
	}
	
	@ExceptionHandler(CheckUserException.class) // 처리할 예외처리 타입 선언
	public ModelAndView CheckUserExceptionHandler(CheckUserException ex) {
		
		System.out.println("CheckUserException Advice 진입");
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", ex.getMessage());
		mav.setViewName("redirect:/login");
		
		return mav;
	}
	
}
