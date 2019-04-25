package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BlogDao;
import com.javaex.dao.UsersDao;
import com.javaex.vo.UsersVo;

@Service
public class UsersService {

	@Autowired
	private UsersDao usersDao;
	@Autowired
	private BlogDao blogDao;
	
	public int join(UsersVo usersVo) {
		int count  = usersDao.insert(usersVo);
		blogDao.insertBlog(usersVo.getId());
		return count;
	}
	
	public boolean checkId(String id) {
		UsersVo usersVo = usersDao.selectOne(id);
		if(usersVo == null) {
			return true;
		}else {
			System.out.println(usersVo.toString());
			 return false;			
		}
		
	}
	
	public UsersVo logIn(String id , String password) {
		UsersVo usersVo = new UsersVo();
		usersVo.setId(id);
		usersVo.setPassword(password);
		UsersVo usersVo2 = usersDao.selectOne(usersVo);
		return usersVo2;
	}
}
