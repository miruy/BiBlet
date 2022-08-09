package com.yurim.www.repository;


import com.yurim.www.dto.NoticeDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface NoticeDAO {
    Long selectAllNoticeCount();    //모든 공지사항 수
    List<NoticeDTO> selectNoticeByPageNo(NoticeDTO page);   //페이지 수에 따른 공지사항 조회
    List<NoticeDTO> selectNoticeDetail(Long noticeNo);  //공지사항 세부내용
    void updateReadCount(Long noticeNo);    //조회수 올리기
    List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice);    //공지사항 검색
    Long totalNoticeCountBySearchValue(NoticeDTO notice);   //검색 공지사항 수
    void insertNoticeWithFile(NoticeDTO notice);    //첨부파일 포함 공지사항 등록
    void insertNotice(NoticeDTO notice);    //첨부파일 미포함 공지사항 등록
    void updateNoticeWithFile(NoticeDTO notice);    //첨부파일 수정
    void updateNotice(NoticeDTO notice);    //공지사항 수정
}
