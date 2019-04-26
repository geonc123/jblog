package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.interceptor.Auth;
import com.javaex.interceptor.AuthUser;
import com.javaex.service.BlogService;
import com.javaex.vo.BlogVo;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.CommentsVo;
import com.javaex.vo.PostVo;

@Controller
@RequestMapping("/blog")
public class blogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/{id}")
	public String main(@PathVariable(value = "id") String id , Model model ) {
		System.out.println("blog main");
		System.out.println(id);
		BlogVo blogvo2 = blogService.getBlog(id);
		
		System.out.println(blogvo2.getlogoFile());
		model.addAttribute("blogvo", blogvo2);
		return "blog/blog-main";
	}
	
	@RequestMapping("/{id}/basic")
	public String basic(@PathVariable(value = "id") String id, Model model) {
		System.out.println("blog admin basic start ");
		System.out.println(id);
		BlogVo blogvo2 = blogService.getBlog(id);
		model.addAttribute("blogvo", blogvo2);
		return "blog/admin/blog-admin-basic";
	}
	
	@RequestMapping("/modifybasic")
	public String modifyBasic(	@RequestParam("id") String id,
								@RequestParam("file") MultipartFile file,
								@RequestParam("blogTitle") String blogTitle) {
		System.out.println(file.getOriginalFilename());
		System.out.println("blog admin 1111111modify basic start ");
		blogService.restore(file, id, blogTitle);
		return "redirect:/main/main" ;
	}
	
	@RequestMapping("/{id}/cate")
	public String cate(@PathVariable(value = "id") String id, Model model) {
		System.out.println("blog-admin-cate start");
		System.out.println(id);
		BlogVo blogvo2 = blogService.getBlog(id);
		model.addAttribute("blogvo", blogvo2);
		return "blog/admin/blog-admin-cate";
	}
	
	@RequestMapping("/{id}/write")
	public String write(@PathVariable(value = "id") String id, Model model) {
		System.out.println("blog-admin-write start");
		System.out.println(id);
		BlogVo blogvo2 = blogService.getBlog(id);
		model.addAttribute("blogvo", blogvo2);
		return "blog/admin/blog-admin-write";
	}
	
	@ResponseBody
	@RequestMapping(value = "/categoryList", method = RequestMethod.POST)
	public List<CategoryVo> selectByCategory(){
		List<CategoryVo> list = blogService.selectBycategory();
		System.out.println(list.toString());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/postbycateno", method = RequestMethod.POST)
	public List<PostVo> selectPostByCateNo(@RequestParam("cateNo") int cateNo){
		List<PostVo> list = blogService.selectPostByCateNo(cateNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/posttitle", method = RequestMethod.POST)
	public List<PostVo> selectPostTitleByCateNo(@RequestParam("cateNo") int cateNo){
		List<PostVo> list = blogService.selectPostTitleByCateNo(cateNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/postcontent", method = RequestMethod.POST)
	public List<PostVo> selectPostContentByCateNo(@RequestParam("cateNo") int cateNo,
												  @RequestParam("postNo") int postNo){
		System.out.println("selectPostContentByCateNo start");
		System.out.println(postNo);
		System.out.println(cateNo);
		List<PostVo> list = blogService.selectByPostContent(cateNo, postNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getcommentsbycmtno", method = RequestMethod.POST)
	public CommentsVo getCommentsByCmtNo(@RequestParam("postNo") int postNo,
										 @RequestParam("userNo") int userNo,
										 @RequestParam("cmtContent") String cmtContent){
		System.out.println("getCommentsByCmtNo start");
		CommentsVo commentsVo = blogService.insertIntoComments(postNo, userNo, cmtContent);
		return commentsVo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/commentslist", method = RequestMethod.POST)
	public List<CommentsVo> commentsList(@RequestParam("postNo") int postNo){
		System.out.println("commentsList start");
		System.out.println(postNo);
		List<CommentsVo> list = blogService.selectCommentsList(postNo);
		System.out.println(list.toString());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getlistpaging", method = RequestMethod.POST)
	public Map<String, Object> getListPaging(@RequestParam("cateNo") int cateNo,
											@RequestParam("pageNo") int pageNo){
		System.out.println("get List Pagig");
		System.out.println();
		Map<String, Object> map = blogService.selectPostPaging(cateNo, pageNo);
		return map;
		
	}
}
