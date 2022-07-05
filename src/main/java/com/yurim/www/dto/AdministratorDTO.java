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
@Alias("AdministratorDTO")
public class AdministratorDTO {

    private Long admNo;
    private String admName;
    private String admId;
    private String admPass;
    private LocalDateTime admRegDate;
    private String admEmail;
    private String admAuthkey;
    private int admAuthstatus;
    private String securitycode;

    private String option;
    private String keyword;

    public AdministratorDTO(String admId, String admPass, String admEmail, String securitycode) {
        super();
        this.admId = admId;
        this.admPass = admPass;
        this.admEmail = admEmail;
        this.securitycode = securitycode;
    }
}