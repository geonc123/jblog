package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CommentsVo;
import com.javaex.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert(PostVo postVo) {
		int count = sqlSession.insert("post.insertpost", postVo);
		return count;
	}
	
	public List<PostVo> selectByCateNo(int cateNo){
		List<PostVo> list = sqlSession.selectList("post.selectByCateNo", cateNo);
		return list;
	}
	
	public List<PostVo> selectPostTitle(int cateNo){
		List<PostVo> list = sqlSession.selectList("post.selectPostTitle", cateNo);
		return list;
	}
	
	public List<PostVo> selectByPostContent(Map<String, Object> map){
		List<PostVo> list = sqlSession.selectList("post.selectPostTitle", map);
		return list;
	}
	
	
	public List<PostVo> selectPaging(Map<String, Object> map){
		List<PostVo> list = sqlSession.selectList("post.selectPostPaging", map);
		return list;
	}
	
	public int countPost(int cateNo) {
		int count = sqlSession.selectOne("post.countPost", cateNo);
		return count;
	}
}
