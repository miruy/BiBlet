package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Getter
@Setter
public class RequestSignup {
    @NotEmpty(message="필수 입력란 입니다.")
    private String name;

    @NotEmpty(message="필수 입력란 입니다.")
    private String id;

    @NotEmpty(message="필수 입력란 입니다.")
    private String pass;

    @NotEmpty(message="필수 입력란 입니다.")
    @Email(message="올바른 이메일 형식이 아닙니다.")
    private String email;

    private String commonError;
}
