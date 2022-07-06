package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Getter
@Setter
public class RequestAdmLogin {

    @NotEmpty(message="필수 입력란 입니다.")
    private String admId;

    @NotEmpty(message="필수 입력란 입니다.")
    private String admPass;

    private String commonError;
    private String passCheck;
}
