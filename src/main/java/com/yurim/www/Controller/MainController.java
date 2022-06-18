package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.service.MainService;
import com.yurim.www.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController {
    private final MainService mainService;

    @GetMapping
    public String main(Model model, HttpSession session) {

        // 별점 평균 순 (인기 도서 TOP10)
        model.addAttribute("popularList", mainService.popularList());

        // 읽고싶어요 순 (이런 책은 어떠세요?)
        model.addAttribute("recommendList", mainService.recommendList());

        // 최근 코멘트 순 (최근 코멘트)
        model.addAttribute("latestComments",  mainService.latestComments());

        // 총 코멘트 수(footer)
        model.addAttribute("totalCommentCount", mainService.totalCommentCount());


        //회원 로그인 시
        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        if (authInfo != null) {

            Long userNo = authInfo.getUserNo();

            if(authInfo.getId().substring(0,5).equals("kakao")){
                model.addAttribute("myID", authInfo.getName());
            }else {
                model.addAttribute("myID", authInfo.getId());
            }

            model.addAttribute("myCommentCount", mainService.userCommentCount(userNo));
            model.addAttribute("myStarCount", mainService.userStarCount(userNo));
            model.addAttribute("wantReadList", mainService.wantReadList(userNo));
            model.addAttribute("readingList", mainService.readingList(userNo));

            return "main";
        }


        return "main";
    }

    @GetMapping("/search")
    public String search(@RequestParam(defaultValue = "") String query, Model model) {
        model.addAttribute("query", query);
        return "search";
    }


}
