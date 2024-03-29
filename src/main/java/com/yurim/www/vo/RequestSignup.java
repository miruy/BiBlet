package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import java.time.LocalDateTime;

@Getter
@Setter
public class RequestSignup {

    @NotEmpty(message="필수 입력란 입니다.")
    @Size(min = 2, message = "최소 2글자이상 입력바랍니다.")
    private String name;

    @NotEmpty(message="필수 입력란 입니다.")
    @Size(min = 5, max = 20, message = "5 ~ 20글자 이내로 입력바랍니다.")
    private String id;

    @NotEmpty(message="필수 입력란 입니다.")
    @Size(min = 4, max = 15, message = "4 ~ 15글자 이내로 입력바랍니다.")
    private String pass;

    @NotEmpty(message="필수 입력란 입니다.")
    @Email(message="올바른 이메일 형식이 아닙니다.")
    private String email;

    private String commonError;
    private int authStatus;

    private LocalDateTime regDate;
    private String profile;
    private Long userNo;
}
