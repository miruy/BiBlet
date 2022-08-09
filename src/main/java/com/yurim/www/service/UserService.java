package com.yurim.www.service;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.vo.RequestLogin;

public interface UserService {
    void userSignup(UserDTO userDTO);    //회원가입
    void updateKey(String email, String authKey);   //인증키 수정
    void updateAuthStatus(String email, String authKey);    //인증상태 수정
    String selectKey(String email); //인증키 조회
    UserDTO selectUserInfoById(String id);  //ID로 회원 정보 조회
    UserDTO selectUserInfoByUserNo(Long userNo);    //회원번호로 회원 정보 조회
    String findIdByEmail(String email, String pass);    //이메일로 ID 조회
    UserDTO authenticate(UserDTO userDTO) throws Exception; //회원 인증 확인
    UserDTO kakaoAuthenticate(UserDTO userDTO); //카카오 로그인 회원 인증 확인
}
