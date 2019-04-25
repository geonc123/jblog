package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UsersService;
import com.javaex.vo.UsersVo;

@Controller
@RequestMapping("/users")
public class userController {

	@Autowired
	private UsersService usersService;

	@RequestMapping("/joinform")
	public String joinForm() {
		System.out.println("join form start");
		return "user/joinForm";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute UsersVo usersVo) {
		System.out.println(usersVo.toString());
		usersService.join(usersVo);
		return "redirect:/users/joinsuccess";
	}

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean chectEmail(String id) {
		System.out.println(id);
		boolean result = usersService.checkId(id);
		return result;
	}

	@RequestMapping("/joinsuccess")
	public String joinSuccess() {
		System.out.println("join success!!");
		return "user/joinSuccess";
	}

	@RequestMapping("/loginform")
	public String loginForm() {
		return "user/loginForm";
	}

	@RequestMapping(value = "/login", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session) {
		System.out.println(id);
		System.out.println(password);
		UsersVo usersVo2 = usersService.logIn(id, password);
		System.out.println(usersVo2.toString());
		
		// 세션은 includes 에서 달아보자 
		return "redirect:/main/main";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		System.out.println("log out");
		return "redirect:/users/loginform";
	}
}
