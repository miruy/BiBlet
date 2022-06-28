package com.yurim.www.repository;

import com.yurim.www.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

public interface UserDAO {
    void userSignup(UserDTO userDTO);
    int userEmailChk(String email);
    int userIdChk(String id);
    void updateKey(HashMap<String,String> map);
    void updateAuthStatus(HashMap<String,String> map);
    String selectKey(String email);
    UserDTO selectUserInfoById(String id);

    UserDTO selectUserInfoByUserNo(Long UserNo);
    String findIdByEmail(HashMap<String,String> map);
}
