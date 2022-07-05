package com.yurim.www.repository;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdministratorDAOImpl implements AdministratorDAO {

    private final SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void adminSignup(AdministratorDTO admin) {
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
    public void updateAdmAuthkey(HashMap<String, String> map) {
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

    @Override
    public List<UserDTO> allUserInfo() {
        return sqlSessionTemplate.selectList("allUserInfo");
    }

    @Override
    public Long totalUser() {
        return sqlSessionTemplate.selectOne("totalUser");
    }

    @Override
    public List<UserDTO> selectUserBySearchValue(UserDTO searchUser) {
        return sqlSessionTemplate.selectList("selectUserBySearchValue", searchUser);
    }

    @Override
    public List<UserDTO> searchUserInfoByUserNo(Long userNo) {
        return sqlSessionTemplate.selectList("searchUserInfoByUserNo", userNo);
    }

    @Override
    public Long totalCountBySearchValue(UserDTO searchUser) {
        return sqlSessionTemplate.selectOne("totalCountBySearchValue", searchUser);
    }

    @Override
    public List<AppraisalDTO> allStarInfo() {
        return sqlSessionTemplate.selectList("allStarInfo");
    }

    @Override
    public Long totalStar() {
        return sqlSessionTemplate.selectOne("totalStar");
    }

    @Override
    public List<AppraisalDTO> selectStarBySearchValue(AppraisalDTO appraisal) {
        return sqlSessionTemplate.selectList("selectStarBySearchValue", appraisal);
    }

    @Override
    public Long totalStarCountBySearchValue(AppraisalDTO appraisal) {
        return sqlSessionTemplate.selectOne("totalStarCountBySearchValue", appraisal);
    }
}

