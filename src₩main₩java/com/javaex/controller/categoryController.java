package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.CategoryService;
import com.javaex.vo.CategoryVo;

@Controller
@RequestMapping("/cate")
public class categoryController {

	@Autowired
	private CategoryService categoryService;
	
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public CategoryVo insertCategory(@RequestParam("description") String description,
									@RequestParam("id") String id,
									@RequestParam("cateName") String cateName) {
		CategoryVo categoryVo = new CategoryVo();
		categoryVo.setCateName(cateName);
		categoryVo.setId(id);
		categoryVo.setDescription(description);
		System.out.println(categoryVo.toString());
		CategoryVo categoryVo2 = categoryService.insertCategory(categoryVo);
		System.out.println(categoryVo2.toString());
		return categoryVo2;
	}
	
	@ResponseBody
	@RequestMapping(value = "/list", method = {RequestMethod.POST,RequestMethod.GET})
	public List<CategoryVo> getList(@RequestParam("id") String id){
		List<CategoryVo> list = categoryService.getList(id);
		System.out.println("get List");
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method =RequestMethod.POST )
	public int deleteCategory(@RequestParam("cateNo") int cateNo) {
		System.out.println(cateNo);
		int count = categoryService.deleteCategory(cateNo);
		return count;
	}
}
