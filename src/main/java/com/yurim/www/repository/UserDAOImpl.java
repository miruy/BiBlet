package com.yurim.www.repository;

import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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


}
