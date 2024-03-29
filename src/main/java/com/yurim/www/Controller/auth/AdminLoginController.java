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


@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminLoginController {
    private final AdministratorService administratorService;

    //관리자 로그인 폼
    @GetMapping("/login")
    public String adminLoginForm(RequestAdmLogin requestAdmLogin, HttpSession session) {
        return "auth/adminLogin";
    }

    //관리자 로그인
    @PostMapping("/login")
    public String adminLogin(@ModelAttribute("requestAdmLogin") @Valid RequestAdmLogin requestAdmLogin, Errors errors,
                             HttpSession session) throws Exception {
        AdministratorDTO admin = new AdministratorDTO();

        if(errors.hasErrors()) {
            return "auth/adminLogin";
        }

        AdministratorDTO admAuthInfo = null;
        try {
            if (session != null && session.getAttribute("admAuthInfo") != null) {
                return "redirect:/admin/supervise_user";
            }
            //관리자 인증
            admin.setAdmId(requestAdmLogin.getAdmId());
            admin.setAdmPass(requestAdmLogin.getAdmPass());

            admAuthInfo = administratorService.adminAuthenticate(admin);

            session.setAttribute("admAuthInfo", admAuthInfo);

            return "redirect:/admin/supervise_user";
        } catch (IdPasswordNotMatchingException e) {
            errors.rejectValue("commonError", "IdPasswordNotMatching");
            return "auth/adminLogin";
        } catch (AuthstatusException e) {
            errors.rejectValue("authstatusError", "authstatusError");
            return "auth/adminLogin";
        }
    }
}
