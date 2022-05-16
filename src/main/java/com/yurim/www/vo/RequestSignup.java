package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotEmpty;

@Getter
@Setter
public class RequestSignup {
    @Max(value=6, message = "한글 6글자, 영어 50byte 이내")
    @NotEmpty(message="필수 입력란 입니다.")
    private String name;

    @Max(value=30, message = "한글 30글자, 영어 100byte 이내")
    @NotEmpty(message="필수 입력란 입니다.")
    private String id;

    @Max(value=30, message = "한글 30글자, 영어 100byte 이내")
    @NotEmpty(message="필수 입력란 입니다.")
    private String pass;

    @NotEmpty(message="필수 입력란 입니다.")
    @Email(message="올바른 이메일 형식이 아닙니다.")
    private String email;

    private String commonError;
    private int authStatus;
}
