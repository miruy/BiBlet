package com.yurim.www.Controller;

import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.NoticeService;
import com.yurim.www.vo.RequestPageChange;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

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


//    @GetMapping("/mypage_1")
//    public String wantRead(Model model, HttpSession session) {
//
//        // 회원 정보 불러오기
//        UserDTO authInfo = null;
//        authInfo = (UserDTO) session.getAttribute("authInfo");
//
//        if (authInfo != null) {
//
//            Long userNo = authInfo.getUserNo();
//
//            model.addAttribute("mypage_1", mypageService.mypage_1(userNo));
//        }
//
//        return "wantRead";
//    }
//
//    @GetMapping("/mypage_2")
//    public String reading(Model model, HttpSession session) {
//
//        // 회원 정보 불러오기
//        UserDTO authInfo = null;
//        authInfo = (UserDTO) session.getAttribute("authInfo");
//
//        if (authInfo != null) {
//
//            Long userNo = authInfo.getUserNo();
//
//            model.addAttribute("mypage_2", mypageService.mypage_2(userNo));
//        }
//
//        return "reading";
//    }
//
//    @GetMapping("/mypage_3")
//    public String myComment(Model model, HttpSession session) {
//
//        // 회원 정보 불러오기
//        UserDTO authInfo = null;
//        authInfo = (UserDTO) session.getAttribute("authInfo");
//
//        if (authInfo != null) {
//
//            Long userNo = authInfo.getUserNo();
//
//            model.addAttribute("mypage_3", mypageService.myCommentForMypage(userNo));
//        }
//
//        return "myComment";
//    }
//
//    @GetMapping("/mypage_4")
//    public String myEvaluate(Model model, HttpSession session) {
//
//        // 회원 정보 불러오기
//        UserDTO authInfo = null;
//        authInfo = (UserDTO) session.getAttribute("authInfo");
//
//        if (authInfo != null) {
//
//            Long userNo = authInfo.getUserNo();
//
//            model.addAttribute("mypage_4", mypageService.mypage_4(userNo));
//        }
//
//        return "myEvaluate";
//    }
//
//    @GetMapping("/edit")
//    public String modifyUserInfoForm(@ModelAttribute("requestUpdateUserInfo") RequestUpdateUserInfo requestUpdateUserInfo, Model model, HttpSession session, HttpServletResponse response) {
//
//        // 회원 정보 불러오기
//        UserDTO authInfo = null;
//        authInfo = (UserDTO) session.getAttribute("authInfo");
//
//        if (authInfo != null) {
//
//            Long userNo = authInfo.getUserNo();
//
//            session.setAttribute("authInfo", authInfo);
//
//            model.addAttribute("myInfo2", userService.selectUserInfoByUserNo(userNo));
//        }
//
//        return "edit";
//    }
//
//
//    @PostMapping("/edit")
//    public String modifyUserInfo(@ModelAttribute("requestUpdateUserInfo") @Valid RequestUpdateUserInfo requestUpdateUserInfo, Errors errors, HttpSession session,
//                                 HttpServletRequest request, Model model) throws IllegalStateException, IOException {
//
//        if (errors.hasErrors()) {
//            return "mypage";
//        }
//
//        // 회원 정보 불러오기
//        UserDTO authInfo = null;
//        authInfo = (UserDTO) session.getAttribute("authInfo");
//
//        Long userNo = authInfo.getUserNo();
//
//        MultipartFile multipartFile = requestUpdateUserInfo.getFile();
//
//        requestUpdateUserInfo.setUserNo(userNo);
//        mypageService.updateUserInfo(requestUpdateUserInfo, multipartFile, request);
//
//        return "redirect:/mypage";
//    }
//
//    @GetMapping("/withdraw")
//    public String withdrawUserInfoForm(@ModelAttribute("requestUpdateUserInfo") RequestUpdateUserInfo requestUpdateUserInfo, Model model, HttpSession session,
//                                       HttpServletResponse response) {
//
//        // 회원 정보 불러오기
//        UserDTO authInfo = null;
//        authInfo = (UserDTO) session.getAttribute("authInfo");
//
//        Long userNo = authInfo.getUserNo();
//
//        UserDTO user = userService.selectUserInfoByUserNo(userNo);
//        model.addAttribute("userInfo", user);
//        return "withdraw";
//    }
//
//	@ResponseBody
//	@PostMapping("/withdrawUserInfo")
//	public void infoDelete(@RequestBody RequestUpdateUserInfo requestUpdateUserInfo, HttpSession session) {
//
//		mypageService.deleteUserInfo(requestUpdateUserInfo.getUserNo());
//
//        // 회원 세션 정보 삭제
//        session.removeAttribute("authInfo");
//    }
//
//    @ResponseBody
//    @PostMapping("/editPassCheck")
//    public int PassCheck(@RequestBody RequestLogin requestLogin, HttpSession session) {
//        // 회원 정보 불러오기
//        UserDTO authInfo = null;
//        authInfo = (UserDTO) session.getAttribute("authInfo");
//
//        if (authInfo.getPass().equals(requestLogin.getPassCheck())) {
//            return 1;
//        } else {
//            return 0;
//        }
//
//    }
//    @ResponseBody
//    @PostMapping("/changedDefaultProfile")
//    public ResponseEntity changedDefaultProfile(@RequestBody RequestUpdateUserInfo requestUpdateUserInfo){
//        mypageService.changedDefaultProfile(requestUpdateUserInfo.getUserNo());
//        return ResponseEntity.ok(1);
//    }

}
