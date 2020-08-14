package org.example.blog.controller;

import org.example.blog.model.Post;
import org.example.blog.model.User;
import org.example.blog.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


@Controller
public class MainController {

    @Autowired
    private final PostRepository postRepository;

    @Value("${upload.path}")
    private String uploadPath;

    public MainController(PostRepository postRepository) {
        this.postRepository = postRepository;
    }


    @GetMapping("/")
    public String greeting() {

        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false,defaultValue = "") String title, Model model) {
        Iterable<Post> posts;

        if (title != null && !title.isEmpty()) {
            posts = postRepository.findByTitle(title);
        } else {
            posts = postRepository.findAll();
        }

        model.addAttribute("posts", posts);
        model.addAttribute("title", title);
        return "main";
    }

    @GetMapping("/post/add")
    public String post() {
        return "post-add";
    }

    @PostMapping("/post/add")
    public String post(@AuthenticationPrincipal User user,
            @RequestParam String title,@RequestParam String description,
                      @RequestParam  String text,
                       @RequestParam("file") MultipartFile file,
                       Model model ) throws IOException {

        Post post = new Post(title,description, text,user);
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadFolder = new File(uploadPath);

            if (!uploadFolder.exists()) {
                uploadFolder.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            post.setFilename(resultFilename);
            file.transferTo(new File(uploadPath + "/" + resultFilename));
        }

        postRepository.save(post);

        return "redirect:/main";
    }


}