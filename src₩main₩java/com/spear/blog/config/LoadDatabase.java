package com.spear.blog.config;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.spear.blog.domain.Blog;
import com.spear.blog.domain.Post;
import com.spear.blog.repository.BlogRepository;
import com.spear.blog.repository.PostRepository;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class LoadDatabase {

	@Autowired
	PostRepository postRepository;
	
	@Autowired
	BlogRepository blogRepository;
	
	@Bean
	 public CommandLineRunner blogList() {
	   return (args) -> {
		   int Blog_no = 1;
		   while(Blog_no < 10) {
			   log.info("Post Preloading"+blogRepository.save(new Blog("thisisstory"+Blog_no,"thisIsFilePath1"+Blog_no++))); 
		   }
	
		   int Post_no = 1;
		   while(Post_no < 10) {
			   log.info("Post Preloading"+postRepository.save(new Post("thisistitle"+Post_no,"thisiscontent"+Post_no++, LocalDateTime.now()))); 
		   }		   
	   };
	 }
}
