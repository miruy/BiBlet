package com.yurim.www.service;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl {
    private final UserMapper userMapper;

    private void userSignup(UserDTO userDTO) {
        userMapper.userSignup(userDTO);
    }
}
