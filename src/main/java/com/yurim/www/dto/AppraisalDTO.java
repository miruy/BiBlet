package com.yurim.www.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Alias("AppraisalDTO")
public class AppraisalDTO {
    /**
     * appraisal
     */
    private Long appraisalNo;
    private int star;
    private String comment;
    private String startDate;
    private String endDate;
    private String coPrv;
    private Long statusNo;

    /**
     * + requestCommentForDetail / requestWriteComment
     */
    private Long userNo;
    private String id;
    private String originPic;
    private String pass;
    private String isbn;
    private String name;
    private String storedPic;

    private String option;
    private String keyword;
}
