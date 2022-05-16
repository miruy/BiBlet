package com.yurim.www.authController;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AuthstatusException;
import com.yurim.www.exception.IdPasswordNotMatchingException;
import com.yurim.www.service.UserService;
import com.yurim.www.vo.RequestLogin;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
public class UserLoginController {

    private final UserService userService;

    @GetMapping
    public String loginForm(RequestLogin requestLogin, HttpSession session, HttpServletRequest request,
                            @CookieValue(value = "REMEMBER", required = false) Cookie cookie) throws Exception {

        if (session != null && session.getAttribute("authInfo") != null) {
            return "redirect:/";
        }

        /**
         * 쿠키에 REMEMBER가 있다면 꺼내서 반환
         */
        if (cookie != null) {
            requestLogin.setId(cookie.getValue());
            requestLogin.setRememberId(true);
        }
        return "auth/login";
    }

    @PostMapping
    public String login(@Valid RequestLogin requestLogin, Errors errors, Model model, HttpSession session,
                        HttpServletResponse response) throws Exception {

        /**
         * 에러시 반환
         */
        if (errors.hasErrors()) {
            return "auth/login";
        }

        UserDTO authInfo = null;
        try {

            if (session != null && session.getAttribute("authInfo") != null) {
                return "redirect:/";
            }

            /**
             * 로그인 인증하고 인증 객체 반환
             */
            authInfo = userService.authenticate(requestLogin);

            /**
             * 로그인 인증된 객체 세션 테이블에 저장
             */
            session.setAttribute("authInfo", authInfo);

            /**
             * 아이디 기억하기를 클릭했다면 쿠키에 아이디 저장
             */
            Cookie rememberCookie = new Cookie("REMEMBER", null);
            rememberCookie.setMaxAge(0);
            rememberCookie.setPath("/");

            if (requestLogin.isRememberId()) {
                rememberCookie = new Cookie("REMEMBER", authInfo.getId());
                rememberCookie.setMaxAge(60 * 60 * 24 * 7);
            }

            response.addCookie(rememberCookie);

            return "redirect:/";

        } catch (IdPasswordNotMatchingException e) {
            errors.rejectValue("mem_pass", "IdPasswordNotMatching");
            return "auth/login_error";
        } catch (AuthstatusException e) {
            return "auth/email_error";
        }
    }
}
