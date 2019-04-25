package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CategoryVo;

@Repository
public class CategoryDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertCategory(CategoryVo categoryVo) {
		int count = sqlSession.insert("category.insertcategory", categoryVo);
		System.out.println(categoryVo.getCateNo());
		return count;
	}
	
	public List<CategoryVo> selectList(String id){
		List<CategoryVo> list = sqlSession.selectList("category.selectList", id);
		return list;
	}
	
	public CategoryVo selectOne(int cateNo) {
		CategoryVo categoryVo = sqlSession.selectOne("category.selectByCateNo", cateNo);
		return categoryVo;
	}
	
	public int deleteCategory(int cateNo) {
		int count = sqlSession.delete("category.deleteCategory", cateNo);
		return count;
	}
	
	public List<CategoryVo> selectForPost(){
		List<CategoryVo> list = sqlSession.selectList("category.selectForPost");
		return list;
	}
}
