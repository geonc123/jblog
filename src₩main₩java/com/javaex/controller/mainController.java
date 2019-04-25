package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class mainController {

	
	@RequestMapping("/main")
	public String main() {
		System.out.println("main");
		return "main/index";
	}
}
