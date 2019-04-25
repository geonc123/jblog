package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CategoryDao;
import com.javaex.vo.CategoryVo;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	public CategoryVo insertCategory(CategoryVo categoryVo) {
		System.out.println("let's go service");
		categoryDao.insertCategory(categoryVo);
		System.out.println(categoryVo.getCateNo());
		CategoryVo cate = categoryDao.selectOne(categoryVo.getCateNo());
		return cate;
	}
	
	public List<CategoryVo> getList(String id){
		List<CategoryVo> list = categoryDao.selectList(id);
		return list;
	}
	
	public int deleteCategory(int cateNo) {
		int count = categoryDao.deleteCategory(cateNo);
		return count;
	}
}
