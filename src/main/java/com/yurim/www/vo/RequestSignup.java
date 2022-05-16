package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

@Getter
@Setter
public class RequestSignup {
    @Min(value = 2, message = "최소 2글자 이상이여야합니다.")
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
    private int authStatus;
}
