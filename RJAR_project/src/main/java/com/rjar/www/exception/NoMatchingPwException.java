package com.rjar.www.exception;

public class NoMatchingPwException extends RuntimeException {
	public NoMatchingPwException(String msg) {
		super(msg);
		System.out.println("NoMatchingPw 진입");
	}
}
