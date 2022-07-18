package com.yurim.www.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Alias("NoticeDTO")
public class NoticeDTO {

    private Long noticeNo;
    private String writer;
    private String title;
    private String content;
    private LocalDateTime writeDate;
    private Long count;
    private String originFile;
    private String storedFile;

    private String option;
    private String keyword;

    private Long page;
}