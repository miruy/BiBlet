package com.yurim.www.service;


import com.yurim.www.dto.NoticeDTO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface NoticeService {
    Long selectAllNoticeCount();
    List<NoticeDTO> selectNoticeByPageNo(NoticeDTO page);
    List<NoticeDTO> selectNoticeDetail(Long noticeNo);
    List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice);
    Long totalNoticeCountBySearchValue(NoticeDTO notice);
    void insertNoticeWithFile(NoticeDTO notice, MultipartFile multipartFile) throws IOException;
    void insertNotice(NoticeDTO notice);
    void fileDownload(String storedFile, HttpServletResponse response);
    void updateNoticeWithFile(NoticeDTO notice, MultipartFile multipartFile) throws IOException;
    void updateNotice(NoticeDTO notice);
}
