package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CommentsVo;

@Repository
public class CommentsDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertInComment(CommentsVo commentsVo) {
		int count = sqlSession.insert("comments.insertInComments", commentsVo);
		return count;
	}
	
	public CommentsVo selectByCmtNo(int cmtNo) {
		CommentsVo commentsVo = sqlSession.selectOne("comments.selectByCmtNo", cmtNo);
		return commentsVo;
	}
	
	public List<CommentsVo> selectList(int postNo){
		List<CommentsVo> list = sqlSession.selectList("comments.selectList", postNo);
		return list;
	}

}
