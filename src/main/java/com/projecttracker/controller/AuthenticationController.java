package com.projecttracker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthenticationController {

    @GetMapping("/dologin")
    public String login() {
        return "auth/login";
    }
}
