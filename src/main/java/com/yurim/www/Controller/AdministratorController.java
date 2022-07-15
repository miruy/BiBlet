package com.yurim.www.Controller;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AlreadyExistIdException;
import com.yurim.www.exception.RequiredException;
import com.yurim.www.service.AdministratorService;
import com.yurim.www.service.MypageService;
import com.yurim.www.service.NoticeService;
import com.yurim.www.vo.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdministratorController {

    private final AdministratorService administratorService;
    private final NoticeService noticeService;

    @GetMapping("/supervise_user")
    public String userManagement(Model model, HttpSession session) {

        //관리자 로그인 시
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");


        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {
            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);

            // 회원 관리 탭
            model.addAttribute("users", administratorService.allUserInfo());
            model.addAttribute("totalUsers", administratorService.totalUser());

            model.addAttribute("admInfo", admInfo);

        }

        return "admin/supervise_user";
    }

    @PostMapping("/supervise_user")
    public String userSearch(@ModelAttribute("requestAdmSearch") RequestAdmSearch requestAdmSearch, HttpSession session, Model model) {

        UserDTO searchUser = new UserDTO();

        //관리자 로그인 시
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            if (requestAdmSearch.getOption() == null) {
                searchUser.setOption("선택");
                searchUser.setKeyword(requestAdmSearch.getKeyword());
            } else {
                searchUser.setOption(requestAdmSearch.getOption());
                searchUser.setKeyword(requestAdmSearch.getKeyword());
            }

            model.addAttribute("searchList", administratorService.selectUserBySearchValue(searchUser));
            model.addAttribute("searchUserCount", administratorService.totalCountBySearchValue(searchUser));

        }


        return "admin/search_user";

    }

    @GetMapping("/supervise_appraisal")
    public String starManagement(Model model, HttpSession session) {

        //관리자 로그인 시
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            // 평가 관리 탭
            model.addAttribute("stars", administratorService.allStarInfo());
            model.addAttribute("totalStar", administratorService.totalStar());
        }

        return "admin/supervise_appraisal";
    }


    @PostMapping("/supervise_appraisal")
    public String starSearch(@ModelAttribute("requestAdmSearch") RequestAdmSearch requestAdmSearch, HttpSession session, Model model) {

        AppraisalDTO appraisal = new AppraisalDTO();

        //관리자 로그인 시
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            if (requestAdmSearch.getReturnIsbn().equals("")) {
                if (requestAdmSearch.getOption() == null) {
                    appraisal.setOption("선택");
                    appraisal.setKeyword(requestAdmSearch.getKeyword());
                } else {
                    appraisal.setOption(requestAdmSearch.getOption());
                    appraisal.setKeyword(requestAdmSearch.getKeyword());
                }
            } else if (!requestAdmSearch.getReturnIsbn().equals("")) {
                appraisal.setOption("kakao");
                appraisal.setKeyword(requestAdmSearch.getReturnIsbn());
            }

            model.addAttribute("searchStarList", administratorService.selectStarBySearchValue(appraisal));
            model.addAttribute("searchStarCount", administratorService.totalStarCountBySearchValue(appraisal));
        }

        return "admin/search_appraisal";

    }

    @GetMapping("/supervise_comment")
    public String commentManagement(Model model, HttpSession session) {

        //관리자 세션 전달
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            // 코멘트 관리 탭
            model.addAttribute("comments", administratorService.allCommentInfo());
            model.addAttribute("totalComment", administratorService.totalComment());

        }
        return "admin/supervise_comment";
    }

    @PostMapping("/supervise_comment")
    public String commentSearch(@ModelAttribute("requestAdmSearch") RequestAdmSearch requestAdmSearch, HttpSession session, Model model) {

        AppraisalDTO appraisal = new AppraisalDTO();

        //관리자 세션 전달
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            if (requestAdmSearch.getReturnIsbn().equals("")) {
                if (requestAdmSearch.getOption() == null) {
                    appraisal.setOption("선택");
                    appraisal.setKeyword(requestAdmSearch.getKeyword());
                } else {
                    appraisal.setOption(requestAdmSearch.getOption());
                    appraisal.setKeyword(requestAdmSearch.getKeyword());
                }
            } else if (!requestAdmSearch.getReturnIsbn().equals("")) {
                appraisal.setOption("kakao");
                appraisal.setKeyword(requestAdmSearch.getReturnIsbn());
            }

            model.addAttribute("searchCommentList", administratorService.selectCommentBySearchValue(appraisal));
            model.addAttribute("searchCommentCount", administratorService.totalCommentCountBySearchValue(appraisal));
        }

        return "admin/search_comment";

    }

    @GetMapping("/supervise_notice")
    public String notice(Model model, HttpSession session) {

        //관리자 세션 전달
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            // 공지관리 탭
            model.addAttribute("allNoticeList", administratorService.selectAllNotice());
            model.addAttribute("totalNoticeCount", administratorService.totalNoticeCount());

        }

        return "admin/supervise_notice";
    }

    @PostMapping("/supervise_notice")
    private String noticeSearch(@ModelAttribute("requestNoticeSearch") RequestNoticeSearch requestNoticeSearch, HttpSession session, Model model) {
        NoticeDTO searchNotice = new NoticeDTO();

        //관리자 로그인 시
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            if (requestNoticeSearch.getOption() == null) {
                searchNotice.setOption("선택");
                searchNotice.setKeyword(requestNoticeSearch.getKeyword());
            } else {
                searchNotice.setOption(requestNoticeSearch.getOption());
                searchNotice.setKeyword(requestNoticeSearch.getKeyword());
            }

            model.addAttribute("adminPageSearchNoticeList", noticeService.selectNoticeBySearchValue(searchNotice));
            model.addAttribute("searchNoticeCount", noticeService.totalNoticeCountBySearchValue(searchNotice));
        }
        return "admin/search_notice";
    }


    @GetMapping("/notice_{noticeNo}")
    public String noticeDetail(Model model, HttpSession session, @PathVariable Long noticeNo) {

        //관리자 세션 전달
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {
            return "redirect:/admin/login";
        } else if (admAuthInfo != null) {
            model.addAttribute("adminPageNoticeDetail", noticeService.selectNoticeDetail(noticeNo));
        }

        return "admin/superviseNotice_detail";
    }


    @GetMapping("/supervise_admin")
    public String adminInfo(Model model, HttpSession session) {

        //관리자 세션 전달
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            // 관리자 정보 탭
            model.addAttribute("admins", administratorService.allAdminInfo());
            model.addAttribute("totalAdmins", administratorService.totalAdmin());

        }

        return "admin/supervise_admin";
    }

    @PostMapping("/supervise_admin")
    public String adminSearch(@ModelAttribute("requestAdmSearch") RequestAdmSearch requestAdmSearch, HttpSession session, Model model) {

        AdministratorDTO searchAdmin = new AdministratorDTO();

        //관리자 세션 전달
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);


            if (requestAdmSearch.getOption() == null) {
                searchAdmin.setOption("선택");
                searchAdmin.setKeyword(requestAdmSearch.getKeyword());
            } else {
                searchAdmin.setOption(requestAdmSearch.getOption());
                searchAdmin.setKeyword(requestAdmSearch.getKeyword());
            }

            model.addAttribute("searchAdminList", administratorService.selectAdminBySearchValue(searchAdmin));
            model.addAttribute("searchAdminCount", administratorService.totalAdminCountBySearchValue(searchAdmin));
        }


        return "admin/search_admin";

    }

    @ResponseBody
    @PostMapping("/adminPassCheck")
    public int PassCheck(@RequestBody RequestAdmLogin requestAdmLogin, HttpSession session) {
        // 관리자 정보 불러오기
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo.getAdmPass().equals(requestAdmLogin.getPassCheck())) {
            return 1;
        } else {
            return 0;
        }

    }

    @ResponseBody
    @PostMapping("/deleteUser")
    public int deleteUser(@RequestBody RequestLogin requestLogin, HttpSession session) {

        administratorService.deleteUser(requestLogin.getUserNo());

        // 회원 세션 정보 삭제
//        session.removeAttribute("authInfo");

        return 1;
    }

    @ResponseBody
    @PostMapping("/deleteAppraisal")
    public int deleteAppraisal(@RequestBody RequestCommentForDetail requestCommentForDetail, HttpSession session) {

        administratorService.deleteAppraisal(requestCommentForDetail.getAppraisalNo());

        // 회원 세션 정보 삭제
//        session.removeAttribute("authInfo");

        return 1;
    }


    @ResponseBody
    @PostMapping("/disabledComment")
    public int disabledComment(@RequestBody RequestCommentForDetail requestCommentForDetail, HttpSession session) {

        administratorService.disabledComment(requestCommentForDetail.getActive(), requestCommentForDetail.getAppraisalNo());

        // 회원 세션 정보 삭제
//        session.removeAttribute("authInfo");
        return 1;
    }

    @GetMapping("/writeNotice")
    private String writeNoticeForm(Model model, HttpSession session) {

        //관리자 세션 전달
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {
            return "redirect:/admin/login";
        } else if (admAuthInfo != null) {
            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

        }

        return "admin/writeNotice";
    }

    @PostMapping("/writeNotice")
    private String writeNotice(@ModelAttribute("requestWriteNotice") @Valid RequestWriteNotice requestWriteNotice, Errors errors) throws IOException {

        if (errors.hasErrors()) {
            return "admin/writeNotice";
        }

        try {
            NoticeDTO insertNotice = new NoticeDTO();

            if (!requestWriteNotice.getNoticeFile().isEmpty()) {

                insertNotice.setTitle(requestWriteNotice.getTitle());
                insertNotice.setContent(requestWriteNotice.getContent());
                insertNotice.setWriter("관리자");

                MultipartFile multipartFile = requestWriteNotice.getNoticeFile();

                noticeService.insertNoticeWithFile(insertNotice, multipartFile);

            } else if (requestWriteNotice.getNoticeFile().isEmpty()) {

                insertNotice.setTitle(requestWriteNotice.getTitle());
                insertNotice.setContent(requestWriteNotice.getContent());
                insertNotice.setWriter("관리자");

                noticeService.insertNotice(insertNotice);
            }

        } catch (RequiredException e) {
            errors.rejectValue("title", "required");
            errors.rejectValue("content", "required");
            return "admin/writeNotice";
        }

        return "redirect:/admin/supervise_notice";
    }


    @GetMapping("/modifyNotice_{noticeNo}")
    public String modifyNoticeForm(@PathVariable Long noticeNo, Model model, HttpSession session) {

        //관리자 세션 전달
        AdministratorDTO admAuthInfo = null;
        admAuthInfo = (AdministratorDTO) session.getAttribute("admAuthInfo");

        if (admAuthInfo == null) {

            return "redirect:/admin/login";

        } else if (admAuthInfo != null) {

            Long admNo = admAuthInfo.getAdmNo();
            AdministratorDTO admInfo = administratorService.selectAdminInfoByAdmNo(admNo);
            model.addAttribute("admInfo", admInfo);

            model.addAttribute("modifyNoticeDetail", noticeService.selectNoticeDetail(noticeNo));
        }

        return "admin/modifyNotice";
    }

    @PostMapping("/modifyNotice")
    public String modifyNotice(@ModelAttribute("requestWriteNotice") @Valid RequestWriteNotice requestWriteNotice, Errors errors, HttpSession session, Model model) throws IOException {

        System.out.println(requestWriteNotice.getNoticeNo());
        System.out.println(requestWriteNotice.getTitle());

        if (errors.hasErrors()) {
            return "admin/modifyNotice";
        }

        try {
            NoticeDTO updateNotice = new NoticeDTO();

            if (!requestWriteNotice.getNoticeFile().isEmpty()) {

                updateNotice.setTitle(requestWriteNotice.getTitle());
                updateNotice.setContent(requestWriteNotice.getContent());
                updateNotice.setNoticeNo(requestWriteNotice.getNoticeNo());

                MultipartFile multipartFile = requestWriteNotice.getNoticeFile();

                noticeService.updateNoticeWithFile(updateNotice, multipartFile);

            } else if (requestWriteNotice.getNoticeFile().isEmpty()) {

                updateNotice.setTitle(requestWriteNotice.getTitle());
                updateNotice.setContent(requestWriteNotice.getContent());
                updateNotice.setNoticeNo(requestWriteNotice.getNoticeNo());

                noticeService.updateNotice(updateNotice);
            }

        } catch (RequiredException e) {
            errors.rejectValue("title", "required");
            errors.rejectValue("content", "required");
            errors.rejectValue("contentWithFile", "required");
            return "admin/modifyNotice";
        }

        return "redirect:/admin/supervise_notice";
    }

    @ResponseBody
    @PostMapping("/updateFileToNull")
    public int updateFileToNull(@RequestBody RequestWriteNotice requestWriteNotice){
        administratorService.updateFileToNull(requestWriteNotice.getNoticeNo());
        return 1;
    }

    @ResponseBody
    @PostMapping("/deleteNotice")
    public int deleteNotice(@RequestBody RequestNoticeSearch requestNoticeSearch, HttpSession session) {

        administratorService.deleteNotice(requestNoticeSearch.getNoticeNo());

        // 회원 세션 정보 삭제
//        session.removeAttribute("authInfo");
        return 1;
    }
}
