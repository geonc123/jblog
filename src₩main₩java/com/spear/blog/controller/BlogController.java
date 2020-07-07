package com.spear.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spear.blog.BlogNotFoundException;
import com.spear.blog.domain.Blog;
import com.spear.blog.repository.BlogRepository;

@RestController
public class BlogController {

	@Autowired
	BlogRepository blogRepository;
	
	BlogController(BlogRepository blogRepository){
		this.blogRepository = blogRepository;
	}
	
	@GetMapping("/blog")
	public List<Blog> all(){
		return blogRepository.findAll();
	}
	
	@PostMapping("/blog")
	Blog newBlog(@RequestBody Blog newBlog) {
		return blogRepository.save(newBlog);
	}
	
	@GetMapping("/blog/{id}")
	Blog one(@PathVariable Long id) {
		return blogRepository.findById(id).orElseThrow(() -> new BlogNotFoundException(id));
	}
	
	@PutMapping("/blog/{id}")
	Blog replaceBlog(@RequestBody Blog newBlog, @PathVariable Long id) {
		return blogRepository.findById(id).map(blog -> 
			{
				blog.setTitle(newBlog.getTitle());
				blog.setLogoFile(newBlog.getLogoFile());
				return blogRepository.save(blog);
			}).orElseGet(() -> {
				newBlog.setId(id);
				return blogRepository.save(newBlog);
			});
	}
	
	@DeleteMapping("/blog/{id}")
	void deleteBlog(@PathVariable Long id) {
		blogRepository.deleteById(id);
	}
}
