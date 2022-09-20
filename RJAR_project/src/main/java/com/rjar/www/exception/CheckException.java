package com.rjar.www.exception;

public class CheckException extends RuntimeException {

	public CheckException(String msg) {
		// @ExceptionHandler(CheckException.class)로 진행
		super(msg);
		System.out.println("CheckException 진입");
	}

}
