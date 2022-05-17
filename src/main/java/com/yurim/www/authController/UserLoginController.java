package com.yurim.www.authController;

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
            UserDTO userDTO = new UserDTO();
            userDTO.setUserNo(requestLogin.getUserNo());
            userDTO.setId(requestLogin.getId());
            userDTO.setPass(requestLogin.getPass());
            userDTO.setName(requestLogin.getName());
            userDTO.setAuthStatus(requestLogin.getAuthStatus());

            authInfo = userService.authenticate(userDTO);

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
            errors.rejectValue("pass", "IdPasswordNotMatching");
            return "error/login_error";
        } catch (AuthstatusException e) {
            return "error/email_error";
        }
    }

    @ResponseBody
    @PostMapping("/kakao")
    public boolean kakaoLogin(@Valid @RequestBody RequestKakaoLogin requestKakaoLogin, Errors errors,
                              Model model, HttpSession session, HttpServletResponse response) throws Exception {

        UserDTO signupUser =new UserDTO();
        signupUser.setName(requestKakaoLogin.getName());
        signupUser.setId("kakao" + requestKakaoLogin.getId());
        signupUser.setPass(UUID.randomUUID().toString().replaceAll("-", ""));
        signupUser.setStoredPic(requestKakaoLogin.getThumbnailImage());
        signupUser.setAuthStatus(1);
        signupUser.setAuthKey(UUID.randomUUID().toString().replaceAll("-", ""));
        signupUser.setEmail(UUID.randomUUID().toString().replaceAll("-", ""));

        userService.userSignup(signupUser);

        UserDTO authInfo = null;

        authInfo = userService.authenticate(signupUser);

        if (session != null && session.getAttribute("authInfo") != null) {
            return false;
        }

        /**
         * 로그인 인증된 객체 세션 테이블에 저장
         */
        session.setAttribute("authInfo", authInfo);

        return true;
    }
}
