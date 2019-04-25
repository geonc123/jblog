package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.PostService;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.PostVo;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;
	
	@RequestMapping(value = "/write", method = {RequestMethod.POST, RequestMethod.GET})
	public String writePost(@RequestParam("cateNo") int cateNo,
							@RequestParam("postContent") String postContent,
							@RequestParam("postTitle") String postTitle) {
		System.out.println("wrtie post");
		PostVo postVo = new PostVo();
		postVo.setCateNo(cateNo);
		postVo.setPostContent(postContent);
		postVo.setPostTitle(postTitle);
		System.out.println(postVo.toString());
		postService.insertPost(postVo);
		System.out.println("write complete");
		return "redirect:/main/main" ;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectforpost", method = RequestMethod.POST)
	public List<CategoryVo> selectForPost(){
		List<CategoryVo> list = postService.selectForPost();
		return list;
	}
	
}
