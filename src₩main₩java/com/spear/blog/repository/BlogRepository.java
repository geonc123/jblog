package com.spear.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spear.blog.domain.Blog;

public interface BlogRepository extends JpaRepository<Blog, Long>{
	
}