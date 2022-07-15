package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
public class RequestWriteNotice {
    @NotEmpty(message="제목 또는 내용이 작성되지 않았습니다.")
    private String title;

    @NotEmpty(message="제목 또는 내용이 작성되지 않았습니다.")
    private String content;
    private MultipartFile noticeFile;

    private Long noticeNo;
}
