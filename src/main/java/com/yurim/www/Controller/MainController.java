package com.yurim.www.Controller;

import com.yurim.www.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController {

    private final UserService userService;

    @GetMapping
    public String main(Errors errors, Model model, HttpSession session, HttpServletResponse response){

        if (errors.hasErrors()) {
            return "auth/login";
        }

        model.addAttribute("popularList", mainService.popularList());
        model.addAttribute("latestList", mainService.latestComment());
        model.addAttribute("allCommentCount", mainService.allCommentCount());

        if (session == null || session.getAttribute("authInfo") == null) {
            return "common/main";
        } else {

            MemberVO authInfo = (MemberVO) session.getAttribute("authInfo");

            Long mem_num = authInfo.getMem_num();

            session.setAttribute("myID", authInfo.getMem_id());

            model.addAttribute("myCommentCount", mainService.memCommentCount(mem_num));
            model.addAttribute("myBookInfo", mainService.myBookInfo(mem_num));

            return "common/main";
        }

        return "main";
    }

    @GetMapping("/search")
    public String search(@RequestParam(defaultValue = "") String query, Model model) {
        model.addAttribute("query", query);
        return "search";
    }
}
