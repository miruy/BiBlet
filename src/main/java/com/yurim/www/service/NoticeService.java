package com.yurim.www.service;


import com.yurim.www.dto.NoticeDTO;

import java.util.List;

public interface NoticeService {
    Long selectAllNoticeCount();
    List<NoticeDTO> selectNoticeByPageNo(Long page);
    List<NoticeDTO> selectNoticeDetail(Long noticeNo);
    List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice);
    Long totalNoticeCountBySearchValue(NoticeDTO notice);
}
