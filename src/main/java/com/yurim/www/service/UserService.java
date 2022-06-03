package com.yurim.www.service;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.vo.RequestLogin;

public interface UserService {
    void userSignup(UserDTO userDTO);
    void updateKey(String email, String authKey);
    void updateAuthStatus(String email, String authKey);
    String selectKey(String email);
    UserDTO authenticate(UserDTO userDTO) throws Exception;
    String findIdByEmail(String email, String pass);
    UserDTO selectUserInfoById(String id);
    UserDTO kakaoAuthenticate(UserDTO userDTO);
}
