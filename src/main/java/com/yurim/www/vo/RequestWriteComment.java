package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestWriteComment {
    private int star;
    private String comment;
    private String startDate;
    private String endDate;
    private String coPrv;
    private String isbn;
    private String query;
    private int option;
}
