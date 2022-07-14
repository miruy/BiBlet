package com.yurim.www.repository;


import com.yurim.www.dto.NoticeDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class NoticeDAOImpl implements NoticeDAO {

    private final SqlSessionTemplate sqlSessionTemplate;

    @Override
    public Long selectAllNoticeCount(){
        return sqlSessionTemplate.selectOne("selectAllNoticeCount");
    }

    @Override
    public List<NoticeDTO> selectNoticeByPageNo(Long page){
        return sqlSessionTemplate.selectList("selectNoticeByPageNo", page);
    }

    @Override
    public void updateReadCount(Long noticeNo){
       sqlSessionTemplate.update("updateReadCount", noticeNo);
    }

    @Override
    public List<NoticeDTO> selectNoticeDetail(Long noticeNo){
        return sqlSessionTemplate.selectList("selectNoticeDetail", noticeNo);
    }

    @Override
    public List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice){
        return sqlSessionTemplate.selectList("selectNoticeBySearchValue", notice);
    }

    @Override
    public Long totalNoticeCountBySearchValue(NoticeDTO notice){
        return sqlSessionTemplate.selectOne("totalNoticeCountBySearchValue", notice);
    }

    @Override
    public void insertNoticeWithFile(NoticeDTO notice){
        sqlSessionTemplate.insert("insertNoticeWithFile", notice);
    }

    @Override
    public void insertNotice(NoticeDTO notice){
        sqlSessionTemplate.insert("insertNotice", notice);
    }
}
