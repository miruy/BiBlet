package com.yurim.www.pageController;

import com.yurim.www.service.AppraisalService;
import com.yurim.www.vo.RequestCommentForDetail;
import com.yurim.www.vo.RequestLogin;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        List<RequestCommentForDetail> commentsByMembers = appraisalService.findAllComment(isbn);

        model.addAttribute("query", query);
        model.addAttribute("isbn", isbn);
        model.addAttribute("commentCount", commentCount);
        model.addAttribute("commentsByMembers", commentsByMembers);

        return "detail";
    }
}
