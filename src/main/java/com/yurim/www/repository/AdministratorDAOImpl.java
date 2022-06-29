package com.yurim.www.repository;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
@RequiredArgsConstructor
public class AdministratorDAOImpl implements AdministratorDAO{

    private final SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void adminSignup(AdministratorDTO admin){
        sqlSessionTemplate.insert("adminSignup", admin);
    }

    @Override
    public int adminEmailChk(String email) {
        int emailChkResult = sqlSessionTemplate.selectOne("adminEmailChk", email);
        return emailChkResult;
    }

    @Override
    public int adminIdChk(String id) {
        int idChkResult = sqlSessionTemplate.selectOne("adminIdChk", id);
        return idChkResult;
    }


    @Override
    public void updateAdmAuthkey(HashMap <String, String> map) {
        sqlSessionTemplate.update("updateAdmAuthkey", map);
    }

    @Override
    public void updateAdmStatus(String adm_email) {
        sqlSessionTemplate.update("updateAdmStatus", adm_email);
    }

    @Override
    public AdministratorDTO selectByAdminId(String admId) {
        return sqlSessionTemplate.selectOne("selectByAdminId", admId);
    }
}
