package com.yurim.www.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Alias("UserDTO")
public class UserDTO {
    private Long userNo;

    private String name;

    private String id;

    private String pass;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    private LocalDateTime regDate;
    
    private String email;
    private String originPic;
    private String storedPic;
    private String authKey;
    private String authStatus;
}