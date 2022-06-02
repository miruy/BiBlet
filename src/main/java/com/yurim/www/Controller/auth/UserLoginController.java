package com.yurim.www.Controller.auth;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AuthstatusException;
import com.yurim.www.exception.IdPasswordNotMatchingException;
import com.yurim.www.service.MailSendService;
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
public class UserLoginController {

    private final UserService userService;
    private final MailSendService mailSendService;

    @GetMapping("/login")
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

    @PostMapping("/login")
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
             * requestLogin 객체를 userDTO객체로 저장
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

    /**
     * 아이디 찾기(회원)
     */
    @GetMapping("/findId")
    public String findIdForm() {
        return "user/findId";
    }

    @PostMapping("/findId")
    public String findId(UserDTO userDTO, Model model, String email, String pass) throws Exception {

        if (email.equals("") || pass.equals("")) {
            return "error/required_error";
        }

        String foundId = userService.findIdByEmail(email, pass);

        if (foundId == null) {
            return "error/findId_error";
        }

        model.addAttribute("foundId", foundId);
        return "user/foundId";

    }

    /**
     * 비밀번호 찾기(회원)
     */
    @GetMapping("/findPass")
    public String findPassForm() {
        return "user/findPass";
    }

    @PostMapping("/findPass")
    public String findPass(UserDTO userDTO, Model model, String email, String id) throws Exception {

        if (email.equals("") || id.equals("")) {
            return "error/required_error";
        }

        boolean user = mailSendService.sendAuthMailForFindPass(email, id);

        if (user == false) {
            return "error/findPass_error";
        }
        return "user/foundPass";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
