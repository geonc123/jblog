package com.javaex.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.javaex.service.UsersService;
import com.javaex.vo.UsersVo;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UsersService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UsersVo userVo = userService.logIn(id, password);
		if (userVo == null) {
			response.sendRedirect(request.getContextPath() + "/users/loginform?result=fail");
			return false;
		}
		HttpSession session = request.getSession();
		session.setAttribute("authUser", userVo);
		response.sendRedirect(request.getContextPath() + "/main/main");
		return false;
	}
}
