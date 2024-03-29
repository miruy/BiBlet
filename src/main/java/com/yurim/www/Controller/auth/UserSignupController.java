package com.yurim.www.Controller.auth;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AlreadyExistEmailException;
import com.yurim.www.exception.AlreadyExistIdException;
import com.yurim.www.service.MailSendService;
import com.yurim.www.service.MainService;
import com.yurim.www.service.UserService;
import com.yurim.www.vo.RequestSignup;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/signup")
public class UserSignupController {
    private final UserService userService;
    private final MailSendService mailSendService;
    private final MainService mainService;

    //회원가입 폼
    @GetMapping
    public String requestSignup(@ModelAttribute("requestSignup") RequestSignup requestSignup, Model model) {
        //총 코멘트 수(footer)
        model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        return "auth/signup";
    }

    //회원가입
    @PostMapping
    public String responseSignup(@ModelAttribute("requestSignup") @Valid RequestSignup requestSignup, Errors errors){
        UserDTO signupUser = new UserDTO();

        if(errors.hasErrors()) {
            return "auth/signup";
        }

        try{
            signupUser.setName(requestSignup.getName());
            signupUser.setId(requestSignup.getId());
            signupUser.setPass(requestSignup.getPass());
            signupUser.setEmail(requestSignup.getEmail());

            userService.userSignup(signupUser);

            //이메일 확인 메일 발송 - random key 발급
            String authKey = mailSendService.sendAuthMail(signupUser.getEmail());

            signupUser.setAuthKey(authKey);

            //authKey 저장
            userService.updateKey(signupUser.getEmail(), signupUser.getAuthKey());

            return "check/signupCheck";
        }catch (AlreadyExistEmailException e){
            errors.rejectValue("email", "alreadyExistEmail");
            return "auth/signup";
        }catch(AlreadyExistIdException e) {
            errors.rejectValue("id", "alreadyExistId");
            return "auth/signup";
        }
    }

    //이메일 인증 확인
    @GetMapping("/emailCheck")
    public String emailCheck(@ModelAttribute("requestSignup") RequestSignup requestSignup, Model model) {

        String authKey = userService.selectKey(requestSignup.getEmail());
        userService.updateAuthStatus(requestSignup.getEmail(), authKey);

        //총 코멘트 수(footer)
        model.addAttribute("totalCommentCount", mainService.totalCommentCount());
        return "check/emailCheck";
    }
}
