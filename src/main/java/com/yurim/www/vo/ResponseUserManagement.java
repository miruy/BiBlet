package com.yurim.www.vo;

import com.yurim.www.dto.UserDTO;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ResponseUserManagement {
    private List<UserDTO> users;
    private Long totalCount;
}
