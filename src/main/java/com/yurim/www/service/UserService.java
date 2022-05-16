package com.yurim.www.service;

import com.yurim.www.dto.UserDTO;

public interface UserService {
    void userSignup(UserDTO userDTO);
    void updateKey(String email, String authKey);
    void updateStatus(String email, String authKey);
    String selectKey(String email);
    UserDTO authenticate(UserDTO userDTO) throws Exception;
}
