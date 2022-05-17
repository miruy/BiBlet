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
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main")
public class PageController {

    private final UserService userService;

    @GetMapping
    public String mainForm() throws Exception {

        return "common/main";
    }

}
