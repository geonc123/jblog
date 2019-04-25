package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UsersVo;

@Repository
public class UsersDao {

	@Autowired
	private SqlSession sqlSession;

	public int insert(UsersVo usersVo) {
		int count = sqlSession.insert("users.insert", usersVo);
		return count;
	}
	
	public UsersVo selectOne(String id) {
		UsersVo usersVo = sqlSession.selectOne("users.selectById", id);
		return usersVo;
	}
	
	public UsersVo selectOne(UsersVo usersVo) {
		UsersVo usersVo2 = sqlSession.selectOne("users.selectByIdAndPassword", usersVo);
		return usersVo2;
	}
}
