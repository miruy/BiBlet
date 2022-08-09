package com.yurim.www.Controller;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AlreadyExistEmailException;
import com.yurim.www.exception.AlreadyExistIdException;
import com.yurim.www.exception.RequiredException;
import com.yurim.www.service.AdministratorService;
import com.yurim.www.service.NoticeService;
import com.yurim.www.vo.RequestAdmSearch;
import com.yurim.www.vo.RequestNoticeSearch;
import com.yurim.www.vo.RequestPageChange;
import com.yurim.www.vo.RequestWriteNotice;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Logger;

@Controller
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeService noticeService;

    //공지사항
    @GetMapping("/notice")
    public String notice(Model model) {
        //전체 공지사항 수
        model.addAttribute("noticeCount", noticeService.selectAllNoticeCount());
        return "notice";
    }

    //페이지 변경
    @ResponseBody
    @PostMapping("/notice")
    public Map<String, Object> pageChange(@RequestBody RequestPageChange requestPageChange) {

        Map<String, Object> result = new HashMap<>();

        NoticeDTO page = new NoticeDTO();
        page.setPage(requestPageChange.getPage());

        List<NoticeDTO> noticeList = noticeService.selectNoticeByPageNo(page);
        result.put("noticeList", noticeList);

        return result;
    }

    //공지사항 검색
    @PostMapping("/notice_search")
    private String noticeSearch(@ModelAttribute("requestNoticeSearch") RequestNoticeSearch requestNoticeSearch, Model model) {
        NoticeDTO searchNotice = new NoticeDTO();
        if (requestNoticeSearch.getOption() == null) {
            searchNotice.setOption("선택");
            searchNotice.setKeyword(requestNoticeSearch.getKeyword());
        } else {
            searchNotice.setOption(requestNoticeSearch.getOption());
            searchNotice.setKeyword(requestNoticeSearch.getKeyword());
        }
        model.addAttribute("searchNoticeList", noticeService.selectNoticeBySearchValue(searchNotice));
        model.addAttribute("searchNoticeCount", noticeService.totalNoticeCountBySearchValue(searchNotice));
        return "notice_search";
    }

    //공지사항 세부내용
    @GetMapping("/notice_{noticeNo}")
    public String noticeDetail(Model model, HttpSession session, @PathVariable Long noticeNo) {
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        //회원 로그인 시
        if (authInfo != null) {
            model.addAttribute("noticeDetail", noticeService.selectNoticeDetail(noticeNo));
        } else if (authInfo == null) {
            return "redirect:/login";
        }
        return "notice_detail";
    }

    //첨부파일 다운로드
    @RequestMapping("/file_download")
    public void fileDownload(@RequestParam String storedFile, HttpServletResponse response) {
        noticeService.fileDownload(storedFile, response);
    }

    //첨부파일 업로드
    @RequestMapping(value = "/ckImageUpload", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        try {
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "/Users/kim-yurim/Desktop/workspace/www/src/main/webapp/ckImage/";
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);

            //해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); //폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); //outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/ckImgSubmit?uid=" + uid + "&fileName=" + fileName;  //작성화면

            //업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }

    //공지사항 게시물에 이미지 등록(CK Editor)
    @RequestMapping(value = "/ckImgSubmit")
    public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
                         HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //서버에 저장된 이미지 경로
        String path = "/Users/kim-yurim/Desktop/workspace/www/src/main/webapp/ckImage/";
        String sDirPath = path + uid + "_" + fileName;
        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            fileInputStream = new FileInputStream(imgFile);
            outputStream = new ByteArrayOutputStream();
            out = response.getOutputStream();

            while ((readByte = fileInputStream.read(buf)) != -1) {
                outputStream.write(buf, 0, readByte);
            }

            imgBuf = outputStream.toByteArray();
            length = imgBuf.length;
            out.write(imgBuf, 0, length);
            out.flush();
        }
    }
}
