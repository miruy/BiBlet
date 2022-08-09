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

    //나의 펼가 리스트
    @Override
    public List<AppraisalDTO> myCommentForMypage(Long userNo){
        return sqlSessionTemplate.selectList("myCommentForMypage", userNo);
    }

    //나의 평점 리스트 5개 조회
    @Override
    public List<AppraisalDTO> myEvaluateList(Long userNo){
        return sqlSessionTemplate.selectList("myEvaluateList", userNo);
    }

    //읽고싶어요 리스트
    @Override
    public List<String> mypage_1(Long userNo){
        return sqlSessionTemplate.selectList("mypage_1", userNo);
    }

    //읽는 중 리스트
    @Override
    public List<String> mypage_2(Long userNo){
        return sqlSessionTemplate.selectList("mypage_2", userNo);
    }

    //나의 모든 평점 리스트
    @Override
    public List<AppraisalDTO> mypage_4(Long userNo){
        return sqlSessionTemplate.selectList("mypage_4", userNo);
    }

    //회원정보 수정
    @Override
    public void updateUserInfo(UserDTO newInfo) {
        sqlSessionTemplate.update("updateUserInfo", newInfo);
    }

    //회원 탈퇴
    @Override
    public void deleteUserInfo(Long userNo){
        sqlSessionTemplate.delete("deleteUserInfo", userNo);
    }

    //보관함 삭제
    @Override
    public void deleteBookshelf(Long userNo){
        sqlSessionTemplate.delete("deleteBookshelf", userNo);
    }

    //평가, 평점 삭제
    @Override
    public int deleteUserAppraisal(Long userNo){
        return sqlSessionTemplate.delete("deleteUserAppraisal", userNo);
    }

    //기본 프로필로 돌아가기
    @Override
    public void changedDefaultProfile(Long userNo){
        sqlSessionTemplate.update("changedDefaultProfile", userNo);
    }
}
