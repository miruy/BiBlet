package com.yurim.www.exception;

public class SecurityCodeNotMatchingException extends RuntimeException{
	/**
	 * 보안코드 불일차 에러
	 */
	public SecurityCodeNotMatchingException() {
		super();
	}
}
