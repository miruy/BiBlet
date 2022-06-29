package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
@Setter
public class RequestAdmSignup {

    @NotEmpty(message="필수 입력란 입니다.")
    private String admName;

    @NotEmpty(message="필수 입력란 입니다.")
    private String admId;

    @NotEmpty(message="필수 입력란 입니다.")
    private String admPass;

    @NotEmpty(message="필수 입력란 입니다.")
    @Email(message="올바른 이메일 형식이 아닙니다.")
    private String admEmail;

    private int admAuthstatus;
    private String admAuthkey;

    @NotEmpty(message="필수 입력란 입니다.")
    private String securitycode;

    private String commonError;

}
