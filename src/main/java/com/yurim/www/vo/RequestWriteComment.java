package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestWriteComment {
    private int star;
    private String comment;
    private String stardDate;
    private String endDate;
    private String coPrv;
    private String isbn;
    private String query;
    private int option;
}
