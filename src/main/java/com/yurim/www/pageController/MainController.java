package com.yurim.www.pageController;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AuthstatusException;
import com.yurim.www.exception.IdPasswordNotMatchingException;
import com.yurim.www.service.UserService;
import com.yurim.www.vo.RequestKakaoLogin;
import com.yurim.www.vo.RequestLogin;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Enumeration;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController {

    private final UserService userService;

    @GetMapping
    public String mainForm(){
        return "common/main";
    }

    @GetMapping("/search")
    public String search(HttpSession session, HttpServletRequest request, Model model) {
        Enumeration eHeader = request.getHeaderNames();
        while (eHeader.hasMoreElements()) {
            String request_Name = (String)eHeader.nextElement();
            String request_Value = request.getHeader(request_Name);
            System.out.println("request_Name : " + request_Name + " | request_Value : " + request_Value);
        }

//        model.addAttribute("query", query);
        return "common/search";
    }
}
