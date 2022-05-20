package com.yurim.www.Controller;

import com.yurim.www.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController {

    private final UserService userService;

    @GetMapping
    public String mainForm(){
        return "main";
    }

    @GetMapping("/search")
    public String search(@RequestParam(defaultValue = "") String query, Model model) {
        model.addAttribute("query", query);
        return "search";
    }
}
