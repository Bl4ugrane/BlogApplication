package org.example.blog.service;


import org.example.blog.model.Post;
import org.example.blog.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;



@Service
public class PostService {

    @Autowired
    private final PostRepository postRepository;

    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public Post findById(Long id){
        return postRepository.getOne(id);
    }

    public List<Post> findByTitle(String title) {
        return postRepository.findByTitle(title);
    }

     public boolean existsById(Long id) {
        return postRepository.existsById(id);
     }

    public List<Post> findAll(){
        return postRepository.findAll();
    }

    public Post savePost(Post user){
        return postRepository.save(user);
    }

    public void deleteById(Long id){
        postRepository.deleteById(id);
    }

}
