package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MypageDAOImpl implements MypageDAO {

    private final SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<AppraisalDTO> myCommentForMypage(Long userNo){
        return sqlSessionTemplate.selectList("myCommentForMypage", userNo);
    }

    @Override
    public List<AppraisalDTO> myEvaluateList(Long userNo){
        return sqlSessionTemplate.selectList("myEvaluateList", userNo);
    }

    @Override
    public List<String> mypage_1(Long userNo){
        return sqlSessionTemplate.selectList("mypage_1", userNo);
    }

    @Override
    public List<String> mypage_2(Long userNo){
        return sqlSessionTemplate.selectList("mypage_2", userNo);
    }

    @Override
    public List<AppraisalDTO> mypage_4(Long userNo){
        return sqlSessionTemplate.selectList("mypage_4", userNo);
    }

    @Override
    public void updateUserInfo(UserDTO newInfo) {
        sqlSessionTemplate.update("updateUserInfo", newInfo);
    }

    @Override
    public void deleteUserInfo(Long userNo){
        sqlSessionTemplate.delete("deleteUserInfo", userNo);
    }

    @Override
    public void deleteBookshelf(Long userNo){
        sqlSessionTemplate.delete("deleteBookshelf", userNo);
    }

    @Override
    public int deleteUserAppraisal(Long userNo){
        return sqlSessionTemplate.delete("deleteUserAppraisal", userNo);
    }

    @Override
    public void changedDefaultProfile(Long userNo){
        sqlSessionTemplate.update("changedDefaultProfile", userNo);
    }

}
