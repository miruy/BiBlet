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

    @Override
    public void userSignup(UserDTO userDTO){
        sqlSessionTemplate.insert("userSignup", userDTO);
    }

    @Override
    public int userEmailChk(String email) {
        int emailChkResult = sqlSessionTemplate.selectOne("userEmailChk", email);
        return emailChkResult;
    }

    @Override
    public int userIdChk(String id) {
        int idChkResult = sqlSessionTemplate.selectOne("userIdChk", id);
        return idChkResult;
    }

    @Override
    public String selectKey(String email){
        return sqlSessionTemplate.selectOne("selectKey", email);
    }

    @Override
    public void updateKey(HashMap<String, String> map) {
        sqlSessionTemplate.update("updateKey", map);
    }

    @Override
    public void updateAuthStatus(HashMap<String, String> map) {
        sqlSessionTemplate.update("updateAuthStatus", map);
    }

    @Override
    public UserDTO selectUserInfoById(String id) {
        return sqlSessionTemplate.selectOne("selectUserInfoById", id);
    }

    @Override
    public String findIdByEmail(HashMap<String, String> map) {
        return sqlSessionTemplate.selectOne("findIdByEmail", map);
    }

}
