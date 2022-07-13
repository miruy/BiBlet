package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestNoticeSearch {
    private String keyword;
    private String option;

    private Long noticeNo;
}
