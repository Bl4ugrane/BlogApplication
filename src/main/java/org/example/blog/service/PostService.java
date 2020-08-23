package org.example.blog.service;


import org.example.blog.model.Post;
import org.example.blog.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;



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

    public Page<Post> findByTitle(String title, Pageable pageable) {
        return postRepository.findByTitle(title,pageable);
    }

     public boolean existsById(Long id) {
        return postRepository.existsById(id);
     }

    public Page<Post> findAll(Pageable pageable){
        return postRepository.findAll(pageable);
    }

    public Post savePost(Post user){
        return postRepository.save(user);
    }

    public void deleteById(Long id){
        postRepository.deleteById(id);
    }

}
