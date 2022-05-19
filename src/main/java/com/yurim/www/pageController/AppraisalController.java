package com.yurim.www.pageController;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.vo.RequestCommentForDetail;
import com.yurim.www.vo.RequestLogin;
import com.yurim.www.vo.RequestWriteComment;
import lombok.RequiredArgsConstructor;
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

    /**
     * 도서 상세보기 - 해당 도서의 대한 모든 평가 추출
     */
    @GetMapping("/read/{isbn}")
    public String bookDetailAndComment(RequestLogin requestLogin, Model model, HttpSession session,
                                       HttpServletResponse response, Errors errors, @RequestParam(required = false) String query,
                                       @PathVariable String isbn) {

        // 해당 도서의 대한 평가 개수
        int commentCount = appraisalService.commentCount(isbn);

        // 해당 도서의 대한 모든 평가 불러오기
        List<AppraisalDTO> commentsByMembers = appraisalService.findAllComment(isbn);

        model.addAttribute("query", query);
        model.addAttribute("isbn", isbn);
        model.addAttribute("commentCount", commentCount);
        model.addAttribute("commentsByMembers", commentsByMembers);

        return "detail";
    }

    /**
     * 평가 등록
     */
    @PostMapping("/read/{isbn}")
    private String writeComment(@ModelAttribute("requestWriteComment") RequestWriteComment requestWriteComment,
                                RequestLogin requestLogin, Model model, HttpSession session,
                                HttpServletResponse response, Errors errors) throws UnsupportedEncodingException {

        AppraisalDTO appraisal = new AppraisalDTO();
        BookShelfDTO bookShelf = new BookShelfDTO();

        /**
         * 에러시 반환
         */
        if (errors.hasErrors()) {
            return "detail";
        }

        /**
         * session에서 데이터를 꺼내 UserDTO객체에 저장
         */
        if (session == null || session.getAttribute("authInfo") == null) {
            return "redirect:/login";
        }

        UserDTO authInfo = (UserDTO) session.getAttribute("authInfo");

        /**
         * Long userNo로 변환
         */
        Long userNo = authInfo.getUserNo();

        bookShelf.setStatus(requestWriteComment.getOption());
        bookShelf.setUserNo(userNo);
        bookShelf.setIsbn(requestWriteComment.getIsbn());

        bookShelf = appraisalService.insertStatus(bookShelf);

        appraisal.setStar(requestWriteComment.getStar());
        appraisal.setComment(requestWriteComment.getComment());
        appraisal.setStartDate(requestWriteComment.getStardDate());
        appraisal.setEndDate(requestWriteComment.getEndDate());
        appraisal.setCoPrv(requestWriteComment.getCoPrv());
        appraisal.setStatusNo(bookShelf.getStatusNo());

        appraisalService.writeComment(appraisal);

        return "redirect:/read/" + requestWriteComment.getIsbn();
    }
}
