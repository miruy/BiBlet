package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.service.BookShelfService;
import com.yurim.www.service.MainService;
import com.yurim.www.vo.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AppraisalController {

    private final AppraisalService appraisalService;
    private final BookShelfService bookShelfService;
    private final MainService mainService;

    /**
     * 도서 상세보기 - 해당 도서의 대한 모든 평가 추출
     */
    @GetMapping("/read/{isbn}")
    public String detail(RequestLogin requestLogin, Model model, HttpSession session,
                         HttpServletResponse response, @RequestParam(required = false) String query,
                         @PathVariable String isbn) {

        BookShelfDTO bookShelf = new BookShelfDTO();

        // 해당 도서의 대한 평가 개수
        int commentCount = appraisalService.commentCount(isbn);

        // 해당 도서의 대한 모든 평가
        List<AppraisalDTO> commentsByMembers = appraisalService.findAllComment(isbn);

        // 해당 도서의 대한 모든 별점(회원 코멘트에 묶어 표시)
        List<AppraisalDTO> starByMembers = appraisalService.findAllStar(isbn);

        // 해당 도서의 대한 별점평균
        Integer starAVG = appraisalService.starAVG(isbn);
        if (starAVG == null) {
            starAVG = 0;
        }

        // 해당 도서의 대해 별점평가를 한 회원 수
        Long starCount = appraisalService.starCount(isbn);

        model.addAttribute("query", query);
        model.addAttribute("isbn", isbn);
        model.addAttribute("commentCount", commentCount);
        model.addAttribute("commentsByMembers", commentsByMembers);
        model.addAttribute("starAVG", starAVG);
        model.addAttribute("starCount", starCount);
        model.addAttribute("starByMembers", starByMembers);

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        //회원 로그인 시
        if (authInfo != null) {

            Long userNo = authInfo.getUserNo();

            // 회원이 평가한 별점 뿌리기
            Integer userStar = appraisalService.userStar(userNo, isbn);

            if (userStar == null) {
                userStar = 0;

                model.addAttribute("userStar", userStar);

            } else if (userStar != null) {
                String userStarMsg = null;
                if (userStar == 1) {
                    userStarMsg = "싫어요";
                } else if (userStar == 2) {
                    userStarMsg = "재미없어요";
                } else if (userStar == 3) {
                    userStarMsg = "보통이에요";
                } else if (userStar == 4) {
                    userStarMsg = "재미있어요";
                } else if (userStar == 5) {
                    userStarMsg = "최고예요!";
                }

                model.addAttribute("userStar", userStar);
                model.addAttribute("userStarMsg", userStarMsg);
            }

            //회원의 읽고싶어요, 읽는 중 뿌리기
            Integer userStatus = bookShelfService.selectStatus(isbn, userNo);

            if (userStatus != null) {
                model.addAttribute("userStatus", userStatus);
            }

            //회원의 코멘트 뿌리기
            bookShelf.setUserNo(userNo);
            bookShelf.setIsbn(isbn);

            Long statusNo = bookShelfService.selectStatusNoForComment(bookShelf);

            if (statusNo != null) {
                List<AppraisalDTO> myComment = appraisalService.selectMyComment(bookShelf);

                model.addAttribute("myComment", myComment);
                model.addAttribute("userStatusNo", statusNo);
            }

        }

        model.addAttribute("totalCommentCount", mainService.totalCommentCount());

        return "detail";
    }

    /**
     * 평가 등록
     */
    @PostMapping("/read/{isbn}")
    private String writeComment(@ModelAttribute("requestWriteComment") RequestWriteComment requestWriteComment,
                                Errors errors, @PathVariable String isbn,
                                Model model, HttpSession session,
                                HttpServletResponse response) throws UnsupportedEncodingException {

        AppraisalDTO appraisal = new AppraisalDTO();
        BookShelfDTO bookShelf = new BookShelfDTO();

        if (errors.hasErrors()) {
            return "redirect:/";
        }

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        /**
         * Long userNo로 변환
         */
        Long userNo = authInfo.getUserNo();

        bookShelf.setUserNo(userNo);
        bookShelf.setIsbn(isbn);

        Long statusNo = bookShelfService.selectStatusNoForComment(bookShelf);


        // 별점 포함 독서상태가 없는 상태
        if (statusNo == null) {

            bookShelf.setUserNo(userNo);
            bookShelf.setIsbn(isbn);
            bookShelf.setStatus(2);
            bookShelfService.insertStatus(bookShelf);

            Long statusNo2 = bookShelfService.selectStatusNoForComment(bookShelf);

            appraisal.setComment(requestWriteComment.getComment());
            appraisal.setStartDate(requestWriteComment.getStartDate());
            appraisal.setEndDate(requestWriteComment.getEndDate());
            appraisal.setCoPrv(requestWriteComment.getCoPrv());
            appraisal.setStatusNo(statusNo2);

            appraisalService.writeComment(appraisal);

        // 해당 도서의 대한 별점만 있는 상태
        }else if(statusNo != null){
            //update
            appraisal.setComment(requestWriteComment.getComment());
            appraisal.setStartDate(requestWriteComment.getStartDate());
            appraisal.setEndDate(requestWriteComment.getEndDate());
            appraisal.setCoPrv(requestWriteComment.getCoPrv());
            appraisal.setUserNo(userNo);
            appraisal.setIsbn(isbn);
            appraisalService.updateComment(appraisal);
        }

        return "redirect:/read/" + isbn;
    }

    // 평가 수정
    @ResponseBody
    @PostMapping("/updateComment")
    private ResponseEntity updateComment(@RequestBody RequestUpdateComment requestUpdateComment, Errors errors,
                                         HttpSession session, HttpServletResponse response) {

        AppraisalDTO appraisal = new AppraisalDTO();

        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        /**
         * Long userNo로 변환
         */
        Long userNo = authInfo.getUserNo();

        appraisal.setComment(requestUpdateComment.getComment());
        appraisal.setStartDate(requestUpdateComment.getStartDate());
        appraisal.setEndDate(requestUpdateComment.getEndDate());
        appraisal.setCoPrv(requestUpdateComment.getCoPrv());

        appraisal.setIsbn(requestUpdateComment.getIsbn());
        appraisal.setUserNo(userNo);

        appraisalService.updateComment(appraisal);

        return ResponseEntity.ok("코멘트 수정 성공");
    }

    //kakao로그인 시 id 대신 name 가져오기
    @ResponseBody
    @PostMapping("/requestKakaoName")
    private ResponseEntity requestKakaoName(@RequestBody RequestKakaoLogin requestKakaoLogin, Errors errors,
                                            HttpSession session, HttpServletResponse response) {
        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        String kakaoName = appraisalService.selectKakaoNameById(requestKakaoLogin.getId());

        return ResponseEntity.ok(kakaoName);
    }

    //평가 삭제
    @ResponseBody
    @PostMapping("/deleteComment")
    private ResponseEntity deleteComment(@RequestBody RequestDeleteComment requestDeleteComment, Errors errors,
                                         HttpSession session, HttpServletResponse response) {

        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        /**
         * Long userNo로 변환
         */
        Long userNo = authInfo.getUserNo();

        appraisalService.deleteComment(userNo, requestDeleteComment.getIsbn());

        return ResponseEntity.ok("코멘트 삭제 성공");
    }

}
