package com.yurim.www.repository;

import com.yurim.www.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    void userSignup(UserDTO userDTO);
}
