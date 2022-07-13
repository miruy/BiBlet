package com.yurim.www.repository;


import com.yurim.www.dto.NoticeDTO;

import java.util.List;

public interface NoticeDAO {
    Long selectAllNoticeCount();
    List<NoticeDTO> selectNoticeByPageNo(Long page);
    List<NoticeDTO> selectNoticeDetail(Long noticeNo);
    void updateReadCount(Long noticeNo);
    List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice);
    Long totalNoticeCountBySearchValue(NoticeDTO notice);
}
