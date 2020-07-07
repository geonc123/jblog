package com.spear.blog.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.spear.blog.domain.Post;

@RepositoryRestResource(collectionResourceRel = "post" , path = "post")
public interface PostRepository extends PagingAndSortingRepository<Post, Long>{

	List<Post> findByTitle(@Param("title") String title);
}
