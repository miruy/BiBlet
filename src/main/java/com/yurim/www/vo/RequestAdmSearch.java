package com.yurim.www.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestAdmSearch {
    private String keyword;
    private String option;
    private String returnIsbn;
}
