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

    //모든 공지사항 수
    @Override
    public Long selectAllNoticeCount(){
        return sqlSessionTemplate.selectOne("selectAllNoticeCount");
    }

    //페이지 수에 따른 공지사항 조회
    @Override
    public List<NoticeDTO> selectNoticeByPageNo(NoticeDTO page){
        return sqlSessionTemplate.selectList("selectNoticeByPageNo", page);
    }

    //공지사항 세부내용
    @Override
    public List<NoticeDTO> selectNoticeDetail(Long noticeNo){
        return sqlSessionTemplate.selectList("selectNoticeDetail", noticeNo);
    }

    //조회수 올리기
    @Override
    public void updateReadCount(Long noticeNo){
       sqlSessionTemplate.update("updateReadCount", noticeNo);
    }

    //공지사항 검색
    @Override
    public List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice){
        return sqlSessionTemplate.selectList("selectNoticeBySearchValue", notice);
    }

    //검색 공지사항 수
    @Override
    public Long totalNoticeCountBySearchValue(NoticeDTO notice){
        return sqlSessionTemplate.selectOne("totalNoticeCountBySearchValue", notice);
    }

    //첨부파일 포함 공지사항 등록
    @Override
    public void insertNoticeWithFile(NoticeDTO notice){
        sqlSessionTemplate.insert("insertNoticeWithFile", notice);
    }

    //첨부파일 미포함 공지사항 등록
    @Override
    public void insertNotice(NoticeDTO notice){
        sqlSessionTemplate.insert("insertNotice", notice);
    }

    //첨부파일 수정
    @Override
    public void updateNoticeWithFile(NoticeDTO notice){
        sqlSessionTemplate.update("updateNoticeWithFile", notice);
    }

    //공지사항 수정
    @Override
    public void updateNotice(NoticeDTO notice){
        sqlSessionTemplate.update("updateNotice", notice);
    }
}
