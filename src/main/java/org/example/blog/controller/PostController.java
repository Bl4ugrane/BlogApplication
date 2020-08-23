package org.example.blog.controller;

import org.example.blog.model.Post;
import org.example.blog.model.User;
import org.example.blog.repository.PostRepository;
import org.example.blog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.data.domain.Pageable;
import java.io.File;
import java.io.IOException;
import java.util.UUID;



@Controller
@RequestMapping("/posts")
public class PostController {

    @Autowired
    private final PostService postService;

    @Autowired
    private final PostRepository postRepository;

    @Value("${upload.path}")
    private String uploadPath;

    public PostController(PostRepository postRepository, PostService postService, PostRepository postRepository1) {
        this.postService = postService;
        this.postRepository = postRepository1;
    }

    @GetMapping
    public String main(@RequestParam(required = false,defaultValue = "") String title,
                       @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable,
                       Model model) {
        Page<Post> page;

        if (title != null && !title.isEmpty()) {
            page = postService.findByTitle(title,pageable);
        } else {
            page = postService.findAll(pageable);
        }

        model.addAttribute("page", page);
        model.addAttribute("url", "/posts");
        model.addAttribute("title", title);
        return "postList";
    }

    @GetMapping("/add")
    public String post() {
        return "postAdd";
    }

    @PostMapping("/add")
    public String post(@AuthenticationPrincipal User user,
                       @RequestParam String title, @RequestParam String description,
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

        postService.savePost(post);
        return "redirect:/posts";
    }

    @GetMapping("{id}")
    public String postViewPage(@PathVariable("id") Long id, Model model) {

        if(!postService.existsById(id)) {
            return "redirect:/posts";
        }
        Post post = postService.findById(id);
        model.addAttribute("post", post);
        return "post";
    }


    @GetMapping("/edit/{id}")
    public String postEditPage(@PathVariable("id") Long id, Model model) {

        if(!postService.existsById(id)) {
            return "redirect:/posts";
        }
        Post post = postService.findById(id);
        model.addAttribute("post", post);
         return "postEdit";
    }


    @PostMapping("/edit/{post}")
    public String postEdit(Post post) {
        postService.savePost(post);
        return "redirect:/posts";
    }


    @PostMapping("/remove/{id}")
    public String postDelete(@PathVariable("id") Long id) {
        postService.deleteById(id);
        return "redirect:/posts";
    }

}
