package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.BlogDao;
import com.javaex.dao.CategoryDao;
import com.javaex.dao.CommentsDao;
import com.javaex.dao.PostDao;
import com.javaex.vo.BlogVo;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.CommentsVo;
import com.javaex.vo.PostVo;

@Service
public class BlogService {

	@Autowired
	private BlogDao blogDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private PostDao postDao;
	@Autowired
	private CommentsDao commentsDao;
	
	
	public String restore(MultipartFile file, String id, String blogTitle) {
		String saveDir = "/Users/thisisspear/Desktop/upload";

		// oreginame filename
		String orgName = file.getOriginalFilename();
		System.out.println(orgName);
		// 확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println(exName);

		// 저장 파일명
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println(saveName);

		// filepath
		String filePath = saveDir + "/" + saveName;
		System.out.println(filePath);

		// filesize
		long filesize = file.getSize();
		System.out.println("filesize: " + filesize);
		System.out.println(filePath);
		// dao 에 넣기위해 만든 것들 
		BlogVo blogVo = new BlogVo();
		blogVo.setlogoFile(saveName);
		blogVo.setId(id);
		blogVo.setBlogTitle(blogTitle);
	System.out.println(blogVo.toString());
		 blogDao.update(blogVo);
		 
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(saveDir + "/" + saveName);
			BufferedOutputStream bout = new BufferedOutputStream(out);

			bout.write(fileData);

			if (bout != null) {
				bout.close();
			}

		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return filePath;
	}
	
	public BlogVo getBlog(String id) {
		BlogVo blogVo = blogDao.selectOne(id);
		return blogVo;
	}
	
	public List<CategoryVo> selectBycategory(){
		List<CategoryVo> list = categoryDao.selectForPost();
		return list;
	}
	
	public List<PostVo> selectPostByCateNo(int cateNo){
		List<PostVo> list = postDao.selectByCateNo(cateNo);
		return list;
	}
	
	public List<PostVo> selectPostTitleByCateNo(int cateNo){
		List<PostVo> list = postDao.selectByCateNo(cateNo);
		return list;
	}
	
	public List<PostVo> selectByPostContent(int cateNo, int postNo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateNo", cateNo);
		map.put("postNo", postNo);
		List<PostVo> list = postDao.selectByPostContent(map);
		return list;
	}
	
	public CommentsVo insertIntoComments(int postNo, int userNo , String cmtContent ) {
		CommentsVo commentsVo = new CommentsVo();
		commentsVo.setPostNo(postNo);
		commentsVo.setUserNo(userNo);
		commentsVo.setCmtContent(cmtContent);
		commentsDao.insertInComment(commentsVo);
		System.out.println(commentsVo.getCmtNo());
		CommentsVo commentsVo2 = commentsDao.selectByCmtNo(commentsVo.getCmtNo());
		return commentsVo2;
	}
	
	public List<CommentsVo> selectCommentsList(int postNo){
		List<CommentsVo> list = commentsDao.selectList(postNo);
		return list;
	}
	
	public Map<String, Object> selectPostPaging(int cateNo , int pageNo){
		int listSize = 3 ;
		int pageNo1 = 1+listSize*(pageNo-1);
		int pageNo2 = listSize*pageNo;
		int countPage = postDao.countPost(cateNo);
		int maxPage = (int)Math.ceil((double)countPage/listSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo1", pageNo1);
		map.put("pageNo2", pageNo2);
		map.put("cateNo", cateNo);
		List<PostVo> list = postDao.selectPaging(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("maxPage", maxPage);
		return map2;
	}
	
}
