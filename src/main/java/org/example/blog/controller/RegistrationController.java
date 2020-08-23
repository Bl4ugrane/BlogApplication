package org.example.blog.controller;


import org.example.blog.model.User;
import org.example.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;




@Controller
public class RegistrationController {

    @Autowired
    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/registration")
    public String registration() {

        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model) {

           if (!userService.addUser(user)) {
               model.addAttribute("message","Такой пользователь уже существует");
               return "registration";
           }

        return "redirect:/login";
    }

}
