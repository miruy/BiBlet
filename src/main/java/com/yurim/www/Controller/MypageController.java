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

    //마이페이지
    @GetMapping("/mypage")
    public String memberInfo(Model model, HttpSession session) {


        //회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if(authInfo == null){
            return "redirect:/";
        }
        //마이페이지에 보여주기
        else if (authInfo != null) {
            Long userNo = authInfo.getUserNo();

            //나의 코멘트
            model.addAttribute("myComments", mypageService.myCommentForMypage(userNo));

            //나의 평가 미리보기 6개
            model.addAttribute("myEvaluateList", mypageService.myEvaluateList(userNo));

            //읽고싶어요 미리보기 6개
            model.addAttribute("wantReadListForMypage", mypageService.wantReadListForMypage(userNo));

            //읽는 중 미리보기 6개
            model.addAttribute("readingListForMypage", mypageService.readingListForMypage(userNo));

            //footer
            model.addAttribute("totalCommentCount", mainService.totalCommentCount());

            //회원정보(모달)
            model.addAttribute("myInfo", userService.selectUserInfoByUserNo(userNo));
        }
        return "mypage";
    }

    //읽고싶어요 조회
    @GetMapping("/wantRead")
    public String wantRead(Model model, HttpSession session) {

        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if(authInfo == null){
            return "redirect:/";
        }

        else if (authInfo != null) {
            Long userNo = authInfo.getUserNo();
            model.addAttribute("wantRead", mypageService.wantRead(userNo));

            //footer
            model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        }
        return "wantRead";
    }

    //읽는 중 조회
    @GetMapping("/reading")
    public String reading(Model model, HttpSession session) {
        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if(authInfo == null){
            return "redirect:/";
        }

        else if (authInfo != null) {
            Long userNo = authInfo.getUserNo();
            model.addAttribute("reading", mypageService.reading(userNo));

            //footer
            model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        }
        return "reading";
    }

    //나의 코멘트 조회
    @GetMapping("/myComment")
    public String myComment(Model model, HttpSession session) {
        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if(authInfo == null){
            return "redirect:/";
        }

        else if (authInfo != null) {
            Long userNo = authInfo.getUserNo();
            model.addAttribute("mypage_3", mypageService.myCommentForMypage(userNo));

            //footer
            model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        }
        return "myComment";
    }

    //나의 평점 조회
    @GetMapping("/myEvaluate")
    public String myEvaluate(Model model, HttpSession session) {
        // 회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if(authInfo == null){
            return "redirect:/";
        }

        else if (authInfo != null) {
            Long userNo = authInfo.getUserNo();
            model.addAttribute("mypage_4", mypageService.mypage_4(userNo));

            //footer
            model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        }
        return "myEvaluate";
    }

    //회원 정보 수정 폼
    @GetMapping("/edit")
    public String modifyUserInfoForm(@ModelAttribute("requestUpdateUserInfo") RequestUpdateUserInfo requestUpdateUserInfo,
                                     Model model, HttpSession session, HttpServletResponse response) {
        //회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if(authInfo == null){
            return "redirect:/";
        }

        else if (authInfo != null) {
            Long userNo = authInfo.getUserNo();
            session.setAttribute("authInfo", authInfo);
            model.addAttribute("myInfo2", userService.selectUserInfoByUserNo(userNo));
            model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        }
        return "edit";
    }

    //회원 정보 수정
    @PostMapping("/edit")
    public String modifyUserInfo(@ModelAttribute("requestUpdateUserInfo") @Valid RequestUpdateUserInfo requestUpdateUserInfo, Errors errors,
                                 HttpSession session, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
        //회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        Long userNo = authInfo.getUserNo();

        MultipartFile multipartFile = requestUpdateUserInfo.getFile();

        requestUpdateUserInfo.setUserNo(userNo);
        mypageService.updateUserInfo(requestUpdateUserInfo, multipartFile, request);

        return "redirect:/mypage";
    }

    //회원 탈퇴 폼
    @GetMapping("/withdraw")
    public String withdrawUserInfoForm(@ModelAttribute("requestUpdateUserInfo") RequestUpdateUserInfo requestUpdateUserInfo, Model model,
                                       HttpSession session, HttpServletResponse response) {
        //회원 정보 불러오기
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if(authInfo == null){
            return "redirect:/";
        }

        else {
            Long userNo = authInfo.getUserNo();

            UserDTO user = userService.selectUserInfoByUserNo(userNo);
            model.addAttribute("userInfo", user);
            model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        }
        return "withdraw";
    }

    //회원 탈퇴
	@ResponseBody
	@PostMapping("/withdrawUserInfo")
	public void infoDelete(@RequestBody RequestUpdateUserInfo requestUpdateUserInfo, HttpSession session) {

        mypageService.deleteBookshelf(requestUpdateUserInfo.getUserNo());

		Integer result = mypageService.deleteUserAppraisal(requestUpdateUserInfo.getUserNo());

        if(result != null){
            mypageService.deleteUserInfo(requestUpdateUserInfo.getUserNo());
        }else if(result ==  null){
            System.out.println("result null");
        }

        // 회원 세션 정보 삭제
        session.removeAttribute("authInfo");
    }

    //비밀번호 확인(회원정보 수정, 회원탈퇴)
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

    //기본프로필로 변경
    @ResponseBody
    @PostMapping("/changedDefaultProfile")
    public ResponseEntity changedDefaultProfile(@RequestBody RequestUpdateUserInfo requestUpdateUserInfo){
        mypageService.changedDefaultProfile(requestUpdateUserInfo.getUserNo());
        return ResponseEntity.ok(1);
    }
}
