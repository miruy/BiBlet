package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestUpdateComment {
    private String comment;
    private String startDate;
    private String endDate;
    private String coPrv;
    private String isbn;
}
