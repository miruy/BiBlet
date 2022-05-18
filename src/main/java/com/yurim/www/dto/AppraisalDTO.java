package com.yurim.www.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AppraisalDTO {
    private Long appraisalNo;
    private int star;
    private String comment;
    private String startDate;
    private String endDate;
    private String coPrv;
    private Long statusNum;
}
