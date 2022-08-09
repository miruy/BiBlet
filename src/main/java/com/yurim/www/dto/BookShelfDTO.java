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
@Alias("BookShelfDTO")
public class BookShelfDTO {
    private Long statusNo;
    private int status;
    private String isbn;
    private Long userNo;


    private int beforeStatus;
}