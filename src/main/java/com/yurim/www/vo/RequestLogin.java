package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Getter
@Setter
public class RequestLogin {
    private Long userNo;
    private String name;

    @NotEmpty(message="필수 입력란 입니다.")
    private String id;

    @NotEmpty(message="필수 입력란 입니다.")
    private String pass;
    private boolean rememberId;
    private int authStatus;
}
