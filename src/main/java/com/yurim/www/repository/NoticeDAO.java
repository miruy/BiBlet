package com.yurim.www.repository;


import com.yurim.www.dto.NoticeDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface NoticeDAO {
    Long selectAllNoticeCount();
    List<NoticeDTO> selectNoticeByPageNo(Long page);
    List<NoticeDTO> selectNoticeDetail(Long noticeNo);
    void updateReadCount(Long noticeNo);
    List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice);
    Long totalNoticeCountBySearchValue(NoticeDTO notice);
    void insertNoticeWithFile(NoticeDTO notice);
    void insertNotice(NoticeDTO notice);
    void updateNoticeWithFile(NoticeDTO notice);
    void updateNotice(NoticeDTO notice);
}
