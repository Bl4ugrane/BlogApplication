package org.example.blog.controller;


import org.example.blog.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;




@Controller
public class MainController {

    @GetMapping("/")
    public String home(){
        return "home";
    }

}