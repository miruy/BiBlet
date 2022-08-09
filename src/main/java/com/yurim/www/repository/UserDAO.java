package com.yurim.www.repository;

import com.yurim.www.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

public interface UserDAO {
    void userSignup(UserDTO userDTO);   //회원가입
    int userEmailChk(String email); //회원 이메일 확인
    int userIdChk(String id);   //회원 ID 확인
    void updateKey(HashMap<String,String> map); //인증키 수정
    void updateAuthStatus(HashMap<String,String> map);  //인증상태 수정
    String selectKey(String email); //인증키 조회
    UserDTO selectUserInfoById(String id);  //ID로 회원 정보 조회
    UserDTO selectUserInfoByUserNo(Long UserNo);    //회원번호로 회원 정보 조회
    String findIdByEmail(HashMap<String,String> map);   //이메일로 ID 조회
}
