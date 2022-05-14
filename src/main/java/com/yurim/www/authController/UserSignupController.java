package com.yurim.www.authController;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.repository.UserMapper;
import com.yurim.www.vo.RequestSignup;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/signup")
public class UserSignupController {

    private final UserMapper userMapper;

    @GetMapping
    public String requestSignup(@ModelAttribute("requestSignup") RequestSignup requestSignup) {
        return "auth/signup";
    }

    @PostMapping
    public String responseSignup(@ModelAttribute("requestSignup") RequestSignup requestSignup, Errors errors){
        System.out.println("requestSignup.name" + requestSignup.getName());
        System.out.println("requestSignup.id" + requestSignup.getId());
        System.out.println("requestSignup.pass" + requestSignup.getPass());
        System.out.println("requestSignup.email" + requestSignup.getEmail());

        UserDTO signupUser = new UserDTO();
        signupUser.setName(requestSignup.getName());
        signupUser.setId(requestSignup.getId());
        signupUser.setPass(requestSignup.getPass());
        signupUser.setEmail(requestSignup.getEmail());
        signupUser.setOriginPic("profile.png");

        userMapper.userSignup(signupUser);
        return "auth/signupCheck";
    }
}
