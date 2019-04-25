package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BlogVo;

@Repository
public class BlogDao {

	@Autowired
	private SqlSession sqlSession;
	
	public BlogVo selectOne(String id) {
		BlogVo blogVo = sqlSession.selectOne("blog.selectByUserName", id);
		return blogVo;
	}
	
	public int update(BlogVo blogVo) {
		System.out.println(blogVo.toString());
		int count = sqlSession.update("blog.update", blogVo);
		return count;
	}
	
	public int insertBlog(String id) {
		int count = sqlSession.insert("blog.insertBlog", id);
		return count;
	}
}
