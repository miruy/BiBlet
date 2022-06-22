package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
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
}
