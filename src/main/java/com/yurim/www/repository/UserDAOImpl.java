package com.yurim.www.repository;

import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
@RequiredArgsConstructor
public class UserDAOImpl implements UserDAO{
    private final SqlSessionTemplate sqlSessionTemplate;

    //회원가입
    @Override
    public void userSignup(UserDTO userDTO){
        sqlSessionTemplate.insert("userSignup", userDTO);
    }

    //회원 이메일 확인
    @Override
    public int userEmailChk(String email) {
        int emailChkResult = sqlSessionTemplate.selectOne("userEmailChk", email);
        return emailChkResult;
    }

    //회원 ID 확인
    @Override
    public int userIdChk(String id) {
        int idChkResult = sqlSessionTemplate.selectOne("userIdChk", id);
        return idChkResult;
    }

    //인증키 수정
    @Override
    public void updateKey(HashMap<String, String> map) {
        sqlSessionTemplate.update("updateKey", map);
    }

    //인증상태 수정
    @Override
    public void updateAuthStatus(HashMap<String, String> map) {
        sqlSessionTemplate.update("updateAuthStatus", map);
    }

    //인증키 조회
    @Override
    public String selectKey(String email){
        return sqlSessionTemplate.selectOne("selectKey", email);
    }

    //ID로 회원 정보 조회
    @Override
    public UserDTO selectUserInfoById(String id) {
        return sqlSessionTemplate.selectOne("selectUserInfoById", id);
    }

    //회원번호로 회원 정보 조회
    @Override
    public UserDTO selectUserInfoByUserNo(Long UserNo) {
        return sqlSessionTemplate.selectOne("selectUserInfoByUserNo", UserNo);
    }

    //이메일로 ID 조회
    @Override
    public String findIdByEmail(HashMap<String, String> map) {
        return sqlSessionTemplate.selectOne("findIdByEmail", map);
    }
}
