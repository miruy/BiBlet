package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AlreadyExistEmailException;
import com.yurim.www.exception.AlreadyExistIdException;
import com.yurim.www.service.BookShelfService;
import com.yurim.www.service.MainService;
import com.yurim.www.service.MypageService;
import com.yurim.www.service.UserService;
import com.yurim.www.vo.RequestLogin;
import com.yurim.www.vo.RequestSignup;
import com.yurim.www.vo.RequestUpdateUserInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor // @Autowried
public class MypageController {

    private final UserService userService;
    private final MainService mainService;
    private final MypageService mypageService;

    /**
     * 회원 정보 조회
     */
    @GetMapping("/mypage")
    public String memberInfo(Model model,
                             HttpSession session, HttpServletResponse response) {

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        // 마이페이지에 보여주기
        if (authInfo != null) {

            Long userNo = authInfo.getUserNo();

            // 나의 코멘트
            model.addAttribute("myComments", mypageService.myCommentForMypage(userNo));

            // 나의 평가
            model.addAttribute("myEvaluateList", mypageService.myEvaluateList(userNo));

            // 읽고싶어요, 읽는 중, footer
            model.addAttribute("wantReadList", mainService.wantReadList(userNo));
            model.addAttribute("readingList", mainService.readingList(userNo));
            model.addAttribute("totalCommentCount", mainService.totalCommentCount());

            // 회원정보(모달)
            model.addAttribute("myInfo", userService.selectUserInfoByUserNo(userNo));

        }


        return "mypage";
    }

    @GetMapping("/mypage_1")
    public String wantRead(Model model, HttpSession session) {

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if (authInfo != null) {

            Long userNo = authInfo.getUserNo();

            model.addAttribute("mypage_1", mypageService.mypage_1(userNo));
        }

        return "wantRead";
    }

    @GetMapping("/mypage_2")
    public String reading(Model model, HttpSession session) {

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if (authInfo != null) {

            Long userNo = authInfo.getUserNo();

            model.addAttribute("mypage_2", mypageService.mypage_2(userNo));
        }

        return "reading";
    }

    @GetMapping("/mypage_3")
    public String myComment(Model model, HttpSession session) {

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if (authInfo != null) {

            Long userNo = authInfo.getUserNo();

            model.addAttribute("mypage_3", mypageService.myCommentForMypage(userNo));
        }

        return "myComment";
    }

    @GetMapping("/mypage_4")
    public String myEvaluate(Model model, HttpSession session) {

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if (authInfo != null) {

            Long userNo = authInfo.getUserNo();

            model.addAttribute("mypage_4", mypageService.mypage_4(userNo));
        }

        return "myEvaluate";
    }

    @GetMapping("/edit")
    public String modifyUserInfoForm(@ModelAttribute("requestUpdateUserInfo") RequestUpdateUserInfo requestUpdateUserInfo, Model model, HttpSession session, HttpServletResponse response) {

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if (authInfo != null) {

            Long userNo = authInfo.getUserNo();

            session.setAttribute("authInfo", authInfo);

            model.addAttribute("myInfo2", userService.selectUserInfoByUserNo(userNo));
        }

        return "edit";
    }


    @PostMapping("/edit")
    public String modifyUserInfo(@ModelAttribute("requestUpdateUserInfo") @Valid RequestUpdateUserInfo requestUpdateUserInfo, Errors errors, HttpSession session,
                                 HttpServletRequest request, Model model) throws IllegalStateException, IOException {

        if (errors.hasErrors()) {
            return "mypage";
        }

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        Long userNo = authInfo.getUserNo();

        MultipartFile multipartFile = requestUpdateUserInfo.getFile();

        requestUpdateUserInfo.setUserNo(userNo);
        mypageService.updateUserInfo(requestUpdateUserInfo, multipartFile, request);

        return "redirect:/mypage";
    }

    @GetMapping("/withdraw")
    public String withdrawUserInfoForm(@ModelAttribute("requestUpdateUserInfo") RequestUpdateUserInfo requestUpdateUserInfo, Model model, HttpSession session,
                                       HttpServletResponse response) {

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        Long userNo = authInfo.getUserNo();

        UserDTO user = userService.selectUserInfoByUserNo(userNo);
        model.addAttribute("userInfo", user);
        model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        return "withdraw";
    }

	@ResponseBody
	@PostMapping("/withdrawUserInfo")
	public void infoDelete(@RequestBody RequestUpdateUserInfo requestUpdateUserInfo, HttpSession session) {

        mypageService.deleteBookshelf(requestUpdateUserInfo.getUserNo());
//        mypageDAO.deleteUserAppraisal(userNo);
//        mypageDAO.deleteUserInfo(userNo);

		Integer result = mypageService.deleteUserAppraisal(requestUpdateUserInfo.getUserNo());

        if(result != null){
            mypageService.deleteUserInfo(requestUpdateUserInfo.getUserNo());
        }else if(result ==  null){
            System.out.println("resulet null");
        }
        // 회원 세션 정보 삭제
        session.removeAttribute("authInfo");
    }

    @ResponseBody
    @PostMapping("/editPassCheck")
    public int PassCheck(@RequestBody RequestLogin requestLogin, HttpSession session) {
        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if (authInfo.getPass().equals(requestLogin.getPassCheck())) {
            return 1;
        } else {
            return 0;
        }

    }
    @ResponseBody
    @PostMapping("/changedDefaultProfile")
    public ResponseEntity changedDefaultProfile(@RequestBody RequestUpdateUserInfo requestUpdateUserInfo){
        mypageService.changedDefaultProfile(requestUpdateUserInfo.getUserNo());
        return ResponseEntity.ok(1);
    }

}
