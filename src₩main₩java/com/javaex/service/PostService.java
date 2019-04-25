package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CategoryDao;
import com.javaex.dao.PostDao;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.PostVo;

@Service
public class PostService {

	@Autowired
	private PostDao postDao;
	@Autowired
	private CategoryDao categoryDao;
	
	public int insertPost(PostVo postVo) {
		int count = postDao.insert(postVo);
		return count;
	}
	
	public List<CategoryVo> selectForPost(){
		List<CategoryVo> list = categoryDao.selectForPost();
		return list;
	}
}
