package com.yurim.www.Controller;

import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.NoticeService;
import com.yurim.www.vo.RequestAdmSearch;
import com.yurim.www.vo.RequestNoticeSearch;
import com.yurim.www.vo.RequestPageChange;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeService noticeService;

    @GetMapping("/notice")
    public String notice(Model model) {

        // 전체 공지사항
        Long defaultPage = (long)1;
        model.addAttribute("noticeList", noticeService.selectNoticeByPageNo(defaultPage));


        // 전체 공지사항 수
        model.addAttribute("noticeCount", noticeService.selectAllNoticeCount());

        return "notice";
    }

    @PostMapping("/notice")
    public String pageChange(@ModelAttribute("requestPageChange") RequestPageChange requestPageChange, Model model) {

        model.addAttribute("noticeList", noticeService.selectNoticeByPageNo(requestPageChange.getPage()));

        return "notice";
    }

    @PostMapping("/notice_search")
    private String noticeSearch(@ModelAttribute("requestNoticeSearch") RequestNoticeSearch requestNoticeSearch, Model model){
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


    @GetMapping("/notice_{noticeNo}")
    public String noticeDetail(Model model, HttpSession session, @PathVariable Long noticeNo){

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        //회원 로그인 시
        if(authInfo != null){

        model.addAttribute("noticeDetail",  noticeService.selectNoticeDetail(noticeNo));

        } else if(authInfo == null) {
            return "redirect:/login";
        }

        return "notice_detail";
    }



}
