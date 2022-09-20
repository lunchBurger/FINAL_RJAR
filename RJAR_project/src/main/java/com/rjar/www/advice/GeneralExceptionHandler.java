package com.rjar.www.advice;

import java.io.IOException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

// Controller 밖으로 throw 되는 예외를 처리하는 전역 Handler(AOP 기반) 어노테이션
@Log4j
@ControllerAdvice
public class GeneralExceptionHandler{
	
	// @Controller, @RestController가 적용된 Bean내에서 발생하는
	// 예외를 처리하는 어노테이션
	@ExceptionHandler
	public ModelAndView urlExcept(IOException ex) {

		log.error("IOException..." + ex.getMessage());
		System.out.println("오류가 가나?");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showError");

		return mav;
	}

}
