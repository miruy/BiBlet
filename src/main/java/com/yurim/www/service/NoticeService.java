package com.yurim.www.service;


import com.yurim.www.dto.NoticeDTO;

import java.util.List;

public interface NoticeService {
    List<NoticeDTO> selectAllNotice();
    Long selectAllNoticeCount();
    List<NoticeDTO> selectNoticeByPageNo(Long page);
}
