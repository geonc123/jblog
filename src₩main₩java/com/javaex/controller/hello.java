package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hello")
public class hello{

	@RequestMapping( "/hello")
	public String hello2(){
		System.out.println("/hellospring/hello");
		return "/WEB-INF/views/index.jsp";
	}
}