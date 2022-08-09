package com.yurim.www.service;


import com.yurim.www.dto.NoticeDTO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface NoticeService {
    Long selectAllNoticeCount();    //모든 공지사항 수
    List<NoticeDTO> selectNoticeByPageNo(NoticeDTO page);   //페이지 수에 따른 공지사항 조회
    List<NoticeDTO> selectNoticeDetail(Long noticeNo);  //공지사항 세부내용
    List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice);   //공지사항 검색
    Long totalNoticeCountBySearchValue(NoticeDTO notice);   //검색 공지사항 수
    void insertNoticeWithFile(NoticeDTO notice,
                              MultipartFile multipartFile) throws IOException;    //첨부파일 포함 공지사항 등록
    void insertNotice(NoticeDTO notice);     //첨부파일 미포함 공지사항 등록
    void fileDownload(String storedFile, HttpServletResponse response); //첨부파일 다운로드
    void updateNoticeWithFile(NoticeDTO notice, MultipartFile multipartFile) throws IOException;    //첨부파일 포함 공지사항 수정
    void updateNotice(NoticeDTO notice);     //공지사항 수정
}
