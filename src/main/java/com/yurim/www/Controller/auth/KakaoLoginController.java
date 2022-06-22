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
public class KakaoLoginController {

    private final UserService userService;
    private final MailSendService mailSendService;

    @ResponseBody
    @PostMapping("/login/kakao")
    public boolean kakaoLogin(@Valid @RequestBody RequestKakaoLogin requestKakaoLogin, HttpSession session, HttpServletResponse response) throws Exception {

        UserDTO kakaoUser = new UserDTO();
        UserDTO authInfo = null;

        if (session != null && session.getAttribute("authInfo") != null) {
            return false;
        }

        kakaoUser.setName(requestKakaoLogin.getName());
        kakaoUser.setId("kakao" + requestKakaoLogin.getId());
        kakaoUser.setPass(UUID.randomUUID().toString().replaceAll("-", ""));

        String subKakaoStoredPic = requestKakaoLogin.getThumbnailImage().substring(7);
        System.out.println("subKakaoStoredPic : " + subKakaoStoredPic);

        kakaoUser.setStoredPic(subKakaoStoredPic);
        kakaoUser.setAuthStatus(1);
        kakaoUser.setAuthKey(UUID.randomUUID().toString().replaceAll("-", ""));
        kakaoUser.setEmail(UUID.randomUUID().toString().replaceAll("-", ""));

        authInfo = userService.kakaoAuthenticate(kakaoUser);

        if (authInfo == null) {
            userService.userSignup(kakaoUser);

            authInfo = userService.kakaoAuthenticate(kakaoUser);
        }

        session.setAttribute("authInfo", authInfo);

        return true;

    }

}
