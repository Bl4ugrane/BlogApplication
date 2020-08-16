package org.example.blog.controller;

import org.example.blog.model.Post;
import org.example.blog.model.User;
import org.example.blog.repository.PostRepository;
import org.example.blog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.UUID;





@Controller
@RequestMapping("/posts")
public class PostController {

    @Autowired
    private final PostRepository postRepository;

    @Autowired
    private final PostService postService;

    @Value("${upload.path}")
    private String uploadPath;

    public PostController(PostRepository postRepository, PostService postService) {
        this.postRepository = postRepository;
        this.postService = postService;
    }



    @GetMapping
    public String main(@RequestParam(required = false,defaultValue = "") String title, Model model) {
        Iterable<Post> posts;

        if (title != null && !title.isEmpty()) {
            posts = postRepository.findByTitle(title);
        } else {
            posts = postRepository.findAll();
        }

        model.addAttribute("posts", posts);
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

        postRepository.save(post);

        return "redirect:/posts";
    }

    @GetMapping("{post}")
    public String postViewPage(@PathVariable Post post, Model model) {
        model.addAttribute("post", post);
        return "post";
    }


    @GetMapping("/edit/{id}")
    public String postEditPage(@PathVariable("id") Long id, Model model) {

        if(!postRepository.existsById(id)) {
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
