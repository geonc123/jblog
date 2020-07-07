package com.spear.blog;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

public class BlogNotFoundAdvice {

	@ResponseBody
	@ExceptionHandler(BlogNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	String blogNotFoundHandler(BlogNotFoundException exception) {
		return exception.getMessage();
	}
}
