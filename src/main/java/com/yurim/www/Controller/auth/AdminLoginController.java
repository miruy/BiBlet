package com.yurim.www.Controller.auth;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.exception.*;
import com.yurim.www.service.AdministratorService;
import com.yurim.www.vo.RequestAdmLogin;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * 관리자 회원가입 컨트롤러
 */
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminLoginController {

    private final AdministratorService administratorService;

    @GetMapping("/login")
    public String adminLoginForm(@ModelAttribute("requestAdmLogin") RequestAdmLogin requestAdmLogin) {
        return "auth/adminLogin";
    }

    @PostMapping("/login")
    public String adminSignup(@ModelAttribute("requestAdmLogin") @Valid RequestAdmLogin requestAdmLogin, Errors errors, HttpSession session,
                              HttpServletResponse response) throws Exception {
        AdministratorDTO admin = new AdministratorDTO();

        if(errors.hasErrors()) {
            return "auth/adminLogin";
        }

        AdministratorDTO admAuthInfo = null;
        try {

            if (session != null && session.getAttribute("admAuthInfo") != null) {
                return "supervise";
            }

            /**
             * 관리자 인증
             */
            admin.setAdmId(requestAdmLogin.getAdmId());
            admin.setAdmPass(requestAdmLogin.getAdmPass());

            admAuthInfo = administratorService.adminAuthenticate(admin);

            session.setAttribute("admAuthInfo", admAuthInfo);


            return "supervise";
        } catch (IdPasswordNotMatchingException e) {
            errors.rejectValue("commonError", "IdPasswordNotMatching");
            return "auth/adminLogin";
        } catch (AuthstatusException e) {
            return "auth/adminLogin";
        }
    }
}
