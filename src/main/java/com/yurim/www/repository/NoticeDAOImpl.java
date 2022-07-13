package com.yurim.www.repository;


import com.yurim.www.dto.NoticeDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class NoticeDAOImpl implements NoticeDAO {

    private final SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<NoticeDTO> selectAllNotice(){
        return sqlSessionTemplate.selectList("selectAllNotice");
    }

    @Override
    public Long selectAllNoticeCount(){
        return sqlSessionTemplate.selectOne("selectAllNoticeCount");
    }

    @Override
    public List<NoticeDTO> selectNoticeByPageNo(Long page){
        return sqlSessionTemplate.selectList("selectNoticeByPageNo", page);
    }
}
