package com.yurim.www.service;


import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.repository.NoticeDAO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{

    private final NoticeDAO noticeDAO;
    private final Logger logger = LoggerFactory.getLogger(this.getClass());


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
        String savePath = "/Users/kim-yurim/Desktop/workspace/www/src/main/webapp/fileUpload/";

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


    @Override
    public void updateNoticeWithFile(NoticeDTO notice, MultipartFile multipartFile) throws IOException {

        //공지사항 청부파일 이름 추출
        String orgimagename = multipartFile.getOriginalFilename();

        //공지사항 청부파일 확장자 추출
        String orgimagenameExtension = orgimagename.substring(orgimagename.lastIndexOf("."));

        //프로젝트 내 폴더에 첨부파일을 저장할 때 uuid값에 orgimagenameExtension(확장자)를 붙혀 저장 (= sjf743ifhrht32 + .png)
        String storedimagename = UUID.randomUUID().toString().replaceAll("-", "") + orgimagenameExtension;

        //첨부파일이 저장될 경로(서버 측)
        String savePath = "/Users/kim-yurim/Desktop/workspace/www/src/main/webapp/fileUpload/";

        //파일이 저장될 경로 + 최종 파일명
        String uploadFile = savePath + storedimagename;

        //업로드요청으로 전달받은 파일을 위에서 설정한 특정 경로에 특정 파일명으로 저장
        File file = new File(uploadFile);

        multipartFile.transferTo(file);

        notice.setOriginFile(orgimagename);
        notice.setStoredFile(storedimagename);

        noticeDAO.updateNoticeWithFile(notice);
    }

    @Override
    public void updateNotice(NoticeDTO notice){
        noticeDAO.updateNoticeWithFile(notice);
    }



    @Override
    public void fileDownload(String storedFile, HttpServletResponse response){

        try {
            // 다운로드 받을 파일명을 가져온다.
            String fileName = storedFile;

            // 다운로드 경로 (내려받을 파일경로를 설정한다.)
            String filePath = "/Users/kim-yurim/Desktop/workspace/www/src/main/webapp/fileUpload/";

            // 경로와 파일명으로 파일 객체를 생성한다.
            File dFile  = new File(filePath, fileName);

            // 파일 길이를 가져온다.
            int fSize = (int) dFile.length();

            // 파일이 존재
            if (fSize > 0) {

                // 파일명을 URLEncoder 하여 attachment, Content-Disposition Header로 설정
                String encodedFilename = "attachment; filename*=" + "UTF-8" + "''" + URLEncoder.encode(fileName, "UTF-8");

                // ContentType 설정
                response.setContentType("application/octet-stream; charset=utf-8");

                // Header 설정
                response.setHeader("Content-Disposition", encodedFilename);

                // ContentLength 설정
                response.setContentLengthLong(fSize);

                BufferedInputStream in = null;
                BufferedOutputStream out = null;

				/* BufferedInputStream
				 *
					java.io의 가장 기본 파일 입출력 클래스
					입력 스트림(통로)을 생성해줌
					사용법은 간단하지만, 버퍼를 사용하지 않기 때문에 느림
					속도 문제를 해결하기 위해 버퍼를 사용하는 다른 클래스와 같이 쓰는 경우가 많음
				*/
                in = new BufferedInputStream(new FileInputStream(dFile));

				/* BufferedOutputStream
				 *
					java.io의 가장 기본이 되는 파일 입출력 클래스
					출력 스트림(통로)을 생성해줌
					사용법은 간단하지만, 버퍼를 사용하지 않기 때문에 느림
					속도 문제를 해결하기 위해 버퍼를 사용하는 다른 클래스와 같이 쓰는 경우가 많음
				*/
                out = new BufferedOutputStream(response.getOutputStream());

                try {
                    byte[] buffer = new byte[4096];
                    int bytesRead=0;

				 	/*
						모두 현재 파일 포인터 위치를 기준으로 함 (파일 포인터 앞의 내용은 없는 것처럼 작동)
						int read() : 1byte씩 내용을 읽어 정수로 반환
						int read(byte[] b) : 파일 내용을 한번에 모두 읽어서 배열에 저장
						int read(byte[] b. int off, int len) : 'len'길이만큼만 읽어서 배열의 'off'번째 위치부터 저장
				 	*/
                    while ((bytesRead = in.read(buffer))!=-1) {
                        out.write(buffer, 0, bytesRead);
                    }

                    // 버퍼에 남은 내용이 있다면, 모두 파일에 출력
                    out.flush();
                }
                finally {
					/*
						현재 열려 in,out 스트림을 닫음
						메모리 누수를 방지하고 다른 곳에서 리소스 사용이 가능하게 만듬
					*/
                    in.close();
                    out.close();
                }
            } else {
                throw new FileNotFoundException("파일이 없습니다.");
            }
        }
        catch (Exception e) {
            logger.info(e.getMessage());
        }
    }

}
