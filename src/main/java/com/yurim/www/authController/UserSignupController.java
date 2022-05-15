package com.yurim.www.authController;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AlreadyExistEmailException;
import com.yurim.www.exception.AlreadyExistIdException;
import com.yurim.www.service.UserService;
import com.yurim.www.vo.RequestSignup;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/signup")
public class UserSignupController {

    private final UserService userService;

    /**
     * signup Form
     */
    @GetMapping
    public String requestSignup(@ModelAttribute("requestSignup") RequestSignup requestSignup) {
        return "auth/signup";
    }

    /**
     * signup
     */
    @PostMapping
    public String responseSignup(
            @Valid @ModelAttribute("requestSignup") RequestSignup requestSignup,
            Errors errors){
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
        }catch (AlreadyExistEmailException e){
            errors.rejectValue("commonError", "alreadyExistEmail");
            return "auth/signup";
        }catch(AlreadyExistIdException e) {
            errors.rejectValue("commonError", "alreadyExistId");
            return "auth/signup";
        }

        return "auth/signupCheck";
    }
}
