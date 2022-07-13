package com.yurim.www.service;


import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.repository.NoticeDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{

    private final NoticeDAO noticeDAO;

    @Override
    public List<NoticeDTO> selectAllNotice(){
        return noticeDAO.selectAllNotice();
    }

    @Override
    public Long selectAllNoticeCount(){
        return noticeDAO.selectAllNoticeCount();
    }

    @Override
    public List<NoticeDTO> selectNoticeByPageNo(Long page){
        return noticeDAO.selectNoticeByPageNo(page);
    }

    @Override
    public List<NoticeDTO> selectNoticeDetail(Long noticeNo){
        noticeDAO.updateReadCount(noticeNo);
        return noticeDAO.selectNoticeDetail(noticeNo);
    }

}
