package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.service.BookShelService;
import com.yurim.www.service.UserService;
import com.yurim.www.vo.RequestLogin;
import com.yurim.www.vo.RequestWriteComment;
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
    private final BookShelService bookShelService;

    /**
     * 도서 상세보기 - 해당 도서의 대한 모든 평가 추출
     */
    @GetMapping("/read/{isbn}")
    public String detail(RequestLogin requestLogin, Model model, HttpSession session,
                                       HttpServletResponse response, @RequestParam(required = false) String query,
                                       @PathVariable String isbn) {

        // 해당 도서의 대한 평가 개수
        int commentCount = appraisalService.commentCount(isbn);

        // 해당 도서의 대한 모든 평가
        List<AppraisalDTO> commentsByMembers = appraisalService.findAllComment(isbn);

        // 해당 도서의 대한 별점평균
        Integer starAVG = appraisalService.starAVG(isbn);
        if(starAVG == null){
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

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if(authInfo != null){

            Long userNo = authInfo.getUserNo();
            Integer userStar = appraisalService.userStar(userNo, isbn);

            if(userStar == null){
                userStar = 0;

                model.addAttribute("userStar", userStar);

            }else if(userStar != null){
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

                // 뷰에서 세션에 담긴 로그인 객체 사용하기 위함 (JSTL태그를 이용하여 SessionScope.id로 사용가능)
//                session.setAttribute("id", authInfo.getId());

                model.addAttribute("userStar", userStar);
                model.addAttribute("userStarMsg", userStarMsg);
            }
        }

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

        Long statusNo = bookShelService.selectStatusNo(bookShelf);

        appraisal.setComment(requestWriteComment.getComment());
        appraisal.setStartDate(requestWriteComment.getStartDate());
        appraisal.setEndDate(requestWriteComment.getEndDate());
        appraisal.setCoPrv(requestWriteComment.getCoPrv());
        appraisal.setStatusNo(statusNo);

        appraisalService.writeComment(appraisal);

        return "redirect:/read/" + isbn;
    }
}
