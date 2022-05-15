package com.yurim.www.repository;

import com.yurim.www.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

public interface UserDAO {
    void userSignup(UserDTO userDTO);
    int userEmailChk(String email);
    int userIdChk(String id);
}
