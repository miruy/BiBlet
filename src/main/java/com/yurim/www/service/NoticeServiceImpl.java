package com.yurim.www.service;


import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.repository.NoticeDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{

    private final NoticeDAO noticeDAO;


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

    @Override
    public List<NoticeDTO> selectNoticeBySearchValue(NoticeDTO notice){
        return noticeDAO.selectNoticeBySearchValue(notice);
    }

    @Override
    public Long totalNoticeCountBySearchValue(NoticeDTO notice){
        return noticeDAO.totalNoticeCountBySearchValue(notice);
    }
    @Override
    public void insertNoticeWithFile(NoticeDTO notice, MultipartFile multipartFile) throws IOException {

        //공지사항 청부파일 이름 추출
        String orgimagename = multipartFile.getOriginalFilename();

        //공지사항 청부파일 확장자 추출
        String orgimagenameExtension = orgimagename.substring(orgimagename.lastIndexOf("."));

        //프로젝트 내 폴더에 첨부파일을 저장할 때 uuid값에 orgimagenameExtension(확장자)를 붙혀 저장 (= sjf743ifhrht32 + .png)
        String storedimagename = UUID.randomUUID().toString().replaceAll("-", "") + orgimagenameExtension;

        //첨부파일이 저장될 경로(서버 측)
        String savePath = "/Users/kim-yurim/Desktop/workspace/www/src/main/webapp/ckImage/";

        //파일이 저장될 경로 + 최종 파일명
        String uploadFile = savePath + storedimagename;

        //업로드요청으로 전달받은 파일을 위에서 설정한 특정 경로에 특정 파일명으로 저장
        File file = new File(uploadFile);

        multipartFile.transferTo(file);

        notice.setOriginFile(orgimagename);
        notice.setStoredFile(storedimagename);

        noticeDAO.insertNoticeWithFile(notice);
    }

    @Override
    public void insertNotice(NoticeDTO notice){
        noticeDAO.insertNotice(notice);
    }
}
