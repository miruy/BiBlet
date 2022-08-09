package com.yurim.www.exception;

//이미 존재하는 이메일 예외처리
public class AlreadyExistEmailException extends RuntimeException{
	public AlreadyExistEmailException() {
		super();
	}
}
