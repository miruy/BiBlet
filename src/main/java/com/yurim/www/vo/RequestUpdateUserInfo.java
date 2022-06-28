package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
@Setter
public class RequestUpdateUserInfo {

    @NotEmpty(message="필수 입력란 입니다.")
    @Size(min = 5, max = 10, message = "5 ~ 10글자 이내로 입력바랍니다.")
    private String id;

    private String pass;

    @NotEmpty(message="필수 입력란 입니다.")
    @Email(message="올바른 이메일 형식이 아닙니다.")
    private String email;

    private String commonError;

    private MultipartFile file;
    private String newPass;
    private Long userNo;

}
