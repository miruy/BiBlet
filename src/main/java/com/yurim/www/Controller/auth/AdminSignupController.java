package com.yurim.www.Controller.auth;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.exception.AlreadyExistEmailException;
import com.yurim.www.exception.AlreadyExistIdException;
import com.yurim.www.exception.SecurityCodeNotMatchingException;
import com.yurim.www.service.AdministratorService;
import com.yurim.www.service.MailSendService;
import com.yurim.www.vo.RequestAdmSignup;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminSignupController {
    private final MailSendService mailSendService;
    private final AdministratorService administratorService;

    //관리자 회원가입 폼
    @GetMapping("/signup")
    public String adminSignupForm(@ModelAttribute("requestAdmSignup") RequestAdmSignup requestAdmSignup) {
        return "auth/adminSignup";
    }

    //관리자 회원가입
    @PostMapping("/signup")
    public String adminSignup(@ModelAttribute("requestAdmSignup") @Valid RequestAdmSignup requestAdmSignup, Errors errors) {
        AdministratorDTO admin = new AdministratorDTO();

        if(errors.hasErrors()) {
            return "auth/adminSignup";
        }

        try {
            admin.setAdmName("admin_" + requestAdmSignup.getAdmName());
            admin.setAdmId(requestAdmSignup.getAdmId());
            admin.setAdmPass(requestAdmSignup.getAdmPass());
            admin.setAdmEmail(requestAdmSignup.getAdmEmail());
            admin.setSecuritycode(requestAdmSignup.getSecuritycode());

            administratorService.adminSignup(admin);

            //이메일 인증 메일 발송
            String authKey = mailSendService.sendAdmAuthMail(admin.getAdmEmail());

            //이메일 인증키 업데이트
            administratorService.updateAdmAuthkey(admin.getAdmEmail(), authKey);

            return "check/signupCheck";
        }catch(AlreadyExistEmailException e) {
            errors.rejectValue("admEmail", "alreadyExistEmail");
            return "auth/adminSignup";
        }catch(AlreadyExistIdException e) {
            errors.rejectValue("admId", "alreadyExistId");
            return "auth/adminSignup";
        }catch(SecurityCodeNotMatchingException e) {
            errors.rejectValue("securitycode", "securityCodeNotMatching");
            return "auth/adminSignup";
        }
    }

    //이메일 인증 확인
    @GetMapping("/confirm")
    public String admConfirm(@RequestParam(defaultValue = "") String adm_email) {

        administratorService.updateAdmStatus(adm_email);

        return "check/emailCheck";
    }
}
